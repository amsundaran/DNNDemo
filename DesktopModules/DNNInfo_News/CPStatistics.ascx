<%@ Control Language="C#" AutoEventWireup="false" Inherits="DNNInfo.Modules.News.Controls.CPStatistics" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Literal ID="litScript" runat="server" />
<div class="DNNInfo_Box">
    <div class="DNNInfo_BoxHeader"><dnn:Label ID="lblStatistics" runat="server" /></div>
    <div class="DNNInfo_BoxInside">
        <asp:Panel ID="pnlStatistic" runat="server" DefaultButton="btnShow">
            <table class="DNNInfo_TableNormal" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblStatisticType" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddStatisticType" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblStartDate" runat="server" /></td>
                    <td><asp:TextBox ID="txtStartDate" runat="server" CssClass="DNNInfo_TextDate" MaxLength="10"/>
                        <asp:RequiredFieldValidator ID="reqStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDate" />
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblEndDate" runat="server" /></td>
                    <td><asp:TextBox ID="txtEndDate" runat="server" CssClass="DNNInfo_TextDate" MaxLength="10"/>
                        <asp:RequiredFieldValidator ID="reqEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDate" />
                    </td>
                </tr>
                <tr>
                    <td class="DNNInfo_Label"><dnn:Label ID="lblNoOfRecords" runat="server" /></td>
                    <td><asp:Dropdownlist ID="ddNoOfRecords" runat="server"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnShow" runat="server" CssClass="DNNInfo_Button"/></td>
                </tr>
            </table>
        </asp:Panel>
        
        <asp:Panel ID="pnlPeriod" runat="server">
            <div class="DNNInfo_StatisticPeriod"><asp:Literal ID="litPeriod" runat="server" /></div>
            <div class="DNNInfo_Result"><asp:Literal ID="litStatistics" runat="server" /></div>
        </asp:Panel>
    </div>
</div>
