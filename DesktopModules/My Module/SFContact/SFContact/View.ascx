<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.SFContact.View" %>
<style>
.Nbtn{
		  border-radius: 4.5em;
         text-decoration: none;
         color: white;
         background-color: #329bd8;
         text-transform: uppercase;
         font-weight: bold;
         height: 36px;
         width: 113px;			
	 }

	.Nbtn:hover {
		background-color: transparent; 
		border: 0.15em #329bd8 solid;	
		color: #329bd8;					
	}
    .lbl{
    
    color: #358927;
    background-color: #C1ECB9;
    -moz-border-radius: 3px;
    border-radius: 3px;
    padding: 6px 10px 6px 55px;
    line-height: 1.4;
    }
    .err {
  border:2px solid red;
}
</style>

<script type="text/javascript">

    function validate()
    {
        var fname = document.getElementById("<%=txtFirstName.ClientID%>").value;
        var lname = document.getElementById("<%=txtLastName.ClientID%>").value;
        var cname = document.getElementById("<%=txtCmpnyName.ClientID%>").value;
        var email = document.getElementById("<%=txtEmail.ClientID%>").value;
        var msg = document.getElementById("<%=txtMsg.ClientID%>").value;
        initialstyle();
      
        if (fname == "") {
            document.getElementById("freq").style.display = '-webkit-inline-box';
            document.getElementById("<%=txtFirstName.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtFirstName.ClientID%>").style.background = "#E2C7C7";
         <%--   document.getElementById("<%=txtFirstName.ClientID%>").className = document.getElementById("<%=txtFirstName.ClientID%>").className + " err";--%>
            document.getElementById("<%=txtFirstName.ClientID%>").focus();
            return false;
        }
        if (lname == "") {
            document.getElementById("lreq").style.display = '-webkit-inline-box';
            document.getElementById("<%=txtLastName.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtLastName.ClientID%>").style.background = "#E2C7C7";
            document.getElementById("<%=txtLastName.ClientID%>").focus();
            return false;
        }
        if (cname == "") {
            document.getElementById("creq").style.display = '-webkit-inline-box';
            document.getElementById("<%=txtCmpnyName.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtCmpnyName.ClientID%>").style.background = "#E2C7C7";
            document.getElementById("<%=txtCmpnyName.ClientID%>").focus();
            return false;
        }
        if (email == "") {
            document.getElementById("ereq").style.display = '-webkit-inline-box';
            document.getElementById("<%=txtEmail.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtEmail.ClientID%>").style.background = "#E2C7C7";
            document.getElementById("<%=txtEmail.ClientID%>").focus();
            return false;
        }
      <%--  var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (!filter.test(email.value)) { {
            document.getElementById("<%=txtEmail.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtEmail.ClientID%>").focus();
            return false;
        }--%>
        if (msg == "") {
            document.getElementById("mreq").style.display = '-webkit-inline-box';
            document.getElementById("<%=txtMsg.ClientID%>").style.border = "2px solid red";
            document.getElementById("<%=txtMsg.ClientID%>").style.background = "#E2C7C7";
            document.getElementById("<%=txtMsg.ClientID%>").focus();
            return false;
        }
        
        
        return true;
    }
    function initialstyle()
    {
        document.getElementById("freq").style.display = 'none';
        document.getElementById("lreq").style.display = 'none';
        document.getElementById("creq").style.display = 'none';
        document.getElementById("ereq").style.display = 'none';
        document.getElementById("mreq").style.display = 'none';
        document.getElementById("<%=txtFirstName.ClientID%>").style.border = "2px solid #bfbfbf"; 
        document.getElementById("<%=txtLastName.ClientID%>").style.border = "2px solid #bfbfbf"; 
        document.getElementById("<%=txtCmpnyName.ClientID%>").style.border = "2px solid #bfbfbf"; 
        document.getElementById("<%=txtEmail.ClientID%>").style.border = "2px solid #bfbfbf"
        document.getElementById("<%=txtMsg.ClientID%>").style.border = "2px solid #bfbfbf";;
        document.getElementById("<%=txtFirstName.ClientID%>").style.background = "#f3f3f3";
        document.getElementById("<%=txtLastName.ClientID%>").style.background = "#f3f3f3";
        document.getElementById("<%=txtCmpnyName.ClientID%>").style.background = "#f3f3f3";
        document.getElementById("<%=txtEmail.ClientID%>").style.background = "#f3f3f3";
        document.getElementById("<%=txtMsg.ClientID%>").style.background = "#f3f3f3";
    }


    
</script>

     <div class="form_oneCol">
         <label>First Name:&nbsp;<span id="freq" style="display:none;color:red;font-size:large">* </span></label>
         <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <label>Last Name:&nbsp;<span id="lreq" style="color:red;display:none;font-size:large">* </span></label>
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <label>Company Name:&nbsp;<span id="creq" style="color:red;display:none;font-size:large">* </span></label>
        <asp:TextBox ID="txtCmpnyName" runat="server"></asp:TextBox>
        <label>Email:&nbsp;<span id="ereq" style="color:red;display:none;font-size:large">* </span></label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <label>Message:&nbsp;<span id="mreq" style="color:red;display:none;font-size:large">* </span></label>
         <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine"></asp:TextBox>


<%--<button class="primaryButton" type="submit">Send</button>--%>
         <asp:Label ID="lblsuccess" CssClass="lbl" runat="server" Visible="false"></asp:Label>
          <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="Nbtn" OnClientClick="return validate()" OnClick="btnSubmit_Click"/>
        

        </div>