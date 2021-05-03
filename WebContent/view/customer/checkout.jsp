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
<title>Checkout</title>
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
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1

	response.setHeader("Pragma", "no-cache"); // HTTP 1.0

	response.setHeader("Expires", "0");
	%>



	<!-- HEADER START -->

	<header class="container-fluid">
		<nav class="navbar navbar-expand-md   navbar-dark sticky-top"
			style="background-color: #d03737;">
			<div class="container">
				<a class="navbar-brand" href="#"> <img
					src="${url }images/account-brand.png" width="50px" alt=""> <img
					src="${url }images/brand-light.png" height="50px" alt="">
				</a>

				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- HEADER ENDS -->

	<!-- MAIN STARTS -->
	<main class="container-fluid">

		<div class="container main-content">
			<form action="${pageContext.request.contextPath}/customer/checkout"
				method="post">
				<div class="main-panel-left">


					<h4>1. Shipment - Lapeki express</h4>
					<hr>


					<table style="width: 100%;">

						<tr>
							<td style="width: 30%;">
								<div class="custom-control custom-radio">
									<input type="radio" id="ship1" name="ship" checked
										class="custom-control-input"><label
										class="custom-control-label" for="ship1">Standard
										shipment </label>
								</div>
							</td>

							<td style="width: 50%;">Package delivered within 7 days</td>
							<td style="width: 20%;">30.000 VND</td>

						</tr>
						<tr>
							<td style="width: 30%;">
								<div class="custom-control custom-radio">
									<input disabled type="radio" id="ship2" name="ship"
										class="custom-control-input"><label
										class="custom-control-label" for="ship2">Lapeki flash</label>
								</div>
							</td>

							<td style="width: 50%;">Package delivered within 2-3 days</td>
							<td style="width: 20%;">50.000 VND</td>

						</tr>

					</table>

					<div class="container-fluid dash-separator"></div>

					<h4>2. Payment method</h4>
					<hr>
					<div class="custom-control custom-radio">
						<input type="radio" id="COD" name="paymentMode" checked
							class="custom-control-input" value="COD"> <label
							class="custom-control-label label-img" for="COD"> <img
							src="${url }images/cod.png">COD - Cash on delivery
						</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="zalo-pay" name="paymentMode"
							class="custom-control-input" value="ZaloPay"> <label
							class="custom-control-label label-img" for="zalo-pay"> <img
							src="${url }images/zalopay.png"> ZaloPay
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="air-pay" name="paymentMode"
							class="custom-control-input" value="AirPay"> <label
							class="custom-control-label label-img" for="air-pay"> <img
							src="${url }images/airpay.jfif"> AirPay
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="momo" name="paymentMode"
							class="custom-control-input" value="MoMo"> <label
							class="custom-control-label label-img" for="momo"> <img
							src="${url }images/momo.jpg"> MoMo
						</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" id="pay-pal" name="paymentMode"
							class="custom-control-input" value="PayPal"> <label
							class="custom-control-label label-img" for="pay-pal"> <img
							src="${url }images/paypal.jfif"> Paypal
						</label>
					</div>
					<div class="container-fluid dash-separator"></div>
					<input class="btn btn-danger"
						style="font-size: 30px; font-weight: bold; margin: 20px 0;"
						type="submit" value="Place Order">

					<p>(Please review carefully before you place the order!)</p>








				</div>

				<aside class="side-bar-right">
					<div class="container-fluid">
						<div class="heading-fluid-btn">
							<h5>Receiver address</h5>
							<a style="display: block;" class="btn btn-warning"
								href="${pageContext.request.contextPath}/customer/profile">Modify</a>
						</div>

						<hr>
						<p>
							<b>${account.fullname } | ${account.mobile }</b>
						</p>
						<p>Address: ${account.address }</p>
					</div>

					<div class="container-fluid">
						<div class="heading-fluid-btn">
							<h5>Order detail</h5>
							<a data-toggle="collapse" href="#collapseExample" role="button"
								aria-expanded="false" aria-controls="collapseExample">Show
								items</a> <a style="display: block;" class="btn btn-warning"
								href="${pageContext.request.contextPath}/customer/cart">Modify</a>
						</div>

						<hr>
						<p></p>
						<div class="collapse" id="collapseExample">
							<div class="card card-body">Some placeholder content for
								the collapse component. This panel is hidden by default but
								revealed when the user activates the relevant trigger.</div>
						</div>
					</div>






				</aside>







			</form>
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