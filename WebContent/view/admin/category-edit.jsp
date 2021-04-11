<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit a category</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="wrapper">



		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Edit Category</h2>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Category Details:</h3>

										<form role="form" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<label>Category ID:</label> <input class="form-control"
													value="${category.categoryID}" name="categoryID"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label>Name:</label> <input class="form-control"
													placeholder="Enter category name" name="categoryName"
													required="required" value="${category.categoryName}" />
											</div>



											<div class="form-group">
												<div class="checkbox">
													<!--<input list="pr" name="category" required="required">
													  <datalist id="pr">
														<c:forEach items="${categories}" var="c">
															<option value="${c.categoryID}">${c.categoryName}</option>
														</c:forEach>

													</datalist>-->


												</div>

											</div>

											<button type="submit" class="btn btn-success">Add</button>
											<button type="reset" class="btn btn-danger">Reset</button>
										</form>


									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

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
	<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			CKEDITOR.replace('editor', {
				width : '700px',
				height : '300px'
			});
		};

		function checkAlert(event) {
			alert(event.currentTarget.value);
		}
	</script>
</body>
</html>