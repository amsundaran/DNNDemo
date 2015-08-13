<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.NewsListSettings" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<table class="DNNInfo_TblSettings" cellspacing="0" cellpadding="2" border="0">
    <tr>
        <td class="SubHead"><dnn:Label ID="lblSearchResult" runat="server" ControlName="txtTabID" Text='<%#Localization.GetString("lblSearchResult",LocalResourceFile)%>' /></td>
        <td valign="top"><asp:TextBox ID="txtTabID" runat="server" width="50"/>
            <div><asp:Literal ID="litDNNInfoTab" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblTemplates" runat="server" ControlName="ddTemplate" /></td>
        <td valign="top"><asp:Dropdownlist ID="ddTemplates" runat="server"/>
            <div class="DNNInfo_Note"><dnn:Label ID="lblTemplateNote" runat="server"/></div>
        </td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblSortField" runat="server" ControlName="ddSortField" /></td>
        <td valign="top"><asp:Dropdownlist ID="ddSortField" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblSortOrder" runat="server" ControlName="ddSortOrder" /></td>
        <td valign="top"><asp:Dropdownlist ID="ddSortOrder" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblNoOfRecords" runat="server" ControlName="txtNoOfRecords" /></td>
        <td valign="top"><asp:TextBox ID="txtNoOfRecords" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblNoOfPaging" runat="server" ControlName="txtNoOfPaging" /></td>
        <td valign="top"><asp:TextBox ID="txtNoOfPaging" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHidePagingTop" runat="server" ControlName="chkHidePagingTop" /></td>
        <td valign="top"><asp:CheckBox ID="chkHidePagingTop" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHidePagingBottom" runat="server" ControlName="chkHidePagingBottom" /></td>
        <td valign="top"><asp:CheckBox ID="chkHidePagingBottom" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHeaderText" runat="server" ControlName="txtHeaderText" /></td>
        <td valign="top"><asp:TextBox ID="txtHeaderText" runat="server" TextMode="MultiLine" Width="400" Height="50"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblNoNewsMessage" runat="server" ControlName="txtNoNewsMessage" /></td>
        <td valign="top"><asp:TextBox ID="txtNoNewsMessage" runat="server" TextMode="MultiLine" Width="400" Height="50"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblShowByCategories" runat="server" ControlName="chkShowByCategories" /></td>
        <td valign="top"><asp:CheckBoxList ID="chkShowByCategories" runat="server"/></td>
    </tr>
</table>