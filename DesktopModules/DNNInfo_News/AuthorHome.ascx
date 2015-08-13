<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.AuthorHome" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table class="DNNInfo_TableNormal">
    <tr>
        <td><asp:Image ID="imgArticle" runat="server" ImageUrl="~/desktopmodules/dnninfo_news/images/authormenu_articles.png" CssClass="DNNInfo_AuthorIcon" /></td>
        <td>
            <div class="DNNInfo_HeaderTitle"><dnn:Label id="lblMyArticles" runat="server" /></div>
            <div><asp:Label ID="lblApprovedArticles" runat="server" /></div>
            <div><asp:Label ID="lblPendingArticles" runat="server" /></div>
            <div><asp:LinkButton ID="linkViewArticles" runat="server" /></div>
            <div><asp:LinkButton ID="linkViewPendingArticles" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td><asp:Image ID="imgComments" runat="server" ImageUrl="~/desktopmodules/dnninfo_news/images/authormenu_comments.png" CssClass="DNNInfo_AuthorIcon" /></td>
        <td>
            <div class="DNNInfo_HeaderTitle"><dnn:Label id="lblComments" runat="server" /></div>
            <div><asp:Label ID="lblPendingComments" runat="server" /></div>
            <div><asp:LinkButton ID="linkViewPendingComments" runat="server" /></div>
        </td>
    </tr>
</table>