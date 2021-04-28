<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="${url }images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your orders</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<link rel="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="${url }custom.css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

</head>

<body>



	<!-- HEADER START -->
	<jsp:include page="../customer/account-header.jsp"></jsp:include>
	<!-- HEADER ENDS -->

	<!-- MAIN STARTS -->
	<main class="container-fluid">
		<div class="container main-content">

			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<div class="main-panel">
			<h3>My orders</h3>
				<p>Track your orders here</p>
				<hr>
			
				<table id="order-table" class="table table-striped" style="width:100%">
				
				<thead>
				
						<th>Order ID</th>
						<th>Order Date</th>
						<th>Products</th>
						<th>Total</th>
						<th>Status</th>
				
				</thead>
				
				<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>
					<td>${order.cartID }</td>
					<td>${order.orderDate}</td>
					<td></td>
					<td>${order.total }</td>
					<td>${order.status}</td>
					
					
					</tr>
				</c:forEach>
				
				
				
				</tbody>
				
				</table>
			
			</div>



		</div>
	</main>

	<!-- MAIN PANEL ENDS -->

	<!--  -->

	<footer></footer>



















	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

	<script type="text/javascript">
		$("#acc-order").addClass("active");
		
		$(document).ready(function() {
		    $('#order-table').DataTable({
		        "ordering": false,
		        
		       
		    } );
		} );
		
			
		
		
		
		
		
		
		
		
	</script>
	
	

</body>
</html>