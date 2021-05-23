<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="">
	<ul class="breadcrumb">
		<li><a href="/home">Home</a> <span class="divider">/</span></li>
		<li class="active">SHOPPING CART</li>
	</ul>
	<h3>
		SHOPPING CART [ <small> <c:out value="${cartProduct.size()}" /> Item(s) </small>]<a href="/home"
			class="btn btn-large pull-right"><i class="icon-arrow-left"></i>
			Continue Shopping </a>
	</h3>
	<hr class="soft">
	<!-- checklogin -->
	<% 
		String user = (String)session.getAttribute("username");
		if(user =="" || user == null){		
	%>
	
	<table class="table table-bordered">
		<tbody>
			<tr>
				<th>I AM ALREADY REGISTERED</th>
			</tr>
			<tr>
				<td>
					<form class="form-horizontal" action="${pageContext.request.contextPath }/checklogin" method="post">
						
						<% if(request.getAttribute("ERROR") != null ){ %>
						
							<div class="control-group">
								<div class="alert alert-error">
									<button class="close" data-dismiss="alert">×</button>
									<strong>Error!</strong> <%= request.getAttribute("ERROR") %>
								</div>
							</div>
							
						<% } %>
						
					
						<div class="control-group">
							<label class="control-label" for="inputUsername">Username</label>
							<div class="controls">
								<input type="text" id="inputUsername" placeholder="Username" name="username" required>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPassword1">Password</label>
							<div class="controls">
								<input type="password" id="inputPassword1" name="password" placeholder="Password" required>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">Sign in</button>
								OR <a href="/register" class="btn">Register Now!</a>
							</div>
						</div>
						<div class="control-group">
							<div class="controls" style=" margin-bottom: 5px;">
								<a class="btn btn-primary btn-large" style="width: 250px;">
									<%-- <img width="30" height="30" src="${pageContext.request.contextPath }/resources/user/themes/images/facebook.png" title="facebook" alt="facebook"> --%>
									Sign in with Facebook
								</a>
							</div>
							<div class="controls" style=" margin-bottom: 5px;" data-onsuccess="onSignIn">
								<a class="btn btn-danger btn-large" style="width: 250px;"  href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9091/login-google&response_type=code&client_id=233610236874-525nhkem2k4e0dj4srmphovrvasegql1.apps.googleusercontent.com&approval_prompt=force">Sign in with Google</a>
							</div>
							
							<div class="controls">
								<a href="forgetpass.html" style="text-decoration: underline">Forgot
									password ?</a>
							</div>
						</div>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<%
		}else{					
	%>
	<div class="span8">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Product</th>
					<th>Description</th>
					<th>Quantity/Update</th>
					<th>Price</th>
					<!-- <th>Discount</th>
					<th>Tax</th> -->
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="row" items="${cartProduct}">
					<tr>
					<td><img src="${pageContext.request.contextPath }/uploads/images/${row.item.path}" width="70px" alt="img"></td>
					<td><c:out value="${row.item.title}" /><br>Color : black, Material : metal
					</td>
					<td>
						<div class="input-append">
							<input class="span1" style="max-width: 34px" placeholder="qty" value=<c:out value="${row.quantity}" /> 
								id="appendedInputButtons" size="16" type="number" required="required" min="1" step="any" value="1">
							<!-- <button class="btn" type="button">
								<i class="icon-minus"></i>
							</button>
							<button class="btn" type="button">
								<i class="icon-plus"></i>
							</button> -->
							<button class="btn btn-danger" type="button">
								<i class="icon-remove icon-white"></i>
							</button>
						</div>
					</td>
					<td>$<c:out value="${row.item.price}" /></td>
					<!-- <td>$25.00</td>
					<td>$15.00</td> -->
					<td>$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${row.quantity * row.item.price}" /></td>
				</tr>	
			</c:forEach>
				
				<!-- <tr>
					<td><img width="60" src="themes/images/products/8.jpg" alt=""></td>
					<td>MASSA AST<br>Color : black, Material : metal
					</td>
					<td>
						<div class="input-append">
							<input class="span1" style="max-width: 34px" placeholder="1"
								size="16" type="text">
							<button class="btn" type="button">
								<i class="icon-minus"></i>
							</button>
							<button class="btn" type="button">
								<i class="icon-plus"></i>
							</button>
							<button class="btn btn-danger" type="button">
								<i class="icon-remove icon-white"></i>
							</button>
						</div>
					</td>
					<td>$7.00</td>
					<td>--</td>
					<td>$1.00</td>
					<td>$8.00</td>
				</tr>
				<tr>
					<td><img width="60" src="themes/images/products/3.jpg" alt=""></td>
					<td>MASSA AST<br>Color : black, Material : metal
					</td>
					<td>
						<div class="input-append">
							<input class="span1" style="max-width: 34px" placeholder="1"
								size="16" type="text">
							<button class="btn" type="button">
								<i class="icon-minus"></i>
							</button>
							<button class="btn" type="button">
								<i class="icon-plus"></i>
							</button>
							<button class="btn btn-danger" type="button">
								<i class="icon-remove icon-white"></i>
							</button>
						</div>
					</td>
					<td>$120.00</td>
					<td>$25.00</td>
					<td>$15.00</td>
					<td>$110.00</td>
				</tr> -->
	
				<!-- <tr>
					<td colspan="6" style="text-align: right">Total Price:</td>
					<td>$228.00</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: right">Total Discount:</td>
					<td>$50.00</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: right">Total Tax:</td>
					<td>$31.00</td>
				</tr> -->
				<tr>
					<td colspan="6" style="text-align: right">
						<strong>TOTAL</strong></td>
					<td class="label label-important" style="display: block"><strong>
							$<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" /> </strong></td>
				</tr>
			</tbody>
		</table>
		
		<div class="row">
			<a href="/home" class="btn btn-large"><i
				class="icon-arrow-left"></i> Continue Shopping </a> 
			<a href="/order"
				class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i></a>
		</div>
	</div>
	<%
		}
	%>
</div>