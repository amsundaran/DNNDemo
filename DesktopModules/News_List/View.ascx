<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.News_List.View" %>

<asp:ListView runat="server" ID="NewsList">
    <ItemTemplate>

<div class="content_newslist">
<ul>
    <li>
        

    <img alt="" src="/desktopmodules/dnninfo_news/newsimages/<%# Eval("NewsID") %>/<%# Eval("NewsImage") %>" style="width: 153px; height: 99px;" class="imgBorder" />
       
    <div>
    <h5><a href="#"></a><%# Eval("Title") %></h5>
    <span><em>Published by</em>&nbsp;<%# Eval("AuthorOtherName") %><strong>&nbsp;<%#Eval("PublishedDate", "{0:dd/M/yyyy}")%></strong></span>
    <p><%# System.Web.HttpUtility.HtmlDecode(Convert.ToString(Eval("ShortDescription"))) %></p>
    <a class="altButton" href="/news/id/<%# Eval("NewsID") %>">Read More</a>
    </div>
    </li>
  
</ul>
</div>
    </ItemTemplate>

</asp:ListView>