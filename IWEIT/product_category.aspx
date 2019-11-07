<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="product_category.aspx.cs" Inherits="IWEIT.product_category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

        <div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="index.aspx">Home</a></li>
                   </ul>
                </div>

                <div class="form-horizontal span6">
            <div class="control-group">
                <label class="control-label alignL">Sort By </label>
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </div>
        </div>
    <div class="span9">		
        <asp:Label ID="Label1" runat="server" Text="" Font-Bold="True" Font-Size="24px"></asp:Label>
            <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                    <ul class="thumbnails">
            </HeaderTemplate>
                <ItemTemplate>
				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_description.aspx?id=<%#Eval("Id") %>"><img src="<%#Eval("ItemImage") %>" alt=""/></a>
					<div class="caption">
					  <h5><%#Eval("Item_Name") %></h5>
					  <p> 
						<%#Eval("Item_Description") %>
					  </p>
					 
					  <h4 style="text-align:center"><a class="btn" href="<%#Eval("ItemImage") %>">
                       <i class="icon-zoom-in"></i></a> <button class="btn" id="btnAddToCart" runat="server" onserverclick ="btnAddToCart_Click">
                       Add to <i class="icon-shopping-cart"></i></button> <span class="pull-right">N<%#Eval("Price") %></span></h4>
					</div>
				  </div>
				</li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>

				</div>
</asp:Content>
