<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>  
<div class="">
	<div class="block">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">Product management</div>
		</div>
		<div class="block-content collapse in">
			<div class="span12">
				<div class="table-toolbar">
					<div class="btn-group">
					
					<a href="#productnew" role="button" data-toggle="modal" ><span class="btn btn btn-success">Create Product   <i class="icon-plus icon-white"></i></span></a>			
					<div id="productnew" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true" style="display: none;">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
						<h3>New Product</h3>
					  </div>
					  <div class="modal-body">
						<s:form class="form-horizontal loginFrm" action="${pageContext.request.contextPath }/add-product" modelAttribute="item" enctype="multipart/form-data" method="POST">
						
						<%--   <div class="control-group">								
							<s:input path="category" placeholder="category_id" required="required"/>
						  </div> --%>
						  
						  <s:label class="control-label" path="category.id">Category</s:label>
						  <div class="control-group">  
				            <div class="controls">
				              <s:select id="select01" path="category.id">
				              	<c:forEach var = "category" items="${categories}">
				              		<%-- <optgroup label="${category.name }"></optgroup> --%>
				              		<option value="${category.id}">${category.name }</option>
				              	</c:forEach>
				              </s:select>
				            </div>
				          </div>
						  
						  <s:label class="control-label" path="title">Title</s:label>
						  <div class="control-group">	
							  <div class="controls">
							  	<s:input path="title" placeholder="Title" required="required"/>
							  </div>							
						  </div>
						  
						  <s:label class="control-label" path="price">Price</s:label>
						  <div class="control-group">
							  <div class="controls">
							  	<s:input type="number" min="0" step="0.1" id="" path="price" required="required"/>
							  </div>	
						  </div>
						  
						  <s:label class="control-label" path="stock">Stock</s:label>
						  <div class="control-group">
							  <div class="controls">
							  	<s:input type="number" min="1" step="any" value="1" id="" placeholder="Stock"  path="stock" required="required"/>
							  </div>	
						  </div>
						  
						  <label class="control-label" >Image</label>
						  <div class="control-group">
							  <div class="controls">
							  	<input type="file" id="" placeholder="Path" name ="file" />
							  </div>	
						  </div>
						  		
						  <s:label class="control-label" path="description">Description</s:label>
						  <div class="control-group">
						  	<div class="controls">
						  		<s:textarea path="description" placeholder="Description" required="required"/>
						  		<%-- <s:input  id="" placeholder="Description"  path="description" required="required"/> --%>
						  	</div>	
						  </div>
						  		
						  <div class="controls">
						  	<button type="submit" class="btn btn-success" style="margin-right:10px">Save Product</button> 
						  </div>										  
						  
						  
						</s:form>		
					
					  </div>
					</div>
			

					</div>
					<div class="btn-group pull-right">
						<button data-toggle="dropdown" class="btn dropdown-toggle">
							Tools <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Print</a></li>
							<li><a href="#">Save as PDF</a></li>
							<li><a href="#">Export to Excel</a></li>
						</ul>
					</div>
				</div>

				<div id="" class="dataTables_wrapper form-inline" role="grid">
					
					<table cellpadding="0" cellspacing="0" border="0"
						class="table table-striped table-bordered dataTable" id="example2"
						aria-describedby="example2_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending"
									style="width: 189px;">No</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending"
									style="width: 273px;">Image</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending"
									style="width: 254px;">Name</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									style="width: 162px;">Price</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending"
									style="width: 162px;">Stock</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									style="width: 117px;">Category</th>
								<th class="sorting" role="columnheader" tabindex="0"
									aria-controls="example2" rowspan="1" colspan="1"
									aria-label="CSS grade: activate to sort column ascending"
									style="width: 117px;">Action</th>
							</tr>
						</thead>

						<tbody role="alert" aria-live="polite" aria-relevant="all">
						<c:forEach var="row" items="${Items}">
						
							<tr class="gradeA odd">
								<td class="  sorting_1"><c:out value="${row.id}" /></td>
								<td class=" "><img alt="img" src="${pageContext.request.contextPath }/uploads/images/${row.path}" width="120px"></td>
								<td class=" "><c:out value="${row.title}" /></td>
								<td class="center "><c:out value="${row.price}" /></td>
								<td class="center "><c:out value="${row.stock}" /></td>
								<td class="center "><c:out value="${row.category.name}" /></td>
								<td class="center ">
									<button class="btn btn-success btn-mini">Edit</button>
									<a href="/remove-products/${row.id }" class="btn btn-danger btn-mini" onclick="return confirm('Are you sure ?')">Delete</a>
								</td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>
					<!-- <div class="row">
						
						<div class="span6">
							<div class="dataTables_paginate paging_bootstrap pagination">
								<ul>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>	
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li class="next"><a href="#">Next </a></li>
								</ul>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>


</div>