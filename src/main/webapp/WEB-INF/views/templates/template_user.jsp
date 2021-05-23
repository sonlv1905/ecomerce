<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Ecommerce BoEC</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content=""> 
<meta name="author" content="">
<meta name="google-signin-client_id" content="233610236874-525nhkem2k4e0dj4srmphovrvasegql1.apps.googleusercontent.com">


<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/user/themes/bootshop/bootstrap.min.css" media="screen" />
<link href="${pageContext.request.contextPath }/resources/user/themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="${pageContext.request.contextPath }/resources/user/themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/user/themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="${pageContext.request.contextPath }/resources/user/themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/user/themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath }/resources/user/themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath }/resources/user/themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath }/resources/user/themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/resources/user/themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
						
				<% 
					String userImg = (String)session.getAttribute("userImg");
					String user = (String)session.getAttribute("username");
					if(user !="" && user != null){
				%>
				<div class="span6">
					<% 
						if(userImg !="" && userImg != null){
					%>
						<img alt="<%= userImg %>" src="<%= userImg %>" width="30px">
					<%} %>
			        Welcome!<strong>  <%=session.getAttribute("username") %> </strong>
				</div>
				<%
					}else{					
				%>
				<div class="span6">
			       Please Login
				</div>
				<%
					}
				%>
				
				<div class="span6">
					<div class="pull-right">
						
							<a href="/admin/login"><span></span><span class="btn btn-mini">Admin</span></a>
							
							<a href="/cart">
								<span class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> [ <c:out value="${cartProduct.size()}" /> ] Itemes in your
								cart </span> 
							</a>
					</div>
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="/home"><img
						src="${pageContext.request.contextPath }/resources/user/themes/images/logo.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="srchFld" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<option>CLOTHES</option>
							<option>FOOD AND BEVERAGES</option>
							<option>HEALTH & BEAUTY</option>
							<option>SPORTS & LEISURE</option>
							<option>BOOKS & ENTERTAINMENTS</option>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="special_offer.html">Specials Offer</a></li>
						<li class=""><a href="normal.html">Delivery</a></li>
						<li class=""><a href="contact.html">Contact</a></li>
						
						<% 
							if(user =="" || user == null){
						%>
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a>
							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">-</button>
									<h3>Login user</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm" action="${pageContext.request.contextPath }/checklogin" method="post">
										<div class="control-group">
											<input type="text" id="inputEmail" placeholder="Email" name="username" required>
										</div>
										<div class="control-group">
											<input type="password" id="inputPassword" name="password" required
												placeholder="Password">
										</div>
										<div class="control-group">
											<label class="checkbox"> <input type="checkbox">
												Remember me
											</label>
										</div>
										<button type="submit" class="btn btn-success">Sign in</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
									<!-- <button type="submit" class="btn btn-success">Sign in</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button> -->
								</div>
							</div>
						</li>
						<%
							}else{					
						%>
						<li class="">
							<a href="/logout" role="button" data-toggle="modal" style="padding-right: 0">
								<span class="btn btn-large btn-secondary">Logout</span>
							</a>
						</li>
						<%
							}
						%>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<a href="/register"><img style="width: 100%"
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/1.png" alt="special offers" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="/register"><img style="width: 100%"
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/2.png" alt="" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="/register"><img
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/3.png" alt="" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>

					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="/register"><img
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/4.png" alt="" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>

					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="/register"><img
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/5.png" alt="" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="/register"><img
							src="${pageContext.request.contextPath }/resources/user/themes/images/carousel/6.png" alt="" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="/cart"><img
							src="${pageContext.request.contextPath }/resources/user/themes/images/ico-cart.png" alt="cart"> <c:out value="${cartProduct.size()}" /> Items in your
							cart <span class="badge badge-warning pull-right">$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" /></span></a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<c:forEach var="row" items="${Categories}">
							<li><a href="/category-products/${row.id }"> <c:out value = "${fn:toUpperCase(row.name)}" /></a></li>
						</c:forEach>
						<li class="subMenu"><a> OTHER [840] </a>
							<ul style="display: none">
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Shoes (8)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Men's Clothings (45)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Men's Shoes (6)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Kids Clothing (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Kids Shoes (3)</a></li>
							</ul></li>
						
						
					</ul>
					<br />
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath }/resources/user/themes/images/products/panasonic.jpg"
							alt="Bootshop panasonoc New camera" />
						<div class="caption">
							<h5>Panasonic</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.html"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath }/resources/user/themes/images/products/kindle.png"
							title="Bootshop New Kindel" alt="Bootshop Kindel">
						<div class="caption">
							<h5>Kindle</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.html"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath }/resources/user/themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="${pageContext.request.contextPath }/resources/user/themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="${pageContext.request.contextPath }/resources/user/themes/images/twitter.png" title="twitter" alt="twitter" /></a> <a
						href="#"><img width="60" height="60"
						src="${pageContext.request.contextPath }/resources/user/themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">Ecommerces</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/themes/js/jquery.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/user/themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/resources/user/themes/js/google-code-prettify/prettify.js"></script>

	<script src="${pageContext.request.contextPath }/resources/user/themes/js/bootshop.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/themes/js/jquery.lightbox-0.5.js"></script>
	<script type="text/javascript">
		function onSignIn(googleUser){
			var profile = googleUser.getBasicProfile();
			var imagerl = profile.getImageUrl();
			var name = profile.getName();
			var email = profile.getEmail();
			console.log(name)
		}
	</script>
	<span id="themesBtn"></span>
</body>
</html>