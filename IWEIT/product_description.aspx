<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="product_description.aspx.cs" Inherits="IWEIT.product_description" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="index.aspx">Home</a></li>
                        <li>
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                   </ul>
                </div>
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
        
        </HeaderTemplate>
        <ItemTemplate>
        
                
                <div id="gallery" class="span3">
                    <a href="<%#Eval("ItemImage") %>" title="<%#Eval("Item_Name") %>">
                    <img src="<%#Eval("ItemImage") %>" style="width:100%" alt="" />
                    </a>
                </div>

                <div class="span6">
                    <h3><%#Eval("Item_Name") %></h3>
                    <h5><%#Eval("Item_Description") %></h5>
                    <hr class="soft" />
                    <div class="form-horizontal qtyFrm">
                    <div class="control-group">
                        <h4 class="control-label">N<%#Eval("Price") %></h4>
                        <div class="controls">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="span1">
                            <asp:ListItem>qty</asp:ListItem>
                            </asp:DropDownList>
                            <button type="submit" class="btn btn-large btn-primary pull-right" id="btnAddToCart" runat="server" onserverclick="btnAddToCart_Click"> Add to cart 
                            <i class=" icon-shopping-cart"></i></button>
                        </div>
                    </div>
                    </div>
                    <hr class="soften" />
                    <h4><%#Eval("Quantity").ToString() %> items in stock</h4>
                    <hr class="soft clr"/>
				        <p><%#Eval("Full_Description") %> </p>
                </div>
            
        </ItemTemplate>
        <FooterTemplate>
        
        </FooterTemplate>
    </asp:Repeater>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
</asp:Content>
