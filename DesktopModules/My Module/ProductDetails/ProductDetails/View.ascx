
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.ProductDetails.View" %>

<style>
    .heading_text {
         background: #efefec; 
        margin-top: 20px;
        margin-bottom: 20px;
        border-left: 4px solid #f6763a;
        padding: 10px 19px;
        
    }   
    .text_size{
        font-size:23px;
    }
    .inputProductRating {
     margin: 0px;
     font-size: 22px;
    }
   .productRating {
       color: #f2711f;
   }
  .glyphicon {
  position: relative;
  top: 1px;
  display: inline-block;
  font-family: 'Glyphicons Halflings';
  -webkit-font-smoothing: antialiased;
  font-style: normal;
  font-weight: normal;
  line-height: 1;
  -moz-osx-font-smoothing: grayscale;
 }
   .glyphicon:empty {
  width: 1em;
}
   .glyphicon-star {
  display: none;
}
    .inputProductRating li {
  list-style-type: none;
  display: inline;
  margin: 0px 2px;
  cursor: pointer;
}
    textarea.form-control {
  height: auto;
    display: block;
    width:60%;
}


</style>  

<script src="/DesktopModules/My Module/ProductDetails/ProductDetails/Mystyle/bootstrap.min.css" type="text/javascript"></script>
<!-- Latest compiled and minified CSS -->
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
<script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"  type="text/javascript"></script>

 


<script type="text/javascript">
        var selectedRating = 0;

    jQuery(document).ready(function(){
	
        jQuery(".inputProductRating li").find(".glyphicon-star").hide();

        jQuery(".inputProductRating li").mouseover(function(){
            var rating = jQuery(this).attr("data-rel");
			
            jQuery(".inputProductRating li .glyphicon-star-empty").show();
            jQuery(".inputProductRating li .glyphicon-star").hide();
			
            for(var i = 0; i < rating; i++){
                var item = jQuery(".inputProductRating li").eq(i);
                jQuery(item).find(".glyphicon-star-empty").hide();
                jQuery(item).find(".glyphicon-star").show();
            }
        }).mouseleave(function(){
            if(selectedRating == 0){
                jQuery(".inputProductRating li").find(".glyphicon-star-empty").show();
                jQuery(".inputProductRating li").find(".glyphicon-star").hide();
            }else{
			
            }			
        }).click(function(){
            selectedRating = jQuery(this).attr("data-rel");
            for(var i = 0; i < selectedRating; i++){
                var item = jQuery(".inputProductRating li").eq(i);
                jQuery(item).find(".glyphicon-star-empty").hide();
                jQuery(item).find(".glyphicon-star").show();
            }
        });
    });

</script>       

<asp:ListView ID="ProductDetails" runat="server">

<ItemTemplate>

     <div class="content_products">
     <h3><a href="#">  <%# Eval("ProductName") %></a></h3>

     <img src="<%# Eval("ImageUrl") %>" alt="Gravity Series" style="width: 400px; height: 400px;">
    <div class="heading_text"><span class="text_size">Description</span>   </div>       


     <p><span style="color: #000000;"> <%# System.Web.HttpUtility.HtmlDecode(Convert.ToString(Eval("Description"))) %></span></p>
     </div>
    <%--<div class="heading_text"><span class="text_size">Review</span>   </div>
       <ul class="productRating inputProductRating">
       <li data-rel="1">
				<i class="glyphicon glyphicon-star"></i>
				<i class="glyphicon glyphicon-star-empty"></i>
			</li>
            <li data-rel="2">
				<i class="glyphicon glyphicon-star"></i>
				<i class="glyphicon glyphicon-star-empty"></i>
			</li>
            <li data-rel="3">
				<i class="glyphicon glyphicon-star"></i>
				<i class="glyphicon glyphicon-star-empty"></i>
			</li>
            <li data-rel="4">
				<i class="glyphicon glyphicon-star"></i>
				<i class="glyphicon glyphicon-star-empty"></i>
			</li>
            <li data-rel="5">
				<i class="glyphicon glyphicon-star"></i>
				<i class="glyphicon glyphicon-star-empty"></i>
			</li>
        </ul>--%>
 <%--    <div class="form-group">
		
		<textarea id="review" class="form-control" placeholder="Write your review of this product here"></textarea>
         <a class="altButton" href="#">Submit</a>
	</div>--%>
    
</ItemTemplate>

</asp:ListView>
<div class="heading_text"><span class="text_size">Share</span></div>
<div>
<div class="fb-root"></div>
<div class="fb-share-button" data-href="<%# Eval("pathurl") %>" data-layout="button"></div>
<a href="https://twitter.com/share" class="twitter-share-button" data-url="<%# Eval("pathurl") %>" data-size="default" data-count="none">Tweet</a>
</div>


<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script>!function (d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
    if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); }}
    (document, "script", "twitter-wjs");

</script>
  





  