<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPCategories" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:Panel ID="pnlNewCategory" runat="server" DefaultButton="btnNewCategory">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblNewCategory" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <div><asp:Label ID="lblMessage" runat="server"/></div>
            <table class="DNNInfo_TableNormal">
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryName" runat="server"/></td>
                    <td><asp:TextBox ID="txtCategoryName" runat="server" Width="300" MaxLength="100" /><span class="DNNInfo_Required">*</span>
    	                <asp:RequiredFieldValidator ID="reqCategoryName" ValidationGroup="CategoryForm" runat="server" ControlToValidate="txtCategoryName" Display="Dynamic"/>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryParent" runat="server"/></td>
                    <td><asp:DropDownList ID="ddCategoryParent" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryOrder" runat="server"/></td>
                    <td><asp:TextBox ID="txtCategoryOrder" runat="server" Width="30" Text="0"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryImage" runat="server"/></td>
                    <td><asp:FileUpload ID="fUpload" runat="server"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategorySEOTitle" runat="server"/></td>
                    <td><asp:TextBox ID="txtSEOTitle" runat="server" Width="400" TextMode="MultiLine" Rows="4"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategorySEODescription" runat="server"/></td>
                    <td><asp:TextBox ID="txtSEODescription" runat="server" Width="400" TextMode="MultiLine" Rows="4"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategorySEOKeyword" runat="server"/></td>
                    <td><asp:TextBox ID="txtSEOKeyword" runat="server" Width="400" TextMode="MultiLine" Rows="4"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryTabID" runat="server"/></td>
                    <td><asp:TextBox ID="txtCategoryTabID" runat="server" Width="50" Text="0"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblCategoryTabIDNote" runat="server" /></div>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryURL" runat="server"/></td>
                    <td><asp:TextBox ID="txtCategoryURL" runat="server" Width="400"/></td>
                </tr>
                <tr>
	                <td></td>
                    <td><asp:Button ID="btnNewCategory" runat="server" CssClass="DNNInfo_Button" ValidationGroup="CategoryForm"/></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnlCategoryList" runat="server">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblCategoryList" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <div id="DNNInfo_CategoryPanel" runat="server">
            <asp:Panel ID="pnlView" runat="server">
                <div><asp:Literal ID="litViewCategoriesBy" runat="server" />
	                <asp:DropDownList ID="ddViewCategories" runat="server" AutoPostBack="true"></asp:DropDownList>
	                <asp:DropDownList ID="ddCategoryLevel" runat="server" AutoPostBack="true"></asp:DropDownList>
	                <asp:Button ID="btnDeleteCheckedCategory" runat="server" CssClass="DNNInfo_Button"/>
                </div>
                <p><asp:Literal ID="litTotal" runat="server" /> </p>
                <div class="DNNInfo_Paging"><asp:Literal ID="litPagingTop" runat="server"/></div>
                <asp:GridView runat="server" ID="GridCategory" AutoGenerateColumns ="false" Width="100%" DataKeyNames ="CategoryID" CssClass="Table_Grid">
                <AlternatingRowStyle CssClass ="GridRow_Alternate"/>
                <HeaderStyle CssClass="HeaderGrid" />
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left">         
                         <ItemTemplate><asp:CheckBox ID="chkCategory" runat="server" />
                            <asp:HiddenField ID="hiddenID" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "CategoryID")%>'/>
                         </ItemTemplate>
                    </asp:TemplateField> 
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
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridCategoryID" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategoryID")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridCategoryName" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategoryName")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridCategoryParent" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategoryParentName")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridCategoryOrder" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategorySortOrder")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridCategoryTabID" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategoryTabID")%></div>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridCategoryName" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><asp:TextBox ID="txtGridCategoryName" runat="server" MaxLength="100" Width="200" Text='<%#DataBinder.Eval(Container.DataItem, "CategoryName")%>' /></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridCategoryParent" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><asp:DropDownList ID="ddGridCategoryParent" runat="server"/></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridCategorySortOrder" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><asp:TextBox ID="txtGridSortOrder" Width="30" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategorySortOrder")%>'/></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridCategoryTabID" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><asp:TextBox ID="txtGridCategoryTabID" Width="30" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategoryTabID")%>'/></div>
                        </EditItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField>         
                        <ItemTemplate><asp:Label ID="lblGridCategoryImage" runat="server" /></ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fGridUpload" runat="server"/>
                            <asp:HiddenField ID="hiddenCategoryImage" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "CategoryImage")%>' />
                            <asp:Label ID="lblGridEditCategoryImage" runat="server" />
                            <div><asp:CheckBox ID="chkGridRemoveImage" runat="server" /></div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>         
                        <ItemTemplate>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridSEOTitle" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategorySEOTitle")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridSEODescription" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategorySEODescription")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblGridSEOKeyword" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategorySEOKeyword")%></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblCategoryURL" runat="server" /></div>
                            <div class="DNNInfo_GridContent"><%#DataBinder.Eval(Container.DataItem, "CategoryURL")%></div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridSEOTitle" runat="server" /></div>
                            <div><asp:TextBox ID="txtGridSEOTitle" TextMode="MultiLine" Rows="4" Width="300" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategorySEOTitle")%>'/></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridSEODescription" runat="server" /></div>
                            <div><asp:TextBox ID="txtGridSEODescription" TextMode="MultiLine" Rows="4" Width="300" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategorySEODescription")%>'/></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridSEOKeyword" runat="server" /></div>
                            <div><asp:TextBox ID="txtGridSEOKeyword" TextMode="MultiLine" Rows="4" Width="300" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategorySEOKeyword")%>'/></div>
                            <div class="DNNInfo_GridTitleBold"><dnn:Label ID="lblEditGridCategoryURL" runat="server" /></div>
                            <div><asp:TextBox ID="txtGridCategoryURL" Width="300" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CategoryURL")%>'/></div>
                        </EditItemTemplate>
                    </asp:TemplateField> 
                </Columns>
                </asp:GridView>
                <div class="DNNInfo_Paging"><asp:Literal ID="litPagingBottom" runat="server"/></div>
                <p class="DNNInfo_MTop"><asp:Label ID="lblGridMessage" runat="server"/></p>
            </asp:Panel>
            </div>
        </div>
    </div>
</asp:Panel>
