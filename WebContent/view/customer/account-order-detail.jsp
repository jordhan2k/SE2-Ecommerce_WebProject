<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
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

<link rel="stylesheet" href="${url }custom.css/breadcrumb.css">



<link
	rel="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet" href="${url }custom.css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

</head>

<body>



	<!-- HEADER START -->
	<jsp:include page="../customer/account-header.jsp"></jsp:include>
	<!-- HEADER ENDS -->

	<!-- MAIN STARTS -->
	<main class="container-fluid" >


		<div class="container main-content">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-custom">
					<li class="breadcrumb-item"><a href="#" data-abc="true">Home</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Customer</a></li>
					<li class="breadcrumb-item"><a href="#" data-abc="true">Orders</a></li>
					<li class="breadcrumb-item active" aria-current="page"><span>Detail</span></li>

				</ol>
			</nav>

			<!-- SIDEBAR STARTS -->
			<jsp:include page="../customer/account-sidebar.jsp"></jsp:include>
			<!-- SIDEBAR ENDS -->


			<!-- MAIN PANEL STARTS -->

			<div class="main-panel">
				<h3>Order detail</h3>
				<p>
					Order id: #${order.cartID} - <b>${order.status}</b><br>
					Order date: ${order.orderDate }
				</p>

				<hr>

				<div class="container-fluid dash-separator"></div>

				<div class="container-fluid">

					<div class="row flex-row">
						<div class="col-sm-3 detail-box">
							<h6>Receiver address</h6>
							<p><b>${order.user.fullname }</b> <br> Address:
								${order.user.address } </br>
								Phone number: ${order.user.mobile }
							</p>
							
						</div>

						<div class="col-sm-3 detail-box">
							<h6>Shipment Method</h6>
							<p><b>Lapeki express</b> <br>
							Standard shipment - You will receive the package within 7 days.
							</p>
							
						</div>

						<div class="col-sm-3 detail-box">
							<h6>Payment method</h6>
							<p>Pay through: <b>${order.paymentMode } </b><br>
							<em><c:if test="${order.paymentMode  != 'COD'}">
							Successfully Paid
							</c:if>
							<c:if test="${order.paymentMode  == 'COD'}">
							Please prepare cash beforehand!
							</c:if>
							</em></p>
						</div>
					</div>

				</div>

				<div class="container-fluid dash-separator"></div>
				
				
				



				
				<table id="order-table" class="table table-striped table-hover table-shopping"
					style="width: 100%; margin-top: 20px;">

					<thead>
						<th style="width: 60%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 10%">Quantity</th>
						<th  style="width: 10%">Discount</th>
						<th  style="width: 15%">Subtotal</th>
					</thead>

					<tbody>
						<c:forEach items="${items}" var="item">
							<tr>
								<td style="width: 60%">${item.product.productName }</td>
								<td style="width:10%">${item.product.productPrice}</td>
								<td style="width:10%">${item.quantity }</td>
								<td style="width: 10%"></td>
								<td style="width: 15%"><c:out value="${item.product.productPrice * item.quantity}"></c:out></td>


							</tr>
						</c:forEach>



					</tbody>

				</table>
				
				<div></div>

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


	
	<script type="text/javascript">
		$("#acc-order").addClass("active");

		
		
	</script>



</body>
</html>