<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPYouTubeVideoList" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="DNNInfo_Box">
<div class="DNNInfo_BoxInside">
<asp:Label ID="lblHeaderMessage" runat="server" />
<table id="TblYoutubeList" runat="server" class="DNNInfo_TblNormal">
    <tr>
        <td><dnn:Label ID="lblYouTubeCode" runat="server" /></td>
        <td><asp:TextBox ID="txtYouTubeCode" runat="server" Width="150" /><span id="Span1" class="DNNInfo_Required" runat="server" visible="false">*</span>
            <div><asp:RequiredFieldValidator ID="reqYouTubeCode" runat="server" Display="Dynamic" ControlToValidate="txtYouTubeCode"  ValidationGroup="YouTubeForm"/></div>
            <div class="DNNInfo_Note"><asp:Literal ID="litYouTubeCodeNote" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td><dnn:Label id="lblYouTubeTitle" runat="server"/></td>
        <td><asp:TextBox ID="txtYouTubeTitle" runat="server" Width="250" MaxLength="255" /></td>
    </tr>
    <tr>
        <td><dnn:Label id="lblYouTubeSortIndex" runat="server" /></td>
        <td><asp:TextBox ID="txtYouTubeSortIndex" runat="server" Width="50" Text="0"/></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:Button ID="btnAddYouTube" runat="server" ValidationGroup="YouTubeForm" CssClass="DNNInfo_Button"/>
            <div class="DNNInfo_Note"><asp:Literal ID="litYoutubeVideoNotes" runat="server" /></div>
        </td>
    </tr>
    <tr>
        <td></td>
        <td><asp:Label ID="lblMessage" runat="server" /></td>
    </tr>
</table>

<asp:Panel ID="pnlYouTubeList" runat="server">
    <asp:GridView runat="server" ID="GridYouTube" AutoGenerateColumns ="false" Width="100%" DataKeyNames ="YouTubeID" CssClass="Table_Grid">
    <AlternatingRowStyle CssClass ="GridRow_Alternate"  />
    <HeaderStyle CssClass="HeaderGrid" />
    <Columns>
        <asp:TemplateField ShowHeader="False">
                  <EditItemTemplate>
                  <asp:LinkButton ID="linkUpdate" runat="server" CommandName="Update" CssClass="GridUpdateButton" CausesValidation="false"></asp:LinkButton>
                  <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CssClass="GridCancelButton" CausesValidation="false"></asp:LinkButton>
                   </EditItemTemplate> 
                    <ItemTemplate>
                        <asp:LinkButton ID="linkEdit" runat="server" CommandName="Edit" CssClass="GridEditButton" CausesValidation="false"></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                 <asp:LinkButton ID="linkDelete" runat="server" CommandName="Delete" CausesValidation="false" CssClass="GridDeleteButton"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>         
             <ItemTemplate><asp:Literal ID="litVideoScript" runat="server" /><asp:Label ID="lblVideoImagePreview" runat="server" /></ItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField>         
             <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "YouTubeCode")%></ItemTemplate>
             <EditItemTemplate>
                <asp:TextBox ID="txtGridYouTubeCode" runat="server" Width="130" Text='<%#DataBinder.Eval(Container.DataItem, "YouTubeCode")%>' />
            </EditItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField>         
             <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "YouTubeTitle")%></ItemTemplate>
             <EditItemTemplate>
                <asp:TextBox ID="txtGridYouTubeTitle" runat="server" Width="100%" Text='<%#DataBinder.Eval(Container.DataItem, "YouTubeTitle")%>' />
             </EditItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField>         
            <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "YouTubeSortIndex")%></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtGridYouTubeSortIndex" runat="server" Width="30" Text='<%#DataBinder.Eval(Container.DataItem, "YouTubeSortIndex")%>' />
            </EditItemTemplate>
        </asp:TemplateField> 
    </Columns>
    </asp:GridView>
</asp:Panel>
</div>
</div>