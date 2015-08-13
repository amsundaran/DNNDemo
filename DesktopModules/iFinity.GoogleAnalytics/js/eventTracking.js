function EventTracking($, ko, settings) {
    var serviceFramework = settings.servicesFramework;
    var baseServicePath = serviceFramework.getServiceRoot('iFinity.GoogleAnalytics') + 'Settings/';
    var portalId = settings.portalId;
    var tabId = settings.tabId;
    var moduleId = settings.moduleId;
    var tabModuleId = settings.tabModuleId;
    var currentEvents = settings.currentEvents;
    var containerElement = null;

    function displayMessage(message, cssclass, ex, st) {
        var messageNode = null;
        if (typeof (ex) == "undefined" && typeof (st) == "undefined")
            messageNode = $("<div/>").addClass('dnnFormMessage ' + cssclass).text(message);
        else {
            message += message + "<br/>" + ex + "<br/>" + st;
            messageNode = $("<div/>").addClass('dnnFormMessage ' + cssclass).text(message);
        }
        $(containerElement).prepend(messageNode);
        messageNode.fadeOut(3000, 'easeInExpo', function () { messageNode.remove(); });
    };

    function TrackedEventsViewModel(initialData) {
        var self = this;
        self.currentEvents = currentEvents;
        self.trackedEvents = ko.observableArray($.map(initialData.trackedEvents, function (item) { return new TrackedEvent(item); }));
        self.portalExtraScript = ko.observable(initialData.portalExtraScript);
        self.tabExtraScript = ko.observable(initialData.tabExtraScript);
        self.tabExtraLocation = ko.observable(initialData.tabExtraLocation);
        self.portalExtraLocation = ko.observable(initialData.portalExtraLocation);
        self.selectedItem = ko.observable();
        self.setItem = function(item) {
            self.selectedItem(item);   
        };
        self.accept = function () {
            var item = self.selectedItem();
            if (item != null) {
                //check the list of current events to see if they need to be updated
                //this modifies the 'onpage' list of tracked events, so any adds/deletes/changes
                //are immediately reflected in the page, even before they are saved to the db
                //this is so they can be tested
                var trackedItem = self.currentEvents.events[item.matchValue()];
                if (trackedItem != null) {
                    trackedItem.category = item.category();
                    trackedItem.matchValue = item.matchValue();
                    trackedItem.matchType = item.matchType();
                    trackedItem.event = item.event();
                    trackedItem.label = item.label();
                    trackedItem.labelSelector = item.labelSelector();
                    trackedItem.value = item.value();
                    trackedItem.valueSelector = item.valueSelector();
                }
                else {
                    var newItem = new Object();
                    self.currentEvents.events[item.matchValue()] = newItem;
                    newItem.category = item.category();
                    newItem.matchValue = item.matchValue();
                    newItem.matchType = item.matchType();
                    newItem.event = item.event();
                    newItem.label = item.label();
                    newItem.labelSelector = item.labelSelector();
                    newItem.value = item.value();
                    newItem.valueSelector = item.valueSelector();
                }
            }
            //clear the selected item
            self.selectedItem("");
        };
        self.categoryList = ko.computed(function () {
            var cats = [];
            ko.utils.arrayForEach(self.trackedEvents(), function (trackedEvent) {
                var cat = trackedEvent.category();
                if (cat != null && cat != "") {
                    if (jQuery.inArray(cat, cats) < 0)
                        cats.push(cat);
                }
            });
            return cats;
        });
        self.cancel = function () {
            self.selectedItem("");
        };
        self.deleteItem = function (item) {
            self.trackedEvents.destroy(item);
            self.selectedItem("");
        };
        self.addEmptyItem = function () {
            var item = self.addNewItem('', '', '', '', '');
            self.selectedItem(item);
        };
        self.addNewItem = function (matchType, matchValue, category, event, label) {
            var newitem = new Object();
            newitem.matchType = matchType;
            newitem.matchValue = matchValue;
            newitem.category = category;
            newitem.event = event;
            newitem.label = label;
            newitem.isPortal = true;
            newitem.trackedEventId = self.getNewGuid();
            var te = new TrackedEvent(newitem);
            this.trackedEvents.push(te);
            return te;
        };
        self.findByMatchTypeAndValue = function (matchType, matchValue) {
            var array = this.trackedEvents();
            var found = null;
            for (var i = 0, j = array.length; i < j; i++) {
                var item = array[i];
                if (item.matchType() === matchType && item.matchValue() == matchValue) {
                    found = item;
                    break;
                }
            }
            return found;
        };
        //call back to the server to get a new guid
        self.getNewGuid = function () {
            var newGuid = "00000000-0000-0000-0000-000000000000";
            $.ajax({
                type: "GET",
                cache: false,
                url:  baseServicePath + "GetNewGuid",
                traditional: true,
                async:   false,
                beforeSend: serviceFramework.setModuleHeaders
            }).done(function (data) {
                if (typeof (data) != "undefined" && data != null){
                    newGuid = data;
                    }
                });
            return newGuid;
        };
        //save the targets on the page
        self.saveEventTargets = function () {

            var postingStr = JSON.stringify(ko.toJS(self.trackedEvents()));
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicePath + "PostPortalEvents/" + portalId + "/Tab/" + tabId,
                beforeSend: serviceFramework.setModuleHeaders,
                traditional: true,
                data: serviceFramework.getAntiForgeryProperty({ data: postingStr })
            }).done(function (data) {
                var result = jQuery.parseJSON(data);
                if (result.Result === "success") {
                    displayMessage(settings.saveSuccessText, "dnnFormSuccess");
                }
                else {
                    if (result.debug == true)
                        displayMessage(settings.serverErrorText, "dnnFormWarning", result.message, result.stackTrace);
                    else
                        displayMessage(settings.serverErrorText + result.message, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });
        };
        //save the portal script block
        self.savePortalExtraScript = function () {
            var postingObj = new Object();
            postingObj.scriptLocation = ko.toJS(self.portalExtraLocation());
            postingObj.scriptText = ko.toJS(self.portalExtraScript());
            var postingStr = JSON.stringify(postingObj);
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicePath + "PostExtraScript/" + portalId + "/Tab/" + tabId + "/Mid/" + moduleId,
                beforeSend: serviceFramework.setModuleHeaders,
                traditional: true,
                data: serviceFramework.getAntiForgeryProperty({ data: postingStr })
            }).done(function (data) {
                var result = jQuery.parseJSON(data);
                if (result.Result === "success") {
                    displayMessage(settings.saveSuccessText, "dnnFormSuccess");
                }
                else {
                    if (result.debug == true)
                        displayMessage(settings.serverErrorText, "dnnFormWarning", result.message, result.stackTrace);
                    else
                        displayMessage(settings.serverErrorText + result.message, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });

        };
        self.saveTabExtraScript = function () {
            var postingObj = new Object();
            postingObj.scriptLocation = ko.toJS(self.tabExtraLocation());
            postingObj.scriptText = ko.toJS(self.tabExtraScript());
            var postingStr = JSON.stringify(postingObj);
            $.ajax({
                type: "POST",
                cache: false,
                url: baseServicePath + "PostExtraScript/" + portalId + "/Tab/" + tabId + "/Mid/" + moduleId + "/TmId/" + tabModuleId,
                beforeSend: serviceFramework.setModuleHeaders,
                traditional: true,
                data: serviceFramework.getAntiForgeryProperty({ data: postingStr })
            }).done(function (data) {
                var result = jQuery.parseJSON(data);
                if (result.Result === "success") {
                    displayMessage(settings.saveSuccessText, "dnnFormSuccess");
                }
                else {
                    if (result.debug == true)
                        displayMessage(settings.serverErrorText, "dnnFormWarning", result.message, result.stackTrace);
                    else
                        displayMessage(settings.serverErrorText + result.message, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
            });

        };
    }
    function TrackedEvent(item) {
        var self = this;
        self.trackedEventId = ko.observable(item.trackedEventId);
        self.matchType = ko.observable(item.matchType);
        self.matchValue = ko.observable(item.matchValue);
        self.category = ko.observable(item.category);
        self.event = ko.observable(item.event);
        self.label = ko.observable(item.label);
        self.labelSelector = ko.observable(item.labelSelector);
        self.value = ko.observable(item.value);
        self.valueSelector = ko.observable(item.valueSelector);
        self.isPortal = ko.observable(item.isPortal);
        self.labelDisplay = ko.computed(function () {
            if (self.label() == "" || self.label() == null) {
                if (self.labelSelector() != "" && self.labelSelector() != null) {
                    return "$(this).closest('" + self.labelSelector() + "')";
                }
                else
                    return "";
            }
            else {
                return "'" + self.label() + "'";
            }

        }, this);
        self.valueDisplay = ko.computed(function () {
            if (self.value() == "" || self.value() == null) {
                if (self.valueSelector() != "" && self.valueSelector() != null) {
                    return "$(this).closest('" + self.valueSelector() + "')";
                }
                else {
                    return "";
                }
            }
            else {
                return "'" + self.value() + "'";
            }
        }, this);
    }
    //init constructor, creates and instances the viewmodel and 
    //applies the ko bindings
    this.init = function (element) {
        containerElement = element;

        $.ajax({
            type: "GET",
            cache: false,
            url: baseServicePath + "PortalEvents/" + portalId + "/Tab/" + tabId + "/Mid/" + moduleId + "/TmId/" + tabModuleId,
            beforeSend: serviceFramework.setModuleHeaders,
            dataType: "json"
        }).done(function (result) {
            if (result.Result === "success") {
                    var data = jQuery.parseJSON(result.data);
                    var tevm = new TrackedEventsViewModel(data);
                    ko.applyBindings(tevm, document.getElementById($(element).attr("id")));
                }
                else {
                    if (result.debug == true)
                        displayMessage(settings.serverErrorText, "dnnFormWarning", result.message, result.stackTrace);
                    else
                        displayMessage(settings.serverErrorText + result.message, "dnnFormWarning");
                }
            }).fail(function (xhr, status) {
                displayMessage(settings.serverErrorWithDescriptionText + status, "dnnFormWarning");
        });
    }

            //custom binding to initialize a jQuery UI dialog
            ko.bindingHandlers.jqDialog = {
                init: function (element, valueAccessor) {
                    var options = ko.utils.unwrapObservable(valueAccessor()) || {};

                    //handle disposal
                    ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
                        $(element).dialog("destroy");
                    });

                    $(element).dialog(options);
                }
            };

            //custom binding handler that opens/closes the dialog
            ko.bindingHandlers.openDialog = {
                update: function (element, valueAccessor) {
                    var value = ko.utils.unwrapObservable(valueAccessor());

                    if (value) {
                        $(element).dialog("open");
                    } else {
                        $(element).dialog("close");
                    }
                }
            }

            //custom binding to initialize a jQuery UI button
            ko.bindingHandlers.jqButton = {
                init: function (element, valueAccessor) {
                    var options = ko.utils.unwrapObservable(valueAccessor()) || {};

                    //handle disposal
                    ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
                        $(element).button("destroy");
                    });

                    $(element).button(options);
                }
            };
            //custom binding to initialise a jquery combo box
            ko.bindingHandlers.jqComboBox = {
                init: function (element, valueAccessor) {
                    var options = ko.utils.unwrapObservable(valueAccessor()) || {};
                    var list = options.list();
                    jQuery(element).bind("focus", function () {
                        jQuery(element).change();
                    });
                    var elCombo = jQuery(element).autocomplete({ source: list, minLength: 0
                    }).addClass("ui-widget ui-widget-content ui-corner-left")
                    //jQuery(element).combobox();
                    //add a drop-down button
                    $("<button type='button'>&nbsp;</button>")
                        .attr("tabIndex", -1)
                        .attr("title", "Show All Items")
                        .insertAfter(elCombo)
                        .button({
                            icons: {
                                primary: "ui-icon-triangle-1-s"
                            },
                            text: false
                        })
                        .removeClass("ui-corner-all")
                        .addClass("ui-corner-right dd-button-icon dd-button")
                        .click(function () {
                            // close if already visible                         
                            if (elCombo.autocomplete("widget").is(":visible")) {
                                elCombo.autocomplete("close");
                                return;
                            }
                            //change button icon 
                            $(this).toggleClass("dd-button-down");
                            $(this).blur();
                            elCombo.autocomplete("search", "");
                            elCombo.focus();
                        });
                },
                update: function (element, valueAccessor) {
                    var options = ko.utils.unwrapObservable(valueAccessor()) || {};
                }
            };

}

