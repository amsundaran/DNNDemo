<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.AuthorNews" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblSearchNews" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
            <table class="DNNInfo_TableNormal">
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblTitle" runat="server" /></td>
                    <td><asp:TextBox ID="txtTitle" runat="server" /></td>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNewsID" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsID" runat="server" width="50"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCategory" runat="server" /></td>
                    <td><asp:DropDownList ID="ddCategory" runat="server"/></td>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblArchived" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddArchived" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblPublished" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddPublished" runat="server"/></td>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblActive" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddActive" runat="server"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSearch" runat="server" CssClass="DNNInfo_Button" />
                        <asp:Button ID="btnReset" runat="server" CssClass="DNNInfo_Button" />
                        <asp:Button ID="btnNew" runat="server" CssClass="DNNInfo_Button" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="lblGridMessage" runat="server"/>
        <div class="DNNInfo_Total"><asp:Label ID="lblTotal" runat="server"/></div>
        <asp:Literal ID="litPaging" runat="server"/>
        <asp:GridView runat="server" ID="GridNews" AutoGenerateColumns ="false" DataKeyNames ="NewsID" CssClass="Table_Grid" Width="100%" >
            <AlternatingRowStyle CssClass ="GridRow_Alternate" />
            <HeaderStyle CssClass="HeaderGrid" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkEdit" runat="server" CommandName="EditNews" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "NewsID")%>' CssClass="GridEditButton"></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:LinkButton ID="linkDelete" runat="server" CommandName="Delete" CssClass="GridDeleteButton"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate><asp:Label ID="lblImage" runat="server"/></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "NewsID")%></ItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField>         
                     <ItemTemplate>
                        <div class="DNNInfo_GridTitle"><%#DataBinder.Eval(Container.DataItem, "Title")%></div>
                        <div class="DNNInfo_GridViewed"><asp:Literal ID="litGridNoOfViews" runat="server" /></div>
                        <div class="DNNInfo_GridComment"><asp:Literal ID="litGridNoOfComments" runat="server" /></div>
                     </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                     <ItemTemplate>
                        <div class="DNNInfo_DateIcon"><asp:Literal ID="litGridAddedDate" runat="server" /></div>
                        <div class="DNNInfo_DateIcon"><asp:Literal ID="litGridUpdatedDate" runat="server" /></div>
                        <div class="DNNInfo_DateIcon"><asp:Literal ID="litGridPublishedDate" runat="server" /></div>
                     </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                     <ItemTemplate>
                        <div class="DNNInfo_Value"><asp:Literal ID="litGridPublished" runat="server" /></div>
                        <div class="DNNInfo_Value"><asp:Literal ID="litGridActive" runat="server" /></div>
                        <div class="DNNInfo_Value"><asp:Literal ID="litGridArchived" runat="server" /></div>
                     </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            </asp:GridView>
    </div>
</div>