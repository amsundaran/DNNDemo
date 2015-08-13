<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.Search" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="DNNInfo_SearchBox">
    <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
        <div class="DNNInfo_SearchHeader"><asp:Literal ID="litHeaderSearch" runat="server" /></div>
        <div class="DNNInfo_SearchLabel"><dnn:Label ID="lblKeyword" runat="server" /></div>
        <div class="DNNInfo_SearchInput"><asp:TextBox ID="txtSearch" runat="server" MaxLength="30" /></div>
        <div class=""><asp:Button ID="btnSearch" runat="server" CssClass="DNNInfo_Button" /></div>
    </asp:Panel>
</div>