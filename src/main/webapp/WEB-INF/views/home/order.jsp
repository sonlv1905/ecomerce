<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="">
	<ul class="breadcrumb">
		<li>
			<a href="/home">Home</a> <span class="divider">/</span>
		</li>
		<li ><a href="/cart">Cart</a> <span class="divider">/</span></li>
		<li class="active">Order</li>
	</ul>
	<h3>
		ORDER SUMMARY
	</h3>
	<hr class="soft">
	
	<div class="span8">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Product</th>
					<th>Description</th>
					<th>Quantity</th>
					<th>Price</th>
					<!-- <th>Discount</th>-->
					
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="row" items="${cartProduct}">
					<tr>
						<td><img src="${pageContext.request.contextPath }/uploads/images/${row.item.path}" width="70px" alt="img"></td>
						<td><c:out value="${row.item.title}" /><br>Color : black, Material : metal</td>
						<td>
							<div class="input-append">
								<input class="span1" style="max-width: 34px" placeholder="qty" value=<c:out value="${row.quantity}" /> 
									id="appendedInputButtons" size="16" type="number" required="required" min="1" step="any" value="1" disabled>
								
							</div>
						</td>
					<td>$<c:out value="${row.item.price}" /></td>
					<!-- <td>$25.00</td>-->
					<!-- <td>$15.00</td>  -->
					<td>$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${row.quantity * row.item.price}" /></td>
				</tr>	
			</c:forEach>
				<tr>
					<td colspan="6" style="text-align: right">
						<strong>Qty</strong></td>
					<td class="label label-inverse" style="display: block"><strong>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${qty}" /> </strong></td>
				</tr>
				<tr>
					<td colspan="6" style="text-align: right">
						<strong>TOTAL</strong></td>
					<td class="label label-important" style="display: block"><strong>
							$<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" /> </strong></td>
				</tr>
				
			</tbody>
		</table>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>VOUCHERS</th>
				</tr>
				<tr>
					<td>
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label"><strong> CODE: </strong> </label>
								<div class="controls">
									<input type="text" class="input-medium" placeholder="CODE">
									<button type="submit" class="btn">ADD</button>
								</div>
							</div>
						</form>
					</td>
				</tr>
	
			</tbody>
		</table>

		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>SHIPMENT</th>
				</tr>
				<tr>
					<td>
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="inputCountry">Address </label>
								<div class="controls">
									<input type="text" id="inputCountry" placeholder="Country">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPost">Adderss 2</label>
								<div class="controls">
									<input type="text" id="inputPost" placeholder="Postcode">
								</div>
							</div>
							<!-- <div class="control-group">
								<div class="controls">
									<button type="submit" class="btn">ESTIMATE</button>
								</div>
							</div> -->
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>PAYMENT</th>
				</tr>
				<tr>
					<td>
						<form class="form-horizontal">
							<div class="control-group">
								
							</div>
							<div class="control-group">
								<label class="control-label" >Click to pay with Paypal </label>
								<div class="controls">
									<button type="submit" class="btn btn-primary">PAYPAL</button>
								</div>
							</div> 
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="row">
			<a href="/cart" class="btn btn-large"><i
				class="icon-arrow-left"></i> Back to cart </a> 
			<a href="/create-order"
				class="btn btn-large pull-right">Make Order <i class="icon-arrow-right"></i></a>
		</div>
	</div>

</div>