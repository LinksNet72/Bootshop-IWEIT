<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLayout.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="IWEIT.index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/1.png" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="register.html"><img style="width:100%" src="themes/images/carousel/2.png" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="register.html"><img src="themes/images/carousel/3.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/4.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/5.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			</div>
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="register.html"><img src="themes/images/carousel/6.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

		<div class="span9">		
        		<h4>Latest Products </h4>
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
