<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:Panel ID="pnlForm" runat="server" DefaultButton="btnUpdate">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblSettings" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <table class="DNNInfo_TableNormal" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblMiscSettings" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblAdminEmail" runat="server"/></td>
                    <td><asp:TextBox ID="txtAdminEmail" runat="server"  width="200" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblDefaultDateFormat" runat="server"/></td>
                    <td><asp:TextBox ID="txtDefaultDateFormat" runat="server"  width="200" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCopyrightText" runat="server"/></td>
                    <td><asp:TextBox ID="txtCopyrightText" runat="server"  width="500" Height="70" TextMode="MultiLine" />
                        <div class="DNNInfo_Note"><dnn:Label ID="CopyrightTextNote" runat="server"/></div>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblAllowToUseAuthorOtherNameForAuthor" runat="server" /></td>
                    <td><asp:CheckBox ID="chkAllowToUseAuthorOtherNameForAuthor" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblSMTPSettings" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblUseHostSMTPSettings" runat="server" /></td>
                    <td><asp:CheckBox ID="chkUseHostSMTPSettings" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblSmtpAuthentication" runat="server" /></td>
                    <td><asp:DropDownList ID="ddSmtpAuthentication" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblSmtpServer" runat="server" /></td>
                    <td><asp:TextBox ID="txtSmtpServer" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblSmtpUsername" runat="server" /></td>
                    <td><asp:TextBox ID="txtSmtpUsername" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblSmtpPassword" runat="server" /></td>
                    <td><asp:TextBox ID="txtSmtpPassword" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblNotificationSettings" runat="server" /></td>
                </tr>            
                <tr>
                    <td colspan="2">
                        <table class="DNNInfo_TableNormal" cellpadding="0" cellspacing="0">
                            <tr>
                                <td></td>
                                <td colspan="3"><div class="DNNInfo_Note"><dnn:Label ID="lblNotificationNote" runat="server" /></div></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="DNNInfo_TdHeader"><dnn:Label ID="lblHeaderUser" runat="server" /></td>
                                <td class="DNNInfo_TdHeader"><dnn:Label ID="lblHeaderAuthor" runat="server" /></td>
                                <td class="DNNInfo_TdHeader"><dnn:Label ID="lblHeaderAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblAddNews" runat="server"/></td>
                                <td><asp:CheckBox ID="chkAddNewsUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkAddNewsAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkAddNewsAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblPendingNews" runat="server"/></td>
                                <td><asp:CheckBox ID="chkPendingNewsUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkPendingNewsAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkPendingNewsAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblApprovedNews" runat="server"/></td>
                                <td><asp:CheckBox ID="chkApprovedNewsUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprovedNewsAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprovedNewsAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblNewComment" runat="server"/></td>
                                <td><asp:CheckBox ID="chkNewCommentUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkNewCommentAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkNewCommentAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblPendingComment" runat="server"/></td>
                                <td><asp:CheckBox ID="chkPendingCommentUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkPendingCommentAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkPendingCommentAdmin" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="DNNInfo_Label"><dnn:Label ID="lblApprovedComment" runat="server"/></td>
                                <td><asp:CheckBox ID="chkApprovedCommentUser" runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprovedCommentAuthor" runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprovedCommentAdmin" runat="server" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblNewsSettings" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForAccesingAuthorPanel" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForAccesingAuthorPanel" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForAddingNewsForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForAddingNewsForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForEditingNewsForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForEditingNewsForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesforDeletingNewsForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesforDeletingNewsForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblAutoApproveNewsForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkAutoApproveNewsForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForViewingDetailsNews" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForViewingDetailsNews" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblUnauthorizedAccesingAuthorPanel" runat="server"/></td>
                    <td><asp:TextBox ID="txtUnauthorizedAccesingAuthorPanel" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblAddNewsSubmissionText" runat="server"/></td>
                    <td><asp:TextBox ID="txtAddNewsSubmissionText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblPendingNewsSubmissionText" runat="server"/></td>
                    <td><asp:TextBox ID="txtPendingNewsSubmissionText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblUnauthorizedViewingDetailsNewsText" runat="server"/></td>
                    <td><asp:TextBox ID="txtUnauthorizedViewingDetailsNewsText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblCommentSettings" runat="server" /></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCommentPopUpTheme" runat="server"/></td>
                    <td><asp:Dropdownlist ID="ddCommentPopUpTheme" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForComment" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForComment" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForApprovingCommentForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForApprovingCommentForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForEditingCommentForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForEditingCommentForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblRolesForDeletingCommentForAuthor" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkRolesForDeletingCommentForAuthor" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblAutoApprovedCommentRoles" runat="server"/></td>
                    <td><asp:CheckBoxList ID="chkAutoApprovedCommentRoles" runat="server"/></td>
                </tr>
                <tr runat="server" visible="false">
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCommentNoOfPaging" runat="server" /></td>
                    <td><asp:TextBox ID="txtCommentNoOfPaging" width="50" runat="server"/></td>
                </tr>
                <tr runat="server" visible="false">
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNoOfCommentsPerPage" runat="server" /></td>
                    <td><asp:TextBox ID="txtNoOfCommentsPerPage" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblUnauthorizedCommentText" runat="server"/></td>
                    <td><asp:TextBox ID="txtUnauthorizedCommentText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblPendingCommentSubmissionText" runat="server"/></td>
                    <td><asp:TextBox ID="txtPendingCommentSubmissionText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNewCommentSubmissionText" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewCommentSubmissionText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCommentWrapperTemplate" runat="server" /></td>
                    <td><asp:TextBox ID="txtCommentWrapperTemplate" width="450" Height="100" runat="server" TextMode="MultiLine"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblCommentWrapperTemplateNote" runat="server" /></div>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCommentTemplate" runat="server" /></td>
                    <td><asp:TextBox ID="txtCommentTemplate" width="450" Height="100" runat="server"  TextMode="MultiLine"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblCommentTemplateNote" runat="server" /></div>
                        <p><asp:Button ID="btnLoadDefaultCommentTemplate" runat="server" CssClass="DNNInfo_Button" CausesValidation ="false"/></p>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblCaptchaComment" runat="server"/></td>
                    <td><asp:CheckBox ID="chkCaptchaComment" runat="server"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblImageSettings" runat="server" /></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblGalleryThemes" runat="server"/></td>
                    <td><asp:Dropdownlist ID="ddGalleryThemes" runat="server" /></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblCategoryImageSize" runat="server"/></td>
                    <td><asp:TextBox ID="txtCategoryImageSize" runat="server" Width="50" MaxLength="3"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsThumbImageSize" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsThumbImageSize" runat="server" Width="50" MaxLength="3"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsMediumImageSize" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsMediumImageSize" runat="server" Width="50" MaxLength="3"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblNewsLargeImageSize" runat="server"/></td>
                    <td><asp:TextBox ID="txtNewsLargeImageSize" runat="server" Width="50" MaxLength="3"/></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblMaxImageUploadSize" runat="server"/></td>
                    <td><asp:TextBox ID="txtMaxImageUploadSize" runat="server" Width="70" MaxLength="3"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblImageGalleryEmptyText" runat="server"/></td>
                    <td><asp:TextBox ID="txtImageGalleryEmptyText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNoOfImageAllowanceForAuthorPanel" runat="server"/></td>
                    <td><asp:TextBox ID="txtNoOfImageAllowanceForAuthorPanel" runat="server" Width="50" />
                        <div class="DNNInfo_Note"><dnn:Label ID="NoOfImageAllowanceForAuthorPanelNote" runat="server" /></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="DNNInfo_TdHeader"><dnn:Label ID="lblYouTubeSettings" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubeNoOfPaging" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubeNoOfPaging" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNoOfYouTubeVideosPerPage" runat="server" /></td>
                    <td><asp:TextBox ID="txtNoOfYouTubeVideosPerPage" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblThumbnailVideoImageHeight" runat="server" /></td>
                    <td><asp:TextBox ID="txtThumbnailVideoImageHeight" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblThumbnailVideoImageWidth" runat="server" /></td>
                    <td><asp:TextBox ID="txtThumbnailVideoImageWidth" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerHeight" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerHeight" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerListHeight" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerListHeight" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerListWidth" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerListWidth" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerWidth" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerWidth" width="50" runat="server"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerMainTemplate" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerMainTemplate" width="450" Height="100" runat="server" TextMode="MultiLine"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblYouTubePlayerMainTemplateTokens" runat="server" /></div>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayerTemplate" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayerTemplate" width="450" Height="100" runat="server"  TextMode="MultiLine"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblYouTubePlayerTemplateTokens" runat="server" /></div>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubePlayListTemplate" runat="server" /></td>
                    <td><asp:TextBox ID="txtYouTubePlayListTemplate" width="450" Height="100" runat="server"  TextMode="MultiLine"/>
                        <div class="DNNInfo_Note"><dnn:Label ID="lblYouTubePlayListTemplateTokens" runat="server" /></div>
                        <p><asp:Button ID="btnLoadDefaultYoutubeTemplate" runat="server" CssClass="DNNInfo_Button" CausesValidation ="false"/></p>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblYouTubeVideosEmptyText" runat="server"/></td>
                    <td><asp:TextBox ID="txtYouTubeVideosEmptyText" runat="server" Width="400" TextMode="MultiLine" Height="60"/></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNoOfYoutubeAllowanceForAuthorPanel" runat="server"/></td>
                    <td><asp:TextBox ID="txtNoOfYoutubeAllowanceForAuthorPanel" runat="server" Width="50" />
                        <div class="DNNInfo_Note"><dnn:Label ID="NoOfYoutubeAllowanceForAuthorPanelNote" runat="server" /></div>
                    </td>
                </tr>
                <tr>
	                <td></td>
                    <td><asp:Button ID="btnUpdate" runat="server" CssClass="DNNInfo_Button" ValidationGroup="SettingForm"/>
                        <div><asp:Label ID="lblMessage" runat="server"/></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>
