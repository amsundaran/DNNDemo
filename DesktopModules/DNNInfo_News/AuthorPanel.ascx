<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.AuthorPanel" %>
<%@ Register TagPrefix="DNNInfo" TagName="ControlPanelMenu" Src="~/DesktopModules/DNNInfo_News/AuthorMenu.ascx" %>
<DNNInfo:ControlPanelMenu ID="Menu1" runat="server" />
<p><asp:Label ID="lblMessage" runat="server" /></p>
<asp:PlaceHolder ID="phControl" runat="server" />
