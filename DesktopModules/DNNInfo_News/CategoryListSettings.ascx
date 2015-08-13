<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CategoryListSettings" %>
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
        <td class="SubHead"><dnn:Label ID="lblExpandCategories" runat="server" ControlName="txtTabID" /></td>
        <td valign="top"><asp:CheckBox ID="chkExpandCategories" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblShowRSSFeed" runat="server" ControlName="chkShowRSSFeed" /></td>
        <td valign="top"><asp:CheckBox ID="chkShowRSSFeed" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHideCategoryTotalNews" runat="server" ControlName="chkHideCategory" /></td>
        <td valign="top"><asp:CheckBox ID="chkHideCategoryTotalNews" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblNoOfFeed" runat="server" ControlName="txtNoOfFeed" /></td>
        <td valign="top"><asp:TextBox ID="txtNoOfFeed" runat="server" width="50" MaxLength="2"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHideCategory" runat="server" ControlName="chkHideCategory" /></td>
        <td valign="top"><asp:CheckBox ID="chkHideCategory" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblCategoryWidth" runat="server" ControlName="txtNoOfFeed" /></td>
        <td valign="top"><asp:TextBox ID="txtCategoryWidth" runat="server" width="50" MaxLength="4"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblShowByCategories" runat="server" ControlName="chkShowByCategories" /></td>
        <td valign="top"><asp:CheckBoxList ID="chkShowByCategories" runat="server"/></td>
    </tr>
</table>