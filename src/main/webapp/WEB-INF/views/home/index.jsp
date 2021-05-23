<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>  
<div class="span9">
	<div class="well well-small">
		<h4>
			Featured Products <small class="pull-right">200+ featured
				products</small>
		</h4>
		<div class="row-fluid">
			<div id="featured" class="carousel slide">
				<div class="carousel-inner">
					<div class="item active">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/b1.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/b2.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/b3.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/b4.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="item">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/5.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<i class="tag"></i> <a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/6.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/7.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/8.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="item">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/9.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/10.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/11.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/1.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="item">
						<ul class="thumbnails">
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/2.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/3.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/4.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail">
									<a href="/details"><img
										src="${pageContext.request.contextPath }/resources/user/themes/images/products/5.jpg" alt=""></a>
									<div class="caption">
										<h5>Product name</h5>
										<h4>
											<a class="btn" href="/details">VIEW</a> <span
												class="pull-right">$222.00</span>
										</h4>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<a class="left carousel-control" href="#featured" data-slide="prev"></a>
				<a class="right carousel-control" href="#featured" data-slide="next"></a>
			</div>
		</div>
	</div>
	<h4>Latest Products</h4>
	
	<ul class="thumbnails">
		<c:forEach var="row" items="${products}">
		
			<li class="span3">
				<div class="thumbnail" style="height:280px">
					<a href="/detail/${row.id}"><img alt="img" src="${pageContext.request.contextPath }/uploads/images/${row.path}" style="height:120px"></a>
					<div class="caption">
						<h5><c:out value="${row.title}" /></h5>
						<p style="white-space: nowrap;   width: 200px;  overflow: hidden;  text-overflow: ellipsis;">
							<c:out value="${row.description}" />
						</p>
	
						<h4 style="text-align: center">
							<a class="btn" href="/details"> <i
								class="icon-zoom-in"></i></a> <a class="btn" href="/addCart/${row.id}">Add to <i
								class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
								href="#">$<c:out value="${row.price}" /></a>
						</h4>
					</div>
				</div>
			</li>
		
		</c:forEach>

	</ul>

</div>