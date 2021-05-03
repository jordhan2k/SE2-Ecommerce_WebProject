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
<title>Order placed successfully</title>
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

		<div class="container main-content" style="height: 500px; display: flex; justify-content: center; align-items: center; flex-direction: column;">
		
		<img alt="" src="${url }images/order-succeed.png" width="100px">
		<h4 style="margin: 20px;">Your order has been successfully placed.
		</h4>
		
		<p>An email have been sent to your email address - ${account.email }</p>
		<p>Please be noticed!</p>
		
		
		<p><a class="btn btn-primary" href="${pageContext.request.contextPath }/customer/order">Track your orders</a></p>
		
		<p><a class="btn btn-warning" href="${pageContext.request.contextPath }/">Continue shopping</a></p>
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