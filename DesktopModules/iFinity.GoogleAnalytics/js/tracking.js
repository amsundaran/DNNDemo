//namespace object
var ifty_Tracking = ifty_Tracking || {};

$(document).ready(function() {
    ifty_Tracking.identifyingLinks = false; //scope level whether tracking or identifying links to click on 
    //identify all links on the page for click tracking
    jQuery('body').delegate('a', 'click', function () {
        ifty_Tracking.utils.logDebug("tracked click");
        ifty_Tracking.trackIfRequired(this, ifty_Tracking.identifyingLinks);
        return !ifty_Tracking.identifyingLinks; //if identifing links, cancel action so clicks don't work
    });
});
//ifty_Tracking var/function defs
ifty_Tracking.identifyingLinks = ifty_Tracking.identifyingLinks || false;
ifty_Tracking.logAnalytics = ifty_Tracking.logAnalytics ||  false;
ifty_Tracking.trackExternals = ifty_Tracking.trackExternals || false;

///calls tracking script if clicked link is being tracked
ifty_Tracking.trackIfRequired = function (el, justIdentifying) {
    var tracked = false;
    //don't track elements with class of 'notrack'
    if (el != null && el.className.indexOf("notrack") < 0) {
        //check for list of tracked events 
        if (typeof (ifty_Tracking.trackDbEvents) != "undefined") {
            //get the inner text
            var value = jQuery.trim(el.innerText);
            var elId = el.id;
            var classes = el.className.split(/\s+/);
            if (value == "" || value == null) {
                var elc = el.lastChild;
                if (elc != null) {
                    value = jQuery.trim(elc.innerText);
                }
            }

            //look up by property
            var tracking = ifty_Tracking.getTrackedEvent(value, elId, classes);
            if (tracking != null) {
                ifty_Tracking.utils.logDebug("Tracking " + tracking.matchValue + " [" + tracking.matchType + "]");
                //when just identifying, don't call tracking, just load popup
                if (justIdentifying) {
                    ifty_Tracking.showTrackableDialog(value, tracking.category, tracking.event, tracking.label);
                }
                else {
                    //track the click as an event
                    ifty_Tracking.trackEvent(el, tracking.category, tracking.event, tracking.label, tracking.labelSelector, tracking.value, tracking.valueSelector);
                    tracked = true;
                }
            }
            else {
                if (ifty_Tracking.logAnalytics) {
                    if (elId == null) elId = "null";
                    if (classes == null) classes = ["null"];
                    ifty_Tracking.utils.logDebug("Not tracking [val:" + value + ", id:" + elId + ", classes:" + classes.join());
                }
                if (justIdentifying)
                    ifty_Tracking.showTrackableDialog(value, null, null, null);
            }
        }
        if (!tracked) {
            if (ifty_Tracking.trackExternals) {
                var url = el.href;
                var dm = ifty_Tracking.utils.getHostName(url);
                var thisDm = document.location.hostname;
                if (typeof(dm) != "undefined" &&  typeof(thisDm) != "undefined" && dm.toLowerCase() != thisDm.toLowerCase()) {
                    //is external link
                    ifty_Tracking.trackEvent(el, 'Outbound Links', dm, url, null, null, null);
                    //set tiny delay on opening new link to allow time to register click
                    setTimeout('document.location = "' + url + '"', 100);
                }
            }
        }

    }
}
ifty_Tracking.trackEvent = function (el, category, event, label, labelSelector, value, valueSelector) {

    if ((label == "" || label == null) && labelSelector != "" && labelSelector != null) {
        label = ifty_Tracking.utils.getSelectedElementText(el, labelSelector);
    }
    var valInt = 0;
    if ((value == "" || value == null) && valueSelector != "" && valueSelector != null) {
        value = ifty_Tracking.utils.getSelectedElementText(el, valueSelector);
    }
    if (ifty_Tracking.utils.isNumeric(value))
        valInt = parseInt(value);
    if (ifty_Tracking.logAnalytics)
        alert('Analytics Tracked Event :' + category + ', ' + event + ',' + label + ',' + value);
    if (typeof (_gaq) != "undefined") {
        //push to google analytics
        _gaq.push(['_trackEvent', category, event, label, value]);
    }

}
ifty_Tracking.getTrackedEvent = function(value, id, classes) {
    var trackedEvent = null;
    if (value != null)
        trackedEvent = ifty_Tracking.identifyTrackedEvent(value, "text");
    if (trackedEvent == null && id != null)
        trackedEvent = ifty_Tracking.identifyTrackedEvent(id, "id");
    if (trackedEvent == null && classes != null && classes.length > 0) {
        for (var i = 0; i < classes.length; i++) {
            trackedEvent = ifty_Tracking.identifyTrackedEvent(classes[i], "class");
            if (trackedEvent != null) break;
        }
    }
    return trackedEvent;
}
ifty_Tracking.identifyTrackedEvent = function (matchValue, matchType) {
    var result = null;
    if (ifty_Tracking.trackDbEvents != null) {
        var tracking = ifty_Tracking.trackDbEvents.events[matchValue];
        if (tracking != null) {
            if (tracking.matchType == matchType)
                result = tracking;
        }
    }
    return result;
}

//utils namespace
ifty_Tracking.utils = ifty_Tracking.utils || {};
ifty_Tracking.utils.getValueOfElement = function(el) {
    var value = null;
    switch (el.tagName.toLowerCase()) {
        case "input":
        case "select":
        case "textarea":
            value = jQuery.trim(el.value);
            break;
        default:
            value = jQuery.trim(el.innerText);
            break;
    }
    if (value == null) {
        var childEl = el.lastChild;
        if (childEl != null && childEl != el)
            value = ifty_Tracking.utils.getValueOfElement(childEl);
    }
    return value;

}
ifty_Tracking.utils.getHostName = function (url) {
    var arr = url.split("/");
    if (arr.length)
        return arr[2];
    else
        return null;
}
ifty_Tracking.utils.splitSelectors = function (selector) {
    var arr = selector.split(">");
    if (arr.length)
        return arr;
    else
        return null;
}

ifty_Tracking.utils.logDebug = function (msg) {
    if (ifty_Tracking.logAnalytics && window.console && window.logDebug) {
        window.console.log(msg)
    }
}
ifty_Tracking.utils.isNumeric = function (input) {
    return (input - 0) == input && input.length > 0;
}
ifty_Tracking.utils.getSelectedElementText = function (el, selectors) {
    var text = null;
    var arr = ifty_Tracking.utils.splitSelectors(selectors);
    if (arr != null && arr.length > 0) {
        var clstSel = null, fndSel = null;
        if (arr.length > 0)
            clstSel = jQuery.trim(arr[0]);
        if (arr.length > 1)
            fndSel = jQuery.trim(arr[1]);
        //clstSel is closest val
        if (clstSel != null) {
            var textEls = null;
            if (fndSel != null)
                textEls = jQuery(el).closest(clstSel).find(fndSel);
            else
                textEls = jQuery(el).closest(clstSel);
            if (textEls != null && textEls.length) {
                text = ifty_Tracking.utils.getValueOfElement(textEls[0]);
            }
        }
    }
    return text;
}

ifty_Tracking.showTrackableDialog = function(value, category, event, label) {
    if (EventTrackingPage != null && EventTrackingPage != undefined) {
        //create new item from this
        var item = new Object();
        item.value = value;
        item.category = category;
        item.event = event;
        item.label = label;
        EventTrackingPage.showEventDialog(item);
    }
}
ifty_Tracking.trackable = function(fnToCall, eventName, member, event) {

    //invoke the function to call
    if (fnToCall != null)
        fnToCall(this);

    //setup the tracking values
    var category = "Social";
    var labelField = "DisplayName";
    var label = "Unknown";
    if (member != null) {
        //get the label from the member
        label = member[labelField]();
    }
    alert('tracking ' + category + ' for ' + label);


}


