<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="shopping_cart.aspx.cs" Inherits="IWEIT.shopping_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
<div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="index.aspx">Home</a></li>
                   </ul>
  </div>

  <h3>Shopping Cart <small><%#Eval("items") %> items</small></h3>
  <hr class="soften" />
    <asp:DataList ID="DataList1" runat="server">
        <HeaderTemplate>
            <table class="table table-bordered">
            <thead>
            <tr>
                  <th>Product</th>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Quantity/Update</th>
				  <th>Price</th>

        </HeaderTemplate>

        <ItemTemplate>
            <tbody>
                <tr>
                    <td> <img width="60" src="<%#Eval("img") %>" alt="" /></td>
                    <td> <%#Eval("name") %></td>
                    <td> <%#Eval("desc") %></td>
                    <td>
                        <div class="input-append">
                            
                            <button class="btn" type="button" id="btnQtyDecrease" runat="server"><i class="icon-minus"></i></button>
                            <button class="btn" type="button" id="btnQtyIncrease" runat="server"><i class="icon-plus"></i></button>
                            <button class="btn btn-danger" type="button" id="btnQtyCancel" runat="server"><i class="icon-remove icon-white"></i></button>	
                        </div>
                    </td>
                    <td> <%#Eval("price") %></td>
                </tr>
                <tr>
                  <td colspan="6" style="text-align:right">Total Price:	</td>
                  <td> Total </td>
                </tr>
            </tbody>
        </ItemTemplate>

        <FooterTemplate>
        				</tr>
                </thead>
            </table>
        </FooterTemplate>
    </asp:DataList>
    <a href="index.aspx" class="btn btn-large pull-right">Purchase</a>
</asp:Content>
