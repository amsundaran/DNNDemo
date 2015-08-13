<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPEmailTemplates" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>

<asp:Panel ID="pnlNewsTemplate" runat="server" DefaultButton="btnUpdate">
    <div class="DNNInfo_Box">
        <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblEmailTemplates" runat="server" /></div>
        <div class="DNNInfo_BoxInside">
            <div><asp:Label ID="lblMessage" runat="server"/></div>
            <table class="DNNInfo_TableNormal">
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblEmailTemplateName" runat="server" /></td>
                    <td><asp:DropDownList ID="ddEmailTemplates" runat="server" AutoPostBack="true" /><span class="DNNInfo_Required">*</span></td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblEmailFrom" runat="server" /></td>
                    <td><asp:TextBox ID="txtEmailFrom" runat="server" Width="500" MaxLength="100" />
                        <div><asp:RegularExpressionValidator ID="regexEmailFrom" runat="server" ControlToValidate="txtEmailFrom" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"/></div>
                    </td>
                </tr>
                <tr>
	                <td class="DNNInfo_Label"><dnn:Label ID="lblEmailSubject" runat="server" /></td>
                    <td><asp:TextBox ID="txtEmailSubject" runat="server" Width="500" MaxLength="255" /><span class="DNNInfo_Required">*</span>
    	                <div><asp:RequiredFieldValidator ID="reqEmailSubject" runat="server" ControlToValidate="txtEmailSubject"/></div>
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblEmailContent" runat="server" /></td>
                    <td><dnn:texteditor id="txtEmailContent" runat="server" height="450" width="500"></dnn:texteditor></td>
                </tr>
                <tr>
	                <td></td>
                    <td><asp:Button ID="btnUpdate" runat="server" CssClass="DNNInfo_Button"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><div class="DNNInfo_Note"><dnn:Label ID="lblTokenReplacement" runat="server" /></div></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>
