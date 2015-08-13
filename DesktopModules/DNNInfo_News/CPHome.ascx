<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPHome" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<p><asp:Button ID="btnNew" runat="server" CssClass="DNNInfo_Button" /></p>
<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblLatestArticlesAdded" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Literal ID="litLatestArticles" runat="server" />
    </div>
</div>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblTopArticlesViewed" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Literal ID="litTopArticlesViewed" runat="server" />
    </div>
</div>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblPendingComments" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Literal ID="litPendingComments" runat="server" />
    </div>
</div>