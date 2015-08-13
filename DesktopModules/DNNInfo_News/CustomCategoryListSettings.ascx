<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CustomCategoryListSettings" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<table class="DNNInfo_TblSettings" cellspacing="0" cellpadding="2" border="0">
    <tr>
        <td class="SubHead"><dnn:Label ID="lblSearchResult" runat="server" ControlName="txtTabID"/></td>
        <td valign="top"><asp:TextBox ID="txtTabID" runat="server" width="50"/>
            <div><asp:Literal ID="litDNNInfoTab" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblTemplate" runat="server" ControlName="txtTemplate" /></td>
        <td valign="top"><asp:TextBox ID="txtTemplate" TextMode="MultiLine" Width="400" Height="200" runat="server"/>
            <div class="DNNInfo_Note"><dnn:Label ID="lblTokens" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblRandom" runat="server" ControlName="chkRandom" /></td>
        <td valign="top"><asp:CheckBox ID="chkRandom" runat="server"/></td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblNoOfCategories" runat="server" ControlName="txtNoOfCategories" /></td>
        <td valign="top"><asp:TextBox ID="txtNoOfCategories" runat="server"/></td>
    </tr>
    
    <tr>
        <td class="SubHead"><dnn:Label ID="lblHideCategories" runat="server" ControlName="txtHideCategories" /></td>
        <td valign="top"><asp:TextBox ID="txtHideCategories" runat="server" width="300" />
            <div class="DNNInfo_Note"><dnn:Label ID="HideCategoriesNote" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td class="SubHead"><dnn:Label ID="lblShowSpecificCategories" runat="server" ControlName="ddShowSpecificCategories" /></td>
        <td valign="top"><asp:Dropdownlist ID="ddShowSpecificCategories" runat="server"/></td>
    </tr>
</table>