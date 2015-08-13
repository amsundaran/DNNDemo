<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.NewsLetter.View" %>

      
<style>
    .Nbtn{
		  border-radius: 4.5em;
         text-decoration: none;
         color: white;
         background-color: #329bd8;
         /*text-transform: uppercase;*/
         font-weight: bold;
         height: 36px;
         width: 113px;			
	 }

	.Nbtn:hover {
		background-color: transparent; 
		border: 0.15em #329bd8 solid;	
		color: #329bd8;					
	}
     .Error
    {
        border-color: red;
    }
   .SucessMsg{
    
    color: #358927;
    background-color: #C1ECB9;
    -moz-border-radius: 3px;
    border-radius: 3px;
    padding: 2px 0px 3px 6px;
    display: table;
    line-height: 1.4;
    width: 189px;
    }

</style>

<script type="text/javascript">
    $(document).ready(function () {
        $("#lblresponse").hide();
        $('#txtEmail').removeClass('Error');
        $('#sub_Nletter').click(function () {
           
            var Subemail = $('#txtEmail').val();

            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            
            if (filter.test(Subemail)) {
                $.ajax({
                    type: "POST",           
                    url: "/DesktopModules/My Module/NewsLetter/NewsLetter/NewsSubscribe.asmx/SubscribeMail",
                    data: '{Subemail: ' + JSON.stringify(Subemail) + '}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        $("#lblresponse").show();
                        $("#lblresponse").text(response.d);
                        $('#txtEmail').val("");
                        $('#txtEmail').css('border-color', '#f3f3f3');
                        //$('#txtEmail').removeClass('Error');
                    }
                });

            }
            else {

                //$('#txtEmail').addClass('Error');
                $('#txtEmail').css('border-color', 'red');
               
             

            }

        });       
    });
   
    
</script>
<div>
   
    <%--<p>Subscribe News Letter</p>--%>
    <form id="news">
    <input type="text" id="txtEmail" name="txtEmail">
    <label id="lblresponse" class="SucessMsg"></label>
    <button type="button" name="sub_Nletter" id="sub_Nletter" class="Nbtn">Subscribe</button>
   <%-- <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>--%>
    <%--<asp:Button ID="sub_Nletter" CssClass="Nbtn" runat="server" Text="Submit" />--%>
    </form>
</div>