<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.QuickNewsList" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="DNNInfo_QuickNewsHeader">
    <asp:Literal ID="litHeaderText" runat="server" />
</div>
<div class="DNNInfo_QuickNewsList">
    <asp:Literal ID="litNews" runat="server"/>
</div>