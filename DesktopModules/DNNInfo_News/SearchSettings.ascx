<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.SearchSettings" %>
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
        <td class="SubHead"><dnn:Label ID="lblHeaderText" runat="server" ControlName="txtHeaderText"/></td>
        <td valign="top"><asp:TextBox ID="txtHeaderText" runat="server" width="400" Height="100" TextMode="MultiLine"/>
        </td>
    </tr>
</table>