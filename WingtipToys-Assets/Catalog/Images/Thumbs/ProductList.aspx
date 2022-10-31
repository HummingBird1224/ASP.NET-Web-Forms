	<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
         CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section style="background-color:whitesmoke">
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" runat="server" 
                DataKeyNames="ProductID" GroupItemCount="4"
                ItemType="WingtipToys.Models.Product" SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table >
                        <tr >
                            <td class="tod">No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr  id="itemPlaceholderContainer" runat="server" class="row">
                        <td id="itemPlaceholder" runat="server" class="tod" ></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate >
                    <div runat="server" style=" padding:10px;border:0.5px solid lightGray; border-radius:15px; width:30%; margin-right:15px;margin-left:15px; margin-bottom:20px; background:white" >
                        <div >
                            <div  style="display:flex">
                                <div >
                                  <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                    <image src='/Catalog/Images/Thumbs/<%#:Item.ImagePath%>'
                                      width="150" height="150" border="1" />
                                  </a>
                                </div>
                                <div style="margin-left:20px">
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>" style="color:slategrey;font-weight:500;font-size:25px; font-family:monospace">
                                      <%#:Item.ProductName%>
                                    </a>
                                    <br />
                                    <span style="color:deepskyblue;font-size:18px;text-align:center">
                                        <%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">               
                                        <span class="ProductListItem" >
                                            <b style="color:limegreen; font-size:20px">Add To Cart<b>
                                        </span>           
                                    </a>
                                </div>
                            </div>
                            <!--<tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                      <%#:Item.ProductName%>
                                    </a>
                                    <br />
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br />
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">               
                                        <span class="ProductListItem">
                                            <b>Add To Cart<b>
                                        </span>           
                                    </a>
                                </td>
                            </tr>-->
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </div>
                        </p>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;" >
                        <tbody>
                            <tr>
                                <td style="display:flex; flex-wrap:wrap">
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>