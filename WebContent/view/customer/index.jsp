<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lapeki - Enjoy incredible online shopping.</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/landing.css">
<link rel="stylesheet" href="${url }custom.css/footer.css">

</head>
<body style="background-color: rgb(244, 244, 244);">

	<jsp:include page="../customer/account-header.jsp"></jsp:include>


	<div class="container">
		<div class="row">

			<div id="hero" class="carousel slide col-md-8" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#hero" data-slide-to="0" class="active"></li>
					<li data-target="#hero" data-slide-to="1"></li>

				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${url }images/2.jpg" alt="Los Angeles">

					</div>
					<div class="carousel-item">
						<img src="${url }images/3.jpg" alt="Chicago">

					</div>

				</div>
				<a class="carousel-control-prev" href="#hero" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#hero" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>

			<div id="hero-md-d4" class="col-md-4" style="padding-right: 0px">
				<img src="${url }images/hero-md-4.jpg" alt="">
			</div>
		</div>

	</div>

	<div class="body-container">
		<!-- Category Section -->
		<div class="category-sec">
			<div class="header">Featured Categories</div>
			<div class="body">
				<div class="cate-list-wrapper">
					<div class="cate-list-content">
						<div class="cate-list">
							<div class="cate-list-inner">
								<div class="cate-current">
									<div>
										<div class="page">
											<c:forEach items="${categories}" var="category">
												<a class="item" href="">
													 <span class="text">${category.categoryName }</span>
												</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Trend Search Section -->
		<div class="trend-search-sec">
			<div class="header">
				<span class="header-name"> <img src="/images/search-icon.png">
					Trend Search
				</span>
			</div>
			<div class="body">
				<a class="trend-search-item odd" href="">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Tablet</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item even" href="">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Tablet</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item odd" href="">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Tablet</span> <span class="subtitle">123
							products</span>
					</div>

				</a> <a class="trend-search-item even" href="">
					<div class="picture-group">
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product1.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product2.jpg" class="image-inner">
							</div>
						</div>
						<div style="width: 86px;">
							<div class="image-search">
								<img src="images/product3.jpg" class="image-inner">
							</div>
						</div>

					</div>
					<div class="content">
						<span class="title">Tablet</span> <span class="subtitle">123
							products</span>
					</div>

				</a>
			</div>

		</div>

		<!-- Product Section -->
		<div class="product-sec">
			<div class="header">
				<span style="font-weight: 500; color: #D03737;">Suggestion</span>
			</div>
			<div class="product-list-wrapper">
				<div class="content">
					<c:forEach items="${products}" var="product">
						<div>
							<a class="product-item" href="${pageContext.request.contextPath }/product/detail?id=${product.productID}">
								<div class="product-border">
									<span class="product-inner">
										<div>
											<div class="thumbnail">
												<c:set var="imgs" value="${product.productImg}" />
												<c:set var="img" value="${fn:split(imgs,',')}" />
												<c:set var="ava" value="${img[0]}" />
												<img src="${ava}"/>
											</div>
											<div class="info">
												<div class="p-categories">
													<span>${product.category.categoryName }</span>
												</div>
												<div class="p-name">
													<h3>${product.productName }</h3>
												</div>
												<span class="p-price"> <ins>$${product.productPrice} </ins>
												</span>
												<div class="atc-btn">
													<i class="fa fa-shopping-basket"></i> <em>Add To Cart</em>
												</div>

											</div>
										</div>
									</span>
								</div>

							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer style="padding-top: 20px;" >
		<div class="footer-content">
			<div class="content-container"
				style="display: flex; justify-content: space-between;">
				<div class="block" style="width: 500px;">
					<h4>About Us</h4>
					<p
						style="color: rgb(51, 51, 51); font-size: 12px; font-weight: normal;">
						Lapeki is an ecommerce website created for study purposes.Lapeki
						is an ecommerce website created for study purposes.</p>
				</div>
				<div class="block">
					<h4>Payment</h4>
					<p style="padding-top: 10px;">
						<span> <i class="fab fa-paypal fa-3x"></i>
						</span> <span> <i class="fab fa-cc-visa fa-3x"></i>
						</span> <span> <i class="fas fa-money-bill-wave fa-3x"></i>
						</span> <span> <i class="fas fa-money-check-alt fa-3x"></i>
						</span>

					</p>
				</div>
				<div class="block">
					<h4>Contact Us</h4>
					<div style="text-align: center;">
						<div style="padding-top: 10px;">
							<a href=""> <i class="fab fa-facebook-square fa-3x"
								style="color: #4267B2;"></i>
							</a> <a href=""> <i class="fab fa-twitter-square fa-3x"
								style="color: #1DA1F2;"></i>
							</a>


						</div>
						<div style="padding-top: 10px;">
							<a href=""> <i class="fab fa-instagram-square fa-3x"
								style="background: radial-gradient(circle at 30% 107%, #fdf497 0%, #fdf497 5%, #fd5949 45%, #d6249f 60%, #285AEB 90%);"></i>
							</a> <a href=""> <i class="fab fa-google fa-3x"
								style="color: #DB4437;"></i>
							</a>
						</div>
					</div>
				</div>

			</div>

		</div>
		<div class="footer-copyright text-center py-3" style="background-color: #d03737; color: white">Copyright: © 2020
			Lapeki. All Rights Reserved.</div>
	</footer>

	<a onclick="topFunction()" id="btnTop"> <i
		class="fas fa-chevron-up"></i>
	</a>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		//Get the button
		var mybutton = document.querySelector("#btnTop");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

</body>
</html>