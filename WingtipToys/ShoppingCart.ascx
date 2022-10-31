<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.ascx.cs" Inherits="WingtipToys.ShoppingCart" %>

<div id="Content1" runat="server" class="cart-wrapper" >
    <div class="cart-products-list">
        <div id="ShoppingCartTitle" runat="server" class="cart-header">
            <h2 class="product-font pl-15">
                <span role="img" aria-label="shopping-cart" class="anticon anticon-shopping-cart">
                    <svg viewBox="0 0 1024 1024" focusable="false" data-icon="shopping-cart" width="1.5em" height="1.5em" fill="currentColor" aria-hidden="true">
                        <path d="M922.9 701.9H327.4l29.9-60.9 496.8-.9c16.8 0 31.2-12 34.2-28.6l68.8-385.1c1.8-10.1-.9-20.5-7.5-28.4a34.99 34.99 0 00-26.6-12.5l-632-2.1-5.4-25.4c-3.4-16.2-18-28-34.6-28H96.5a35.3 35.3 0 100 70.6h125.9L246 312.8l58.1 281.3-74.8 122.1a34.96 34.96 0 00-3 36.8c6 11.9 18.1 19.4 31.5 19.4h62.8a102.43 102.43 0 00-20.6 61.7c0 56.6 46 102.6 102.6 102.6s102.6-46 102.6-102.6c0-22.3-7.4-44-20.6-61.7h161.1a102.43 102.43 0 00-20.6 61.7c0 56.6 46 102.6 102.6 102.6s102.6-46 102.6-102.6c0-22.3-7.4-44-20.6-61.7H923c19.4 0 35.3-15.8 35.3-35.3a35.42 35.42 0 00-35.4-35.2zM305.7 253l575.8 1.9-56.4 315.8-452.3.8L305.7 253zm96.9 612.7c-17.4 0-31.6-14.2-31.6-31.6 0-17.4 14.2-31.6 31.6-31.6s31.6 14.2 31.6 31.6a31.6 31.6 0 01-31.6 31.6zm325.1 0c-17.4 0-31.6-14.2-31.6-31.6 0-17.4 14.2-31.6 31.6-31.6s31.6 14.2 31.6 31.6a31.6 31.6 0 01-31.6 31.6z"></path>
                    </svg>
                </span>
                Cart Items
            </h2>
        </div>
        <asp:Gridview ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" CellPadding="0" ShowHeader="False"
            ItemType="WingtipToys.Models.CartItem" SelectMethod="GetShoppingCartItems" BorderStyle="None"
            CssClass="cart-products border-none" >   
            <Columns >  
                <asp:TemplateField >     
                   <ItemTemplate>
                       <asp:ImageButton ImageUrl=<%#: "~/Images/products/"+Item.Product.ImagePath+"" %> runat="server" CssClass="cart-item-image"/>
                   </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>     
                   <ItemTemplate>
                      <div class="cart-product-details">
                          <p class="product-font"> <%#: Item.Product.ProductName %> </p>
                          <p class="product-font">$<%#: Item.Product.UnitPrice %> x <%#: Item.Quantity %></p>
                      </div>
                   </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField>            
                     <ItemTemplate >
                         <div class="cart-product-details">
                              <p class="product-font"> Quantity</p>
                              <div class="cart-product-quantity">
                                  <button id="MinusButton"  class="icon-card" onclick="MinusButton_Click()">
                                      <span role="img" aria-label="minus" class="anticon anticon-minus">
                                          <svg viewBox="64 64 896 896" focusable="false" data-icon="minus" width="1em" height="1em" fill="currentColor" aria-hidden="true">
                                              <path d="M872 474H152c-4.4 0-8 3.6-8 8v60c0 4.4 3.6 8 8 8h720c4.4 0 8-3.6 8-8v-60c0-4.4-3.6-8-8-8z"></path>
                                          </svg>
                                      </span>
                                  </button>
                                  <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                                  <button id="PlusButton"  class="icon-card" onclick="PlusButton_Click()">
                                      <span role="img" aria-label="minus" class="anticon anticon-minus">
                                          <svg viewBox="64 64 896 896" focusable="false" data-icon="minus" width="1em" height="1em" fill="currentColor" aria-hidden="true">
                                              <path d="M482 152h60q8 0 8 8v704q0 8-8 8h-60q-8 0-8-8V160q0-8 8-8z"></path>
                                              <path d="M176 474h672q8 0 8 8v60q0 8-8 8H176q-8 0-8-8v-60q0-8 8-8z"></path>
                                          </svg>
                                      </span>
                                  </button>
                              </div>
                          </div>                            
                     </ItemTemplate>        
                </asp:TemplateField>  
               <asp:TemplateField>
                    <ItemTemplate>
                        <div class="cart-product-details">
                          <p class="product-font"> Price per Unit </p>
                          <asp:TextBox ID="TextBox1" Width="60" runat="server" Text="<%#: Item.Product.UnitPrice %>"></asp:TextBox>
                      </div>                    
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>            
                    <ItemTemplate >
                        <p class="product-font cart-product-price">
                        <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                        (ex,tax)
                        </p>
                    </ItemTemplate>        
                </asp:TemplateField> 
                <asp:TemplateField >            
                        <ItemTemplate>
                            <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                        </ItemTemplate>        
                </asp:TemplateField>   
                <asp:TemplateField >            
                        <ItemTemplate>
                            <asp:ImageButton id="RemoveButton" runat="server" OnCommand="RemoveButton_Click" CommandArgument="<%#: Item.CartId%>" CommandName="<%#: Item.ProductId%>"  ImageUrl="~/Images/media/svg/buttons/delete-button.svg" CssClass="delete-button" AlternateText="Item.CartId">
                            </asp:ImageButton>
                        </ItemTemplate>        
                </asp:TemplateField>
            </Columns>    
        </asp:Gridview>
    </div>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong> 
    </div>
    <br />
    <table> 
    <tr>
      <td>
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
      </td>
      <td>
        <asp:ImageButton ID="CheckoutImageBtn" runat="server" 
                      ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" 
                      Width="145" AlternateText="Check out with PayPal" 
                      OnClick="CheckoutBtn_Click" 
                      BackColor="Transparent" BorderWidth="0" />
      </td>
    </tr>
    </table>
</div>
