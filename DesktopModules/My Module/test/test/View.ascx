<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.test.View" %>

<style>

.itembox{

    background-color: #ffffff;
    border: 1px solid #c9c7c7;
    margin-bottom: 20px;
    text-align: center;
 }
.itembox:hover{
    border: solid 1px #CCC; 
    -moz-box-shadow: 1px 1px 5px #999; 
    -webkit-box-shadow: 1px 1px 5px #999; 
    box-shadow: 1px 1px 5px #999; 
}
.contentalign{
    text-align:justify;
}
  
.numeric_button
{
   
     display: inline-block;
    padding: 0px 9px;
    margin-right: 4px;
    border-radius: 3px;
    border: solid 1px #c0c0c0;
    background: #e9e9e9;
    box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
    font-size: .875em;
    font-weight: bold;
    text-decoration: none;
    color: #717171;
    text-shadow: 0px 1px 0px rgba(255,255,255, 1);
}
.current_page
{
 
    display: inline-block;
    padding: 0px 9px;
    margin-right: 4px; 
    border: none;
    border-radius: 3px;
    background: #616161;
    box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
    color: #f0f0f0;
    text-shadow: 0px 0px 3px rgba(0,0,0, .5);  
}
.next_button
{
    display: inline-block;
    padding: 0px 9px;
    margin-right: 4px;
    border-radius: 3px;
    border: solid 1px #c0c0c0;
    background: #e9e9e9;
    box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
    font-size: .875em;
    font-weight: bold;
    text-decoration: none;
    color: #717171;
    text-shadow: 0px 1px 0px rgba(255,255,255, 1);

      
}
    .content_products ul li {
  display: inline-block;
  width: 31%;
  margin-right: 30px;
  margin-bottom: 45px;
  vertical-align: top;
  list-style-type: none;
}
  div.StoreListContainer-Content {
  margin: 0;
  padding: 10px;
  text-align: center;
  min-height: 100px;
}

</style>
<%--<asp:ListView ID="ProductList" runat="server">
      <ItemTemplate>
    
         <div class="content_products">
     <ul>
    <li><a name="gravity"></a>
    <img src="<%# Eval("ImageUrl") %>" alt="Gravity Series" style="width: 300px; height: 200px;">
    <h3><a href="#">  <%# Eval("ProductName") %></a></h3>
    <p><span style="color: #000000;"> <%# Eval("Summary") %> </span></p>
    <a class="altButton" href="/productdetails?PId=<%# Eval("ProductId") %>">View Details</a>
    </li>
     </ul>
             </div>--%>


<%--        </ItemTemplate>

</asp:ListView>--%>
<asp:ListView runat="server" ID="ProductList" GroupItemCount="3" OnPagePropertiesChanging="ProductList_PagePropertiesChanging">
  <LayoutTemplate>
    <table runat="server" id="table1">
      <tr runat="server" id="groupPlaceholder">
      </tr>
    </table>
  </LayoutTemplate>
  <GroupTemplate>
    <tr runat="server" id="tableRow">
      <td runat="server" id="itemPlaceholder" />
    </tr>
  </GroupTemplate>
  <ItemTemplate>
    <td runat="server" style="width:310px; height:370px;">
   
      <%-- Data-bound content. --%>
 <div class="itembox">
    <span><img src="<%# Eval("ImageUrl") %>" alt="Gravity Series" style="width: 300px; height: 200px;"></span> <br />  
                <span><h3><a href="#">  <%# Eval("ProductName") %></a></h3></span><br /> 
                <span class="contentalign" style="color: #636464;"> <%# Eval("Summary") %> </span> <br />
                <a class="altButton" href="/productdetails?PId=<%# Eval("ProductId") %>">View Details</a>
     </div>
    </td>
  </ItemTemplate>
</asp:ListView>
<br />
<asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ProductList" PageSize="3">
            <Fields>
                <%--<asp:NumericPagerField ButtonType="Link" />--%>
                <asp:NumericPagerField ButtonCount="3" NumericButtonCssClass="numeric_button" CurrentPageLabelCssClass="current_page" NextPreviousButtonCssClass="next_button" />
            </Fields>
  </asp:DataPager>
