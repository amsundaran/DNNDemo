<%@ Control Language="C#"  AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.PopUpReplyComment" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<asp:Label ID="lblCommentNote" runat="server" />
<asp:Panel ID="pnlCommentForm" runat="server" Visible="false">
    <div class="DNNInfo_BoxComment">
        <div class="DNNInfo_HeaderText"><asp:Label ID="lblReplyComment" runat="server" /></div>
        <table cellpadding="0" cellspacing="0" class="DNNInfo_tblcomment">
            <tr id="trName" runat="server">
                <td><asp:Label ID="lblName" runat="server" /></td>
                <td><asp:TextBox ID="txtName" runat="server" Width="200" /><span class="DNNInfo_Required">*</span>
                    <div><asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                </td>
            </tr>
            <tr id="trEmail" runat="server">
                <td><asp:Label ID="lblEmail" runat="server" /></td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="200" /><span class="DNNInfo_Required">*</span>
                    <div><asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                    <div><asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblComment" runat="server" /></td>
                <td><asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="5" Width="300" /><span class="DNNInfo_Required">*</span>
                    <asp:RequiredFieldValidator ID="reqComment" ControlToValidate="txtComment" runat="server" Display="Dynamic"  ValidationGroup="CommentForm"/>
                </td>
            </tr>
            <tr id="trCaptcha" runat="server" visible="false">
                <td><asp:Label ID="lblCaptchaCode" runat="server" /></td>
                <td><dnn:captchacontrol id="ctlCaptcha" captchawidth="100" captchaheight="30" runat="server" CaptchaChars="1234567890" ErrorMessage="" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnReply" runat="server" CssClass="DNNInfo_Button" ValidationGroup="CommentForm"/>    
                    <div class="DNNInfo_FormSubmission">
                        <div class="DNNInfo_MessageNormal">
                            <asp:Label ID="lblFormSubmitting" runat="server" />
                        </div>
                    </div>
                    <asp:Literal ID="litScriptSubmission" runat="server" />
                </td>
            </tr>
        </table>
        <p class="DNNInfo_Mtop"><asp:Label ID="lblMessage" runat="server" /></p>
    </div>
</asp:Panel>