<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<div class="block">
	<div class="navbar navbar-inner block-header">
		<div class="muted pull-left">Order management</div>
	</div>
	<div class="block-content collapse in">
		<div class="span12">
			<div class="table-toolbar">
			
				<a  role="button" id="get-all-order"><span class="btn btn btn-success">GetAll  <i class="icon-plus icon-white"></i></span></a>			
					<a href="#ordernew" role="button" data-toggle="modal" ><span class="btn btn btn-success">Create Order  <i class="icon-plus icon-white"></i></span></a>			
					<div id="ordernew" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true" style="display: none; left: 37%;width: 1000px;">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
						<h3>New Order</h3>
					  </div>
					  <div class="modal-body">
						<s:form class="form-horizontal loginFrm" action="${pageContext.request.contextPath }/add-order" modelAttribute="" enctype="multipart/form-data" method="POST">
							
							<div style="display: flex;    flex-wrap: wrap;    margin-right: -15px;    margin-left: -15px;">
								
								<div style="flex: 0 0 50%; max-width: 50%;">
									<div style="margin:0 20px 20px 20px">
									  Customer infomation <br/><hr>
									 <label class="control-label" >Name</label>
									 <div class="control-group">	
										  <div class="controls">
										  	<input placeholder="Name" required="required" type="text"/>
										  </div>							
									  </div>
									  <label class="control-label" >Phone</label>
									  <div class="control-group">	
										  <div class="controls">
										  	<input placeholder="Phone Number" type="tel" required="required"/>
										  </div>							
									  </div>
									 <label class="control-label" >Address</label>
									 <div class="control-group">	
										  <div class="controls">
										  	<input placeholder="Address" required="required" type="text"/>
										  </div>							
									  </div>
									  <label class="control-label" >Email</label>
									  <div class="control-group">	
										  <div class="controls">
										  	<input placeholder="Email" required="required" type="email" />
										  </div>							
									  </div>
									  <label class="control-label" >Date Order</label>
									  <div class="control-group">	
										  <div class="controls">
										  	<input placeholder="Date" required="required" type="text"/>
										  </div>							
									  </div>
									  <label class="control-label" >Note</label>
									  <div class="control-group">	
										  <div class="controls">
										  	<textarea class="form-control" id="" rows="3"></textarea>
										  </div>							
									  </div>
									  
									</div>
									
								</div>
								<div style="flex: 0 0 50%; max-width: 50%;">
									<div style="margin:0 20px 20px 20px">
										Product infomation <br/><hr>
										<div class="col-12" id="wrap_item" style="height:323px; overflow:scroll">
											<c:forEach var="row" items="${Products}">
												<div id="item_order" style="display:flex; height:50px; margin-top:10px">
												   <input type="checkbox" class="" style="margin:5px" value="${row.price}">
		                                           <div style="display:flex;">
														<div style="width:70px"><img alt="img" src="${pageContext.request.contextPath }/uploads/images/${row.path}" style="height:40px"></div>
														<div style="width:150px; white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;"><c:out value="${row.title}" /></div>
														<div style="width:70px"><c:out value="$${row.price}" /></div>
														<div style="width:30px"><c:out value="${row.stock}" /></div>
														<div style="width:40px"><c:out value="${row.category.name}" /></div>
													</div>
		                                        </div>
												
		                                    </c:forEach>
		                                </div>
										
									</div>
									
								</div>
							</div>
							<div style="max-width: 100%; display:flex; justify-content: center;">
									<button type="button" id="btnSubmit" class="btn btn-dark d-block mx-auto btn-submit">Submit</button>
							</div>
						</s:form>
					  </div>
					</div>
			
				<!-- <div class="btn-group">
					<a href="#"><button class="btn btn-success">
							Add New <i class="icon-plus icon-white"></i>
						</button></a>
				</div> -->
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
								style="width: 189px;">Name</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Browser: activate to sort column ascending"
								style="width: 273px;">Phone</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Platform(s): activate to sort column ascending"
								style="width: 254px;">Address</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Engine version: activate to sort column ascending"
								style="width: 162px;">Mail</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="CSS grade: activate to sort column ascending"
								style="width: 117px;">Quantity</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="CSS grade: activate to sort column ascending"
								style="width: 117px;">Total</th>
							<th class="sorting" role="columnheader" tabindex="0"
								aria-controls="example2" rowspan="1" colspan="1"
								aria-label="CSS grade: activate to sort column ascending"
								style="width: 117px;">Action</th>
						</tr>
					</thead>

					<tbody role="alert" aria-live="polite" aria-relevant="all" id="order-list">
						<tr class="gradeA odd">
							<td class="  sorting_1">Gecko</td>
							<td class=" ">Firefox 1.0</td>
							<td class=" ">Win 98+ / OSX.2+</td>
							<td class="center ">1.7</td>
							<td class="center ">A</td>
							<td class="center ">A</td>
							<td class="center ">A</td>
						</tr>
						
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

