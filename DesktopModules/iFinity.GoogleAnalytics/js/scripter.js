var EventTrackingPage = function () {

    return {
        showEventDialog: function (item) {

            el = jQuery("#tracking");
            if (el.length) {
                //get the ko viewmodel reference
                var vm = ko.dataFor(el[0]);
                var koitem = vm.findByMatchTypeAndValue("text", item.value);
                if (koitem != null) {
                    //set item, so that it shows up in a popup
                    vm.setItem(koitem);
                }
                else {
                    //push new version to the ko observable array, and set
                    //item, which will make it appear in a popup 
                    var value, category, label, event;
                    if (item != null) {
                        value = item.value;
                        category = item.category;
                        event = item.event;
                        label = item.label;
                        if (event == null)
                            event = value; //set event to value if null
                        var newItem = vm.addNewItem("text", value, category, event, label);
                        vm.setItem(newItem);
                    }
                    else {
                        //add a new object
                    }
                }
            }
        }
    };
} ();


//autocomplete box for the category type
(function ($) {
    jQuery.widget("ui.combobox", {
        _create: function () {
            var self = this,
				select = this.element.hide(),
				selected = select.children(":selected"),
				value = selected.val() ? selected.text() : "",
				wrapper = this.wrapper = jQuery("<span>")
					.addClass("ui-combobox")
					.insertAfter(select);

            var input = this.input = jQuery("<input>")
					.appendTo(wrapper)
					.val(value)
					.addClass("ui-state-default ui-combobox-input")
					.autocomplete({
					    delay: 0,
					    minLength: 0,
					    source: function (request, response) {
					        var matcher = new RegExp(jQuery.ui.autocomplete.escapeRegex(request.term), "i");
					        response(select.children("option").map(function () {
					            var text = jQuery(this).text();
					            if (this.value && (!request.term || matcher.test(text)))
					                return {
					                    label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												jQuery.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<strong>$1</strong>"),
					                    value: text,
					                    option: this
					                };
					        }));
					    },
					    select: function (event, ui) {
					        ui.item.option.selected = true;
					        self._trigger("selected", event, {
					            item: ui.item.option
					        });
					    },
					    change: function (event, ui) {
					        if (!ui.item) {
					            var matcher = new RegExp("^" + jQuery.ui.autocomplete.escapeRegex(jQuery(this).val()) + "$", "i"),
									valid = false;
					            select.children("option").each(function () {
					                if (jQuery(this).text().match(matcher)) {
					                    this.selected = valid = true;
					                    return false;
					                }
					            });
					            if (!valid) {

					                // remove invalid value, as it didn't match anything
                                    var newVal = jQuery(this).val();
					                /*jQuery(this).val("");
					                select.val("");
					                input.data("autocomplete").term = "";
					                return false;*/
                                    jQuery(select).append(jQuery("<option></option>")
                                                  .attr("value", newVal)
                                                  .text(newVal));
                                    input.value = newVal;
                                    jQuery(select).combobox('autocomplete', newVal)
                                    return false;
					            }
					        }
					    }
					})
					.addClass("ui-widget ui-widget-content ui-corner-left");

            input.data("autocomplete")._renderItem = function (ul, item) {
                return jQuery("<li></li>")
						.data("item.autocomplete", item)
						.append("<a>" + item.label + "</a>")
						.appendTo(ul);
            };

            jQuery("<a>")
					.attr("tabIndex", -1)
					.attr("title", "Show All Items")
					.appendTo(wrapper)
					.button({
					    icons: {
					        primary: "ui-icon-triangle-1-s"
					    },
					    text: false
					})
					.removeClass("ui-corner-all")
					.addClass("ui-corner-right ui-combobox-toggle")
					.click(function () {
					    // close if already visible
					    if (input.autocomplete("widget").is(":visible")) {
					        input.autocomplete("close");
					        return;
					    }

					    // work around a bug (likely same cause as #5265)
					    jQuery(this).blur();

					    // pass empty string as value to search for, displaying all results
					    input.autocomplete("search", "");
					    input.focus();
					});
        },

        destroy: function () {
            this.wrapper.remove();
            this.element.show();
            jQuery.Widget.prototype.destroy.call(this);
        },
        autocomplete : function(value) {
            this.element.val(value);
            this.input.val(value);
        }
    });
})(jQuery);

//$(function () {
//    //$("#combobox").combobox();
//    jQuery("[id$='ddlCategory']").combobox();
//});
