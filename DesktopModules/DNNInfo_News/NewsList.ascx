<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.NewsList" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="DNNInfo_NewsList">
    <asp:Literal ID="litPagingTop" runat="server" />
    <div class="DNNInfo_NewsHeader">
        <asp:Literal ID="litHeaderText" runat="server" />
    </div>
    <div class="DNNInfo_NewsList">
        <asp:Literal ID="litNews" runat="server"/>
    </div>
    <asp:Literal ID="litPagingBot" runat="server" />
</div>
<asp:Panel ID="pnlComments" runat="server">
    <div class="DNNInfo_NoOfComment"><asp:Label ID="lblNoOfRecords" runat="server" /></div>
    <asp:Literal ID="litComments" runat="server" />
</asp:Panel>
<asp:Label ID="lblCommentNote" runat="server" />
<asp:Panel ID="pnlCommentForm" runat="server" Visible="false">
    <div class="DNNInfo_BoxComment">
        <div class="DNNInfo_HeaderText"><dnn:Label ID="lblLeaveComment" runat="server" /></div>
        <table cellpadding="0" cellspacing="0" class="DNNInfo_tblcomment">
            <tr id="trName" runat="server">
                <td><dnn:Label ID="lblName" runat="server" /></td>
                <td><asp:TextBox ID="txtName" runat="server" Width="200" /><span class="DNNInfo_Required">*</span>
                    <div><asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                </td>
            </tr>
            <tr id="trEmail" runat="server">
                <td><dnn:Label ID="lblEmail" runat="server" /></td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="200" /><span class="DNNInfo_Required">*</span>
                    <div><asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                    <div><asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="CommentForm"/></div>
                </td>
            </tr>
            <tr>
                <td><dnn:Label ID="lblComment" runat="server" /></td>
                <td><asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="5" Width="300" /><span class="DNNInfo_Required">*</span>
                    <asp:RequiredFieldValidator ID="reqComment" ControlToValidate="txtComment" runat="server" Display="Dynamic"  ValidationGroup="CommentForm"/>
                </td>
            </tr>
            <tr id="trCaptcha" runat="server" visible="false">
                <td><dnn:Label ID="lblCaptchaCode" runat="server" /></td>
                <td><dnn:captchacontrol id="ctlCaptcha" captchawidth="100" captchaheight="30" runat="server" CaptchaChars="1234567890" ErrorMessage="" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="btnSubmit" runat="server" CssClass="Nbtn" ValidationGroup="CommentForm"/>    
                    <div class="DNNInfo_FormSubmission">
                        <div class="DNNInfo_MessageNormal">
                            <dnn:Label ID="lblFormSubmitting" runat="server" />
                        </div>
                    </div>
                    <asp:Literal ID="litScriptSubmission" runat="server" />
                </td>
            </tr>
        </table>
        <p class="DNNInfo_Mtop"><asp:Label ID="lblMessage" runat="server" /></p>
    </div>
</asp:Panel>