<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit a voucher</title>

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
						<h2>Edit Voucher</h2>

					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Add Voucher</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Voucher Details:</h3>

										<form role="form" action="<c:url value='/admin/voucher/edit'/>" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<label>Voucher ID:</label> <input class="form-control"
													value="${voucher.voucherID}" name="voucherID"
													readonly="readonly" />
											</div>
											<div class="form-group">
												<label>Voucher Code:</label> <input class="form-control"
													placeholder="Enter voucher code" name="voucherCode"
													required="required" value="${voucher.voucherCode}" />
											</div>
											<div class="form-group">
												<label>Discount %:</label> <input class="form-control"
													placeholder="Please enter discount %" type="number" min="0"
													name="discountPercent" required="required"
													value="${voucher.discountPercentage}" />
											</div>

											<div class="form-group">
												<label>Expire Date:</label> <input class="form-control"
													placeholder="Please enter expire date" type="date"
													name="expireDate" required="required"
													value="${voucher.expireDate}" />
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