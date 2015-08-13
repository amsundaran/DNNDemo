<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPNewsTemplates" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:Panel ID="pnlNewsTemplate" runat="server" DefaultButton="btnNew">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblNewNewsTemplate" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <div><asp:Label ID="lblMessage" runat="server"/></div>
            <table class="DNNInfo_TableNormal">
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsTemplateName" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsTemplateName" runat="server" Width="300" MaxLength="100" /><span class="DNNInfo_Required">*</span>
    	                <asp:RequiredFieldValidator ID="reqNewsTemplateName" ValidationGroup="NewsTemplate" runat="server" ControlToValidate="txtNewsTemplateName" Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsTemplateListValue" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsTemplateListValue" runat="server" Width="400" Height="250" TextMode="MultiLine"/><span class="DNNInfo_Required">*</span>
                        <div><asp:RequiredFieldValidator ID="reqNewsTemplateListValue" ValidationGroup="NewsTemplate" runat="server" ControlToValidate="txtNewsTemplateName" Display="Dynamic"/></div>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsTemplateDetailsValue" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsTemplateDetailsValue" runat="server" Width="400" Height="250" TextMode="MultiLine"/><span class="DNNInfo_Required">*</span>
                        <div><asp:RequiredFieldValidator ID="reqNewsTemplateDetailsValue" ValidationGroup="NewsTemplate" runat="server" ControlToValidate="txtNewsTemplateName" Display="Dynamic"/></div>
                    </td>
                </tr>
                <tr>
	                <td></td>
                    <td><asp:Button ID="btnNew" runat="server" CssClass="DNNInfo_Button" ValidationGroup="NewsTemplate"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><div class="DNNInfo_Note"><dnn:Label ID="lblTokenReplacement" runat="server" /></div></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnlNewsTemplateList" runat="server">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblNewsTemplateList" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <div class="DNNInfo_Note"><dnn:Label ID="lblGridNote" runat="server" /></div>
            <asp:Panel ID="pnlView" runat="server">
                <asp:GridView runat="server" ID="GridNewsTemplate" AutoGenerateColumns ="false" Width="100%" DataKeyNames ="NewsTemplateID" CssClass="Table_Grid">
                <AlternatingRowStyle CssClass ="GridRow_Alternate"/>
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
                            <%#DataBinder.Eval(Container.DataItem, "NewsTemplateID")%>
                        </ItemTemplate> 
                    </asp:TemplateField> 
                    <asp:TemplateField>  
                        <ItemTemplate> 
                            <%#DataBinder.Eval(Container.DataItem, "NewsTemplateName")%>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <div><asp:TextBox ID="txtGridNewsTemplateName" Width="150" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NewsTemplateName")%>'/></div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>  
                        <ItemTemplate> 
                            <asp:Label ID="lblGridNewsTemplateListValue" runat="server" />
                        </ItemTemplate> 
                        <EditItemTemplate>
                             <div><asp:TextBox ID="txtGridNewsTemplateListValue" Width="400" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NewsTemplateListValue")%>' Height="300" TextMode="MultiLine"/></div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>  
                        <ItemTemplate> 
                           <asp:Label ID="lblGridNewsTemplateDetailsValue" runat="server" />
                        </ItemTemplate> 
                        <EditItemTemplate>
                             <div><asp:TextBox ID="txtGridNewsTemplateDetailsValue" Width="400" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "NewsTemplateDetailsValue")%>' Height="300" TextMode="MultiLine"/></div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
                <p class="DNNInfo_MTop"><asp:Label ID="lblGridMessage" runat="server"/></p>
            </asp:Panel>
        </div>
    </div>
</asp:Panel>
