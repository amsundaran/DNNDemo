<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPAddNews" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="DNNInfo" TagName="YouTubeVideoList" Src="~/DesktopModules/DNNInfo_News/CPYouTubeVideoList.ascx"%>
<asp:Literal ID="litScript" runat="server" />
<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblNewArticle" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:HiddenField ID="hiddenNewsID" runat="server" />
        <table class="DNNInfo_TableNormal" cellpadding="0" cellspacing="0">
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblTitle" runat="server" /></td>
                <td><asp:TextBox ID="txtTitle" runat="server" width="500"/> <asp:RequiredFieldValidator ID="reqTitle" runat="server" Display="Dynamic" ControlToValidate="txtTitle" ValidationGroup="NewsForm"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblShortDescription" runat="server" /></td>
                <td><dnn:TextEditor ID="txtShortDescription" runat="server" width="500" Height="300"/> <asp:RequiredFieldValidator ID="reqShortDescription" runat="server" Display="Dynamic" ControlToValidate="txtShortDescription" ValidationGroup="NewsForm"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblDescription" runat="server" /></td>
                <td><dnn:TextEditor ID="txtDescription" runat="server" width="500" Height="450"/> <asp:RequiredFieldValidator ID="reqDescription" runat="server" Display="Dynamic" ControlToValidate="txtDescription" ValidationGroup="NewsForm"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblKeyword" runat="server" /></td>
                <td><asp:TextBox ID="txtKeyword" runat="server" width="500" TextMode="MultiLine" Height="50"/>
                    <div class="DNNInfo_Note"><dnn:Label ID="KeywordNote" runat="server" /></div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblCategories" runat="server" /></td>
                <td><asp:CheckBoxList ID="chkCategoryList" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblMainImage" runat="server" /></td>
                <td><asp:FileUpload runat="server" id="fUpload"/>
                    <asp:Button ID="btnUpload" runat="server"  CssClass="DNNInfo_Button" CausesValidation="false"/>
                    <div runat="server" visible="false"><asp:Literal ID="litSortIndex" runat="server" />: <asp:TextBox ID="txtImageSortIndex" runat="server" Width="40" MaxLength="3" Text="0"/></div>
                    <div><asp:Label ID="lblUploadImageMessage" runat="server" /></div>
                    <div class="DNNInfo_Note"><asp:Literal ID="litMainImageUploadSizeNote" runat="server" /></div>
                    <asp:Panel ID="pnlPreview" runat="server" Visible="false">
                        <div class="DNNInfo_PreviewImage"><asp:Label ID="lblPreviewImage" runat="server"/></div>
                        <div><asp:LinkButton ID="linkDeleteImage" runat="server"  CssClass="DNNInfo_Button" CausesValidation="false"/></div>
                        <asp:HiddenField ID="hiddenImage" runat="server"/>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblAdditionalImage" runat="server" /></td>
                <td>
                    <asp:FileUpload ID="fUploadAdditional" runat="server"/>
                    <asp:Button ID="btnUploadAdditional" runat="server" CssClass="DNNInfo_Button" CausesValidation="false"/>
                    <div><asp:Label ID="lblUploadAdditionalImagesMessage" runat="server" /></div> 
                    <div class="DNNInfo_Note"><asp:Literal ID="litAdditionalImageUploadSizeNote" runat="server" /></div>
                    <asp:Panel ID="pnlImages" runat="server">
                    <asp:HiddenField ID="hiddenAdditionalImages" runat="server"/>
                    <asp:GridView runat="server" ID="GridImage" BorderColor="#dcd7d7" AutoGenerateColumns ="false" DataKeyNames ="ImageID" CssClass="Table_Grid">
                        <AlternatingRowStyle CssClass ="GridRow_Alternate"  />
                        <HeaderStyle CssClass="HeaderGrid" />
                        <Columns>
                            <asp:TemplateField HeaderText="Image">         
                                 <ItemTemplate>
                     	            <asp:label ID="lblImage" runat="server"/>
                     	            <asp:HiddenField ID="hiddenGridTempID" runat="server" value='<%#DataBinder.Eval(Container.DataItem, "ImageID")%>'/>
                                 </ItemTemplate>
                            </asp:TemplateField>  
                            <asp:TemplateField >
                                <ItemTemplate>
                                     <asp:LinkButton ID="linkDelete" runat="server" CommandName="Delete" CssClass="GridDeleteButton"  CausesValidation="false"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </asp:Panel>
                    <asp:HiddenField ID="hiddenImageDeleted" runat="server"/>
                    <div class="DNNInfo_Note"><asp:Literal ID="litAdditionalImagesNote" runat="server" /></div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubes" runat="server" /></td>
                <td><DNNInfo:YouTubeVideoList ID="YouTubeVideoListForm" runat="server" /></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblMetaTitle" runat="server" /></td>
                <td><asp:TextBox ID="txtMetaTitle" runat="server" Width="500"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblMetaDescription" runat="server" /></td>
                <td><asp:TextBox ID="txtMetaDescription" runat="server" Width="500" TextMode="MultiLine" Height="50"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblMetaKeyword" runat="server" /></td>
                <td><asp:TextBox ID="txtMetaKeyword" runat="server" Width="500" TextMode="MultiLine" Height="50"/></td>
            </tr>
            <tr runat="server" visible="false">
                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsURL" runat="server" /></td>
                <td><asp:TextBox ID="txtNewsURL" runat="server" Width="500" />
                    <div class="DNNInfo_Note"><dnn:Label ID="lblNewsURLNote" runat="server" /></div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblFeatured" runat="server" /></td>
                <td><asp:CheckBox ID="chkFeatured" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblPublished" runat="server" /></td>
                <td><asp:CheckBox ID="chkPublished" runat="server" Checked="true"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblActive" runat="server" /></td>
                <td><asp:CheckBox ID="chkActive" runat="server" Checked="true"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblArchived" runat="server" /></td>
                <td><asp:CheckBox ID="chkArchived" runat="server"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblPublishedDate" runat="server" /></td>
                <td><asp:TextBox ID="txtPublishedDate" runat="server" CssClass="DNNInfo_TextDate" MaxLength="10"/><asp:RequiredFieldValidator ID="reqPublishedDate" runat="server" Display="Dynamic" ControlToValidate="txtPublishedDate" /> <asp:TextBox ID="txtPublishedTime" runat="server" CssClass="DNNInfo_TextTime" MaxLength="5" ValidationGroup="NewsForm"/>
                    <asp:RequiredFieldValidator ID="reqPublishedTime" runat="server" Display="Dynamic" ControlToValidate="txtPublishedTime" ValidationGroup="NewsForm"/><asp:RegularExpressionValidator ID="regexPublishedTime" runat="server" Display="Dynamic" ControlToValidate="txtPublishedTime" ValidationExpression="^([0-1]?[0-9]|[2][0-3]):([0-5][0-9])$" ValidationGroup="NewsForm"/>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblArchivedDate" runat="server" /></td>
                <td><asp:TextBox ID="txtArchivedDate" runat="server" CssClass="DNNInfo_TextDate" MaxLength="10"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblExpiredDate" runat="server" /></td>
                <td><asp:TextBox ID="txtExpiredDate" runat="server" CssClass="DNNInfo_TextDate" MaxLength="10"/></td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblAuthorID" runat="server" /></td>
                <td><asp:TextBox ID="txtUserID" runat="server" Width="50"/>
                    <asp:RequiredFieldValidator ID="reqUserID" runat="server" Display="Dynamic" ControlToValidate="txtUserID" ValidationGroup="NewsForm"/><asp:RegularExpressionValidator ID="regexUserID" runat="server" Display="Dynamic" ControlToValidate="txtUserID" ValidationExpression="^[0-9]+$" ValidationGroup="NewsForm"/>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"><dnn:Label ID="lblAuthorOtherName" runat="server" /></td>
                <td><asp:TextBox ID="txtAuthorOtherName" runat="server" Width="250"/>
                    <div class="DNNInfo_Note"><asp:Label ID="AuthorOtherNameNote" runat="server" /></div>
                </td>
            </tr>
            <tr>
                <td class="DNNInfo_Label"></td>
                <td><asp:Button ID="btnAdd" runat="server" CssClass="DNNInfo_Button" ValidationGroup="NewsForm"/> <asp:Button ID="btnCancel" runat="server" CssClass="DNNInfo_Button" CausesValidation="false"/>
                    <p><asp:Label ID="lblMessage" runat="server" /></p>
                </td>
            </tr>
        </table>
    </div>
</div>
