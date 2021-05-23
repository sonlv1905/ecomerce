<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<ul class="breadcrumb">
	<li><a href="/home">Home</a> <span class="divider">/</span></li>
	<li class="active">Products by Category</li>
</ul>
<h3>
	Products by Category <small class="pull-right"> 40 products are available </small>
</h3>
<hr class="soft">
<p>Now a days the lingerie industry is one of the most successful
	business spheres.We always stay in touch with the latest fashion
	tendencies - that is why our goods are so popular and we have a great
	number of faithful customers all over the country.</p>
<hr class="soft">
<form class="form-horizontal span6">
	<div class="control-group">
		<label class="control-label alignL">Sort By </label> <select>
			<option>Priduct name A - Z</option>
			<option>Priduct name Z - A</option>
			<option>Priduct Stoke</option>
			<option>Price Lowest first</option>
		</select>
	</div>
</form>

<div id="myTab" class="pull-right">
	<a href="#listView" data-toggle="tab"><span class="btn btn-large"><i
			class="icon-list"></i></span></a> <a href="#blockView" data-toggle="tab"><span
		class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr">
<div class="tab-content">
	<div class="tab-pane" id="listView">
	<c:forEach var="row" items="${CItem}">
		<div class="row">
			<div class="span2">
				<img alt="img" src="${pageContext.request.contextPath }/uploads/images/${row.path}" width="120px">
			</div>
			<div class="span4">
				<h3><c:out value="${row.title}" /></h3>
				<hr class="soft">
				<h5><c:out value="${row.category.name}" /></h5>
				<p style="white-space: nowrap;   width: 200px;  overflow: hidden;  text-overflow: ellipsis;"><c:out value="${row.description}" /></p>
				<a class="btn btn-small pull-right" href="product_details.html">View
					Details</a> <br class="clr">
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
					<h3>$<c:out value="${row.price}" /></h3>
					<br> <a href="product_details.html"
						class="btn btn-large btn-primary"> Add to <i
						class=" icon-shopping-cart"></i></a> <a href="product_details.html"
						class="btn btn-large"><i class="icon-zoom-in"></i></a>

				</form>
			</div>
		</div>
		<hr class="soft">
	</c:forEach>	
	</div>

	<div class="tab-pane active" id="blockView">
		<ul class="thumbnails">
			<c:forEach var="row" items="${CItem}">
				<li class="span3">
					<div class="thumbnail">
						<a href="product_details.html"><img alt="img" src="${pageContext.request.contextPath }/uploads/images/${row.path}" style="height:120px"></a>
						<div class="caption">
							<h5><c:out value="${row.title}" /></h5>
							<p style="white-space: nowrap;   width: 200px;  overflow: hidden;  text-overflow: ellipsis;"><c:out value="${row.description}" /></p>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.html"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$<c:out value="${row.price}" /></a>
							</h4>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
		<hr class="soft">
	</div>
</div>

<a href="/allproducts" class="btn btn-large pull-right">All Products</a>
<div class="pagination">
	<ul>
		<li><a href="#"><</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">...</a></li>
		<li><a href="#">></a></li>
	</ul>
</div>
<br class="clr">
