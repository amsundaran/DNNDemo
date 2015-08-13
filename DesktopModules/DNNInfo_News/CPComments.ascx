<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPComments" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblSearchComments" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
            <table class="DNNInfo_TableNormal">
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblTitle" runat="server" /></td>
                    <td><asp:TextBox ID="txtTitle" runat="server" /></td>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNewsID" runat="server" width="50"/></td>
                    <td><asp:TextBox ID="txtNewsID" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCommentatorName" runat="server" /></td>
                    <td><asp:TextBox ID="txtCommentatorName" runat="server" /></td>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCommentatorEmail" runat="server" /></td>
                    <td><asp:TextBox ID="txtCommentatorEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblApproved" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddApproved" runat="server"/></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSearch" runat="server" CssClass="DNNInfo_Button" />
                        <asp:Button ID="btnReset" runat="server" CssClass="DNNInfo_Button" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="lblGridMessage" runat="server"/>
        <table class="DNNInfo_Table" cellpadding="0" cellspacing="0">
            <tr>
                <td><div class="DNNInfo_Total"><asp:Label ID="lblTotal" runat="server"/></div></td>
                <td class="tdLegendBox">
                    <div class="DNNInfo_Box">
                        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblLegends" runat="server" /></div>
                        <div class="DNNInfo_BoxInside">
                            <div class="DNNInfo_LegendIconApprove"><dnn:Label ID="lblIconApprove" runat="server" /></div>
                            <div class="DNNInfo_LegendIconApproveEmail"><dnn:Label ID="lblIconApproveEmail" runat="server" /></div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        
        <asp:Literal ID="litPaging" runat="server"/>
        <asp:GridView runat="server" ID="GridComments" AutoGenerateColumns ="false" DataKeyNames ="CommentID" CssClass="Table_Grid" Width="100%" >
            <AlternatingRowStyle CssClass ="GridRow_Alternate" />
            <HeaderStyle CssClass="HeaderGrid" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                  <EditItemTemplate>
                  <asp:LinkButton ID="linkUpdate" runat="server" CommandName="Update" CssClass="GridUpdateButton"></asp:LinkButton>
                  <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CssClass="GridCancelButton"></asp:LinkButton>
                   </EditItemTemplate> 
                    <ItemTemplate>
                        <asp:LinkButton ID="linkEdit" runat="server" CommandName="Edit" CssClass="GridEditButton"></asp:LinkButton>
                    </ItemTemplate> 
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                         <asp:LinkButton ID="linkDelete" runat="server" CommandName="Delete" CssClass="GridDeleteButton"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate>
                        <div class="DNNInfo_GridUser"><asp:Label ID="lblGridComentatorName" runat="server"/></div>
                        <div class="DNNInfo_GridEmail"><asp:Label ID="lblGridComentatorEmail" runat="server"/></div>
                     </ItemTemplate>
                     <EditItemTemplate>
                        <div class="DNNInfo_GridUser"><asp:Label ID="lblGridEditComentatorName" runat="server"/></div>
                        <div class="DNNInfo_GridEmail"><asp:Label ID="lblGridEditComentatorEmail" runat="server"/></div>
                     </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate>
                        <div class="DNNInfo_GridTitle"><asp:Label ID="lblGridTitle" runat="server"/></div>
                        <div class="DNNInfo_GridComment"><asp:Label ID="lblGridComment" runat="server"/></div>
                     </ItemTemplate>
                     <EditItemTemplate>
                            <div class="DNNInfo_GridContent"><asp:TextBox ID="txtGridComment" runat="server" Width="300" Text='<%#DataBinder.Eval(Container.DataItem, "Comment")%>' TextMode="MultiLine" Height="100" /></div>
                        </EditItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField>         
                     <ItemTemplate>
                        <asp:Label ID="lblGridApproved" runat="server"/>
                        <div><asp:LinkButton ID="linkApprove" runat="server" CommandName="Approve" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "CommentID")%>' CssClass="DNNInfo_GridApprove"></asp:LinkButton></div>
                        <div><asp:LinkButton ID="linkApproveEmail" runat="server" CommandName="ApproveEmail" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "CommentID")%>' CssClass="DNNInfo_GridApproveEmail"></asp:LinkButton></div>
                     </ItemTemplate>
                     <EditItemTemplate>
                        <asp:CheckBox ID="chkGridApproved" runat="server" />
                     </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>         
                     <ItemTemplate>
                        <asp:Label ID="lblGridCommentDate" runat="server"/>
                     </ItemTemplate>
                     <EditItemTemplate>
                        <asp:Label ID="lblGridEditCommentDate" runat="server"/>
                     </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField>         
                     <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "IPAddress")%>
                     </ItemTemplate>
                     <EditItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "IPAddress")%>
                     </EditItemTemplate>
                </asp:TemplateField> 
            </Columns>
            </asp:GridView>
    </div>
</div>