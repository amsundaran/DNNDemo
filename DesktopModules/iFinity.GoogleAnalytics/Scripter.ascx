<%@ Control Language="C#" AutoEventWireup="true" Inherits="iFinity.DNN.Modules.GoogleAnalytics.Scripter"  EnableViewState="false"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div id="settingsStatus" runat="server">
</div>
<asp:Panel ID="pnlSettings" runat="server" CssClass="dnnForm">
<div id="koBindingGroup">
<div id="tracking">
    <h2 class="dnnFormSectionHead" id="dnnPanel-ExtensionTrackingSettings"><a href="" class=""><%# LocalizeString("TrackingSettings") %></a></h2>
    <fieldset>
    <div id="trackedEvents">
    <div id="details" data-bind="jqDialog: { autoOpen: false, resizable: false, modal: true, dialogClass: 'dnnFormPopup', width:'400px', height:'auto', title: '<%# this.Title %>' }, template: { name: 'editTmpl', data: selectedItem }, openDialog: selectedItem"></div>
        <script id="editTmpl" type="text/html">
        <!-- ko if: $data -->
        <div id="trackingDialog">
            <div class="trackingDialogContents">
                <!-- <pre data-bind="text: JSON.stringify(ko.toJS($data), null, 2)"></pre> -->
                <div class="dnnFormItem">
            
                    <dnn:Label ID="lblTrackingLevel" runat="server" class="formLabel" Text="Tracking Level:" ResourceKey="TrackingLevelLbl"></dnn:Label>
                    <span class="formOpt">
                    <asp:Label id="lblPortal" runat="server" ResourceKey="Portal">Portal</asp:Label>
                        <input type="radio" name="isPortal" value="true" data-bind="checked:isPortal"/>
                        </span>
                    <span class="formOpt">
                    <asp:Label id="lblPage" runat="server" ResourceKey="Page">Page</asp:Label>
                        <input type="radio" name="isPortal" value="false" data-bind="checked:isPortal"/>
                        </span>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblLinkMatchHdr" runat="server" class="formLabel" Text="Link Match:" ResourceKey="MatchValueLbl"></dnn:Label>
                    <input id="linkMatch" class="trackingField" data-bind="value: matchValue"></span>
                    <asp:Label class="formItemHelp" runat="server" id="matchValueHelp" ResourceKey="MatchValue.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblLinkMatchTypeHdr" runat="server" Text="Link Match Type:" ResourceKey="MatchTypeLbl"></dnn:Label>
                    <asp:DropDownList ID="ddlLinkMatchType" runat="server" data-bind="value: matchType"></asp:DropDownList>
                    <asp:Label class="formItemHelp" runat="server" id="matchTypeHelp" ResourceKey="MatchType.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblCategoryHdr" runat="server" Text="Category:" ResourceKey="CategoryLbl"></dnn:Label>
                    <input id="txtCategory" type="text" data-bind="jqComboBox: {id: 'txtCategory', value: category, list:$parent.categoryList}, value: category" ></input>
                    <asp:Label class="formItemHelp" runat="server" id="categoryHelp" ResourceKey="Category.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblEventHdr" runat="server" Text="Event:" ResourceKey="EventLbl"></dnn:Label>
                    <asp:TextBox ID="txtEvent" runat="server" data-bind="value: event"/>
                    <asp:Label class="formItemHelp" runat="server" id="eventHelp" ResourceKey="Event.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblLabelHdr" runat="server" Text="Label:" ResourceKey="LabelLbl"></dnn:Label>
                    <asp:TextBox ID="txtLabel" runat="server" data-bind="value: label"/>
                    <asp:Label class="formItemHelp" runat="server" id="labelHelp" ResourceKey="Label.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblLabelSelectorHdr" runat="server" Text="Label Selector:" ResourceKey="LabelSelectorLbl"></dnn:Label>
                    <asp:TextBox ID="txtLabelSelector" runat="server" data-bind="value: labelSelector"/>
                    <asp:Label class="formItemHelp" runat="server" id="labelSelectorHelp" ResourceKey="LabelSelector.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblValueHdr" runat="server" Text="Value:" ResourceKey="ValueLbl"></dnn:Label>
                    <asp:TextBox ID="txtValue" runat="server" data-bind="value: value"/>
                    <asp:Label class="formItemHelp" runat="server" id="valueHelp" ResourceKey="Value.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblValueSelectorHdr" runat="server" Text="Value Selector:" ResourceKey="ValueSelectorLbl"></dnn:Label>
                    <asp:TextBox ID="txtValueSelector" runat="server" data-bind="value: valueSelector"/>
                    <asp:Label class="formItemHelp" runat="server" id="valueSelectorHelp" ResourceKey="ValueSelector.Help"></asp:Label>
                </div>
                <div class="dnnClear"></div>

                <div class="formButtons">
                    <button type="button" data-bind="jqButton: {}, click: $parent.accept" class="notrack">Accept</button>
                    <button type="button" data-bind="jqButton: {}, click: $parent.deleteItem" class="notrack">Delete</button>
                </div>
            </div>
            <asp:HiddenField ID="hdnDialogTitle" runat="server" />
        </div>
        <!-- /ko -->
        </script>
    <table id="analyticsTrackingTbl">
        <thead>
            <tr>
                <th><dnn:Label id="lblTblEditHdr" runat="server" resourceKey="EditHdr" /></th>
                <th><dnn:Label id="lblTblMatchTypeHdr" runat="server" resourceKey="MatchTypeHdr" /></th>
                <th><dnn:Label id="lblTblMatchValueHdr" runat="server" resourceKey="MatchValueHdr" /></th>
                <th><dnn:Label id="lblTblCategoryHdr" runat="server" resourceKey="CategoryHdr" /></th>
                <th><dnn:Label id="lblTblEventHdr" runat="server" resourceKey="EventHdr" /></th>
                <th><dnn:Label id="lblTblLabelHdr" runat="server" resourceKey="LabelHdr" /></th>
                <th><dnn:Label id="lblTblValueHdr" runat="server" resourceKey="ValueHdr" /></th>
                <th><dnn:Label id="lblTblDeleteHdr" runat="server" resourceKey="DeleteHdr" /></th>
            </tr>
        </thead>
        <tbody data-bind="foreach: trackedEvents">
            <tr>
                <td><a href="#" data-bind="click: $root.setItem" class="selItem notrack">sel</a></td>
                <td data-bind="text: matchType"></td>
                <td data-bind="text: matchValue"></td>
                <td data-bind="text: category"></td>
                <td data-bind="text: event"></td>
                <td data-bind="text: labelDisplay"></td>
                <td data-bind="text: valueDisplay"></td>
                <td><a href="#" data-bind="click: $root.deleteItem" class="selItem notrack">del</a></td>
            </tr>
        </tbody>
    </table>
    <button id="btnSaveEventTargets" runat="server" type="button" data-bind="click: $root.saveEventTargets" class="notrack">Save Events</button>
    <div class="trackingbuttons">
        <button id="btnIdentifyTrackedLinks" runat="server" type="button" class="trackedlinks"></button>
        <button id="btnTestLinkTracking" runat="server" type="button" class="trackedlinks"></button>
        <button id="btnCreateNewTrackedLink" runat="server" type="button" class="trackedlinks" data-bind="click: $root.addEmptyItem"></button>
        <span id="testLinksAltText" runat="server" style="display:none;"></span>
        <span id="trackedLinksAltText" runat="server" style="display:none;"></span>
    </div>
    </div>
</fieldset>
</div>
<div id="portalExtraScript">
    <h2 class="dnnFormSectionHead" id="dnnPanel-PortalExtraScript"><a href="" class=""><%# LocalizeString("PortalExtraScript") %></a></h2>
    <fieldset>
        <dnn:Label id="lblPortalExtraScript" runat="server" ResourceKey="PortalExtraScriptLabel" CssClass="NormalHdr"></dnn:Label>
        <textarea id="txtPortalExtraScript" cols="100" rows="5" class="Normal"  data-bind="value: portalExtraScript"></textarea>
        <dnn:Label id="lblPortalExtraScriptLocationHdr" runat="server" CssClass="NormalHdr" ResourceKey="PortalExtraScriptLocation"></dnn:Label>
        <span class="formOpt">
            <asp:Label id="lblPortalExtraScriptLocationHead" runat="server" ResourceKey="ExtraScriptLocationHead">Head</asp:Label>
            <input type="radio" name="portalExtraScriptPosition" value="head" data-bind="checked: portalExtraLocation"/>
        </span>
        <span class="formOpt">
            <asp:Label id="lblPortalExtraScriptLocationBody" runat="server" ResourceKey="ExtraScriptLocationBody">Body</asp:Label>
            <input type="radio" name="portalExtraScriptPosition" value="body" data-bind="checked: portalExtraLocation"/>
        </span>
        <div>
            <button id="btnPortalExtraScriptSave" runat="server" type="button" data-bind="click: $root.savePortalExtraScript" class="notrack">Save Portal Extra Script</button>
        </div>
    </fieldset>
</div>
<div id="tabExtraScript">
    <h2 class="dnnFormSectionHead" id="dnnPanel-TabExtraScript"><a href="" class=""><%# LocalizeString("TabExtraScript") %></a></h2>
    <fieldset>
        <dnn:Label id="lblTabExtraScript" runat="server" ResourceKey="TabExtraScriptLabel" CssClass="NormalHdr"></dnn:Label>
        <textarea id="txtTabExtraScript" cols="100" rows="5" class="Normal" data-bind="value: tabExtraScript"></textarea>
        <dnn:Label id="lblTabExtraScriptPosition" runat="server" CssClass="NormalHdr" ResourceKey="TabExtraScriptPosition"></dnn:Label>
        <dnn:Label id="lblTabExtraScriptLocationHdr" runat="server" CssClass="NormalHdr" ResourceKey="TabExtraScriptLocation"></dnn:Label>
        <span class="formOpt">
            <asp:Label id="lblTabExtraScriptLocationHead" runat="server" ResourceKey="ExtraScriptLocationHead">Head</asp:Label>
            <input type="radio" name="TabExtraScriptPosition" value="head" data-bind="checked: tabExtraLocation"/>
        </span>
        <span class="formOpt">
            <asp:Label id="lblTabExtraScriptLocationBody" runat="server" ResourceKey="ExtraScriptLocationBody">Body</asp:Label>
            <input type="radio" name="TabExtraScriptPosition" value="body" data-bind="checked: tabExtraLocation"/>
        </span>
        <div>
            <button id="btnTabExtraScriptSave" runat="server" type="button" data-bind="click: $root.saveTabExtraScript" class="notrack">Save Tab Extra Script</button>
        </div>
    </fieldset>
</div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('#tracking').dnnPanels();
        $('#tabExtraScript').dnnPanels();
        $('#portalExtraScript').dnnPanels();

        var et = new EventTracking($, ko, {
            portalId: <%# ModuleContext.PortalId %>
           ,tabId: <%# ModuleContext.TabId %>
           ,moduleId: <%# ModuleContext.ModuleId %>
           ,tabModuleId: <%# ModuleContext.TabModuleId %>
           ,currentEvents : ifty_Tracking.trackDbEvents
           ,saveSuccessText: '<%# DotNetNuke.UI.Utilities.ClientAPI.GetSafeJSString(LocalizeString("SaveSuccess"))%>'
           ,serverErrorText: '<%# DotNetNuke.UI.Utilities.ClientAPI.GetSafeJSString(LocalizeString("ServerError"))%>'
           ,serverErrorWithDescriptionText: '<%# DotNetNuke.UI.Utilities.ClientAPI.GetSafeJSString(LocalizeString("ServerErrorWithDescription"))%>'
           ,servicesFramework: $.ServicesFramework(<%# ModuleContext.ModuleId %>)
        });
        et.init("#koBindingGroup");
        
        //init the button for identifying tracked links
        jQuery("[id$='btnIdentifyTrackedLinks']").click(function () {
            //admin ui, switches tracking on/off
            var btn = jQuery(this);
            btn.toggleClass("trackedlinksOn");
            var altTextSpan = jQuery("[id$='trackedLinksAltText']");
            ifty_Tracking.identifyingLinks = !ifty_Tracking.identifyingLinks;
            if (altTextSpan.length) {
                var altText = altTextSpan.html();
                altTextSpan.html(btn.html()); //set to button text
                btn.html(altText);
                
            }
        });

        //show/hide help items
        jQuery('body').delegate('.formItemHelp', 'click', function () {
            jQuery(this).toggleClass('formItemShow');
        });

        jQuery("[id$='btnTestLinkTracking']").click(function () {
            //admin ui, switches tracking on/off
            var btn = jQuery(this);
            btn.toggleClass("trackedlinksOn");
            ifty_Tracking.logAnalytics = !ifty_Tracking.logAnalytics;
            var altTextSpan = jQuery("[id$='testLinksAltText']");
            if (altTextSpan.length) {
                var altText = altTextSpan.html();
                altTextSpan.html(btn.html()); //set to button text
                btn.html(altText);
            }
        });


        var $input = jQuery("#txtCategory").autocomplete({
             source: ifty_Tracking.categoryList
            ,minLength: 0
        }).addClass("ui-widget ui-widget-content ui-corner-left");

        $("<button type='button'>&nbsp;</button>")                     
        .attr("tabIndex", -1)                     
        .attr("title", "Show All Items")                     
        .insertAfter($input)                     
        .button({                         
            icons: {                             
                primary: "ui-icon-triangle-1-s"                         
            },                         
            text: false                     
        })                     
        .removeClass("ui-corner-all")                     
        .addClass("ui-corner-right ui-button-icon")                   
        .click(function() {                         
            // close if already visible                         
            if ($input.autocomplete("widget").is(":visible")){
                $input.autocomplete( "close" );
                return;                         
            }                                              
            $(this).blur();                                                 
            $input.autocomplete("search", "" );                         
            $input.focus();                     
    });


    });
</script>
</asp:Panel>