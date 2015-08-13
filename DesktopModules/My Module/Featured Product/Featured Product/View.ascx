<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.Featured_Product.View" %>


<style>
 .heading_text {
        /* background: #efefec; */
        margin-top: 20px;
        margin-bottom: 20px;
        border-left: 4px solid #f6763a;
        padding: 10px 19px;
       }  
 .fbox{
     border: 1px solid #c9c7c7;
     margin:20px;
     padding:10px;
 }
   .fbox:hover {
        border: 1px solid #f2711f;
       -moz-box-shadow: 0 0 5px rgba(0,0,0,0.5);
	   -webkit-box-shadow: 0 0 5px rgba(0,0,0,0.5);
	   box-shadow: 0 0 5px rgba(0,0,0,0.5);
    }

   /*slider*/
 .slider-wrap {
    position: relative;
    margin: 50px auto;
    /*width: 520px;*/
    width: 93%;
}
.slider {
    position: relative;
    width: 450px;
    margin: auto;
}
ul {
    margin: 0;
    padding:0;
}
ul li {
    list-style: none;
    /*text-align: center;*/
}
/*ul li span {
    display: inline-block;
    vertical-align: middle;
    width: 100px;
    height: 100px;
    background: black;
}*/
.slider-arrow {
    position: absolute;
    top: -36px;
    width: 32px;
    height: 20px;
    background: rgb(241, 240, 236);
    color: #fff;
    text-align: center;
    text-decoration: none;
    font-size: 27px;
    margin-left: 799px;
    padding: 5px 8px 5px 5px;
    /*top: 40px;
    width: 20px;
    height: 20px;
    background: black;*/
 
    /* border-radius: 31%; */
  
}
.sa-left {
    left: 10px;
}
.sa-right {
    right: 10px;
}


 
</style>
<%--<script type="text/javascript" src="DesktopModules/My Module/Featured Product/Featured Product/sliderplugin/jQuery v1.7.2.js"></script>--%>

<script type="text/javascript" src="DesktopModules/My Module/Featured Product/Featured Product/sliderplugin/jquery.lbslider.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('.fslider').lbSlider({
            leftBtn: '.sa-left',
            rightBtn: '.sa-right',
            visible: 3,
            autoPlay: true,
            autoPlayDelay: 5
        });
    });
</script>

 <div class="heading_text"><h3>Featured Product</h3></div>

 <div class="slider-wrap">
    <div class="fslider">
        <ul>
            <asp:ListView runat="server" ID="FeaturedProduct" >
           <ItemTemplate>
            <li> <span>
                <img src="<%# Eval("ImageUrl") %>" alt="Gravity Series" style="width: 300px; height: 200px;"></span> <br />  
                <center><span><h3><a href="/productdetails?PId=<%# Eval("ProductId") %>">  <%# Eval("ProductName") %></a></h3></span><br /></center>
                 

            </li>
            </ItemTemplate>
     </asp:ListView>
        </ul>
    </div>
     
<a href="#" class="slider-arrow sa-left">&lt;</a>

<a href="#" class="slider-arrow sa-right">&gt;</a>

</div>
    
        
 

                            
