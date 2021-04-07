<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product list</title>
<link rel="stylesheet" href="${url}/css/material-dashboard.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">



</head>
<body>
	<div id="wrapper">

		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>All Product</h2>
						<h5>You can management product in here</h5>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="btn btn-primary"
									href="<c:url value='/admin/product/add'/>" class="center">Add</a>

							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">

										<thead>
											<tr>
												<th>ID</th>
												<th>Image</th>
												<th>Name</th>
												<th>Price(VND)</th>
												<th>Category</th>
												<th>Description</th>
												<th>In-stock</th>
												<th>Action</th>
											</tr>
										</thead>







										<tbody>

											<c:forEach items="${products}" var="product">
												<tr>
													<td>${product.productID}</td>

													<td><img height="100" src="${product.productImg}" /></td>
													<td>${product.productName}</td>
													<td>${product.productPrice}</td>
													<td>${product.category.categoryName}</td>
													<td>${product.productDesc}</td>
													<td>${product.instock}</td>
													<td>
														<!--  href="<c:url value='/product/detail?id=${product.productID}'/>"
														class="center">Detail</a> | --> <a class="btn btn-success"
														href="<c:url value='/admin/product/edit?id=${product.productID}'/>"
														class="center">Edit</a> | <a class="btn btn-danger"
														href="<c:url value='/admin/product/delete?id=${product.productID}'/>"
														class="center">Delete</a>
													</td>

												</tr>
											</c:forEach>


										</tbody>



									</table>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>





	<!-- LOAD SCRIPTS -->
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>


	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable();
		});
	</script>


</body>
</html>