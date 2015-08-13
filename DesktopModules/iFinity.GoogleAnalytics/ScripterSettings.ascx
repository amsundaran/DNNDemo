<%@ Control Language="C#" AutoEventWireup="true"  Inherits="iFinity.DNN.Modules.GoogleAnalytics.ScripterSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="GoogleAnalyticsSettings">
    <a name="AnalyticsSettings" />
    <table class="Normal">
        <tr>
            <td><dnn:Label ID="lblAnalyticsTrackingId" Text="Google Analytics Tracking ID" ResourceKey="lblAnalyticsTrackingId" runat="server" /></td>
            <td><asp:TextBox ID="txtAnalyticsTrackingId" runat="server" CssClass="Normal"/></td>
        </tr>
        <tr>
            <td><dnn:Label id="lblHideScriptForGroup" Text="Hide Script for Members of Security Group" ResourceKey="lblHideScriptForGroup" runat="server" /></td>
            <td><asp:DropDownList ID="ddlSecurityGroups" runat="server" CssClass="Normal"/></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblLocalHostName" Text="Don't show script for local host name" ResourceKey="lblLocalHostName" runat="server" /></td>
            <td><asp:TextBox ID="txtLocalHostName" runat="server" CssClass="Normal"/></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTrackExternals" runat="server" Text="Track downloadable files and external links?" /></td>
            <td><asp:CheckBox ID="chkTrackExternals" runat="server" CssClass="Normal"/></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTimeout" runat="server" Text="Visitor Timeout Value(in minutes, whole numbers only)"/></td>
            <td><asp:TextBox ID="txtTimeout" runat="server" CssClass="Normal"/>
            </td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTrackRegisteredUsers" runat="server" Text="Track registered users as separate Analytics segment?" /></td>
            <td><asp:CheckBox ID="chkTrackRegisteredUsers" runat="server" CssClass="Normal"/></td>
        </tr>

        <tr>
            <td><dnn:Label ID="lblTrackDomainName" runat="server" Text="Track a specific domain name? [Use to track subdomains in one domain account]" /></td>
            <td><asp:TextBox ID="txtTrackDomainName" runat="server" CssClass="Normal" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <dnn:Label id="lblNote" runat="server" Text="NOTE: Settings are applied at Module level.  If using 'Show on All Pages' option, these settings apply to all instances
                in the Portal. If you wish to apply different settings to different pages, create a new module instance on the target page." />
            </td>
        </tr>
    </table>
</div>