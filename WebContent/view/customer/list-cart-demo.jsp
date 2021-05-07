<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${url }custom.css/cart.css">
<link rel="stylesheet" href="${url }custom.css/footer.css">
</head>
<body>

	<jsp:include page="../customer/header.jsp"></jsp:include>

	<div class="container-cart">
		<div class="cart">
			<div class="cart-inner">
				<h2 class="cart-products__title">Your Cart</h2>
				<div class="cart-products-inner">

					<div class="cart-products__group">
						<div class="cart-products__product">
							<div class="cart-products__inner">
								<div class="cart-products__img">
									<a href=""> <img src="/images/product1.jpg"
										alt="Image">
									</a>
								</div>
								<div class="cart-products__content">
									<div class="cart-products__content--inner">
										<div class="cart-product-desc">
											<a class="cart-product-name" href="">Tablet Samsung
												Galaxy 128GB - Black</a>
											<p class="cart-product-description">Hello this is a desc
												for testing qwreeeeeeeeeeeeeeeeeeeeeeee
												eeeeeeeeeewqqqqqqqrqwerqwerqwenrwqerqwerwqerwer reqwer
												dweqrew rewrw rweqr
												eeeeeeeeeewqqqqqqqrqwerqwerqwenrwqerqwerwqerwer
												eeeeeeeeeewqqqqqqqrqwerqwerqwenrwqerqwerwqerwer</p>

											<p class="cart-product-action">
												<button class="cart-product-del">Delete</button>
											</p>
										</div>
										<div class="cart-product-details">
											<div class="cart-product-pricess">
												<div class="cart-product-realprice">$2000</div>
											</div>
											<div class="cart-product-qty">
												<div class="qty-wrapper">
													<span class="qty-decrease" onclick="decreaseValue()">-</span>
													<input type="tel" class="qty-input" id="input-num"
														value="1"> <span class="qty-increase"
														onclick="increaseValue()">+</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="cart-total-prices">
				<div class="cart-total-prices__inner">

					<div class="voucher-choose">
						<div class="title-usage">
							<p class="voucher-title">Voucher</p>
							<p class="discount-percent">20% OFF</p>
						</div>
						<div class="more-voucher" onclick="moreVoucher()">
							<img
								src="https://frontend.tikicdn.com/_desktop-next/static/img/mycoupon/coupon_icon.svg" />
							<span>Choose a voucher</span>
						</div>
					</div>


					<div class="cart-price">
						<ul class="prices-item-list">
							<li class="prices-item"><span class="text">Notional
									Price</span> <span class="value">$4000</span></li>
							<li class="prices-item"><span class="text">Discount</span> <span
								class="value">-$200</span></li>
						</ul>
						<p class="prices-total">
							<span class="text">Total Amount</span> <span class="final-value">
								$3800 <i>(VAT included)</i>
							</span>
						</p>
					</div>

					<button class="cart-submit">Place Order</button>
				</div>
			</div>
		</div>

	</div>

	<div class="popup-voucher" id="popup">
		<div class="outer-background" style="z-index: 1050;">
			<div class="menu-wrapper">
				<div class="menu-inner">
					<div class="header">
						<div class="title">Voucher List</div>
						<svg stroke="currentColor" fill="currentColor" stroke-width="0"
							viewBox="0 0 24 24" class="close" size="25" color="#999999"
							height="25" width="25" xmlns="http://www.w3.org/2000/svg"
							style="color: rgb(153, 153, 153);" onclick="closeVoucher()"
							id="close-menu">
              				<path
								d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
           					</svg>
					</div>
					<div class="body">
						<div class="row">
							<div class="col-voucher">
								<img alt="voucher-img" src="/images/voucher-img.png"
									style="height: 100px; width: 100px;">
								<div>
									<h5>30% off per order</h5>
									<p>Code: ABCXYZ</p>
									<p>Expire date: 22/10/2021</p>

								</div>
								<a class="btn btn-primary" href="#" onclick="closeVoucher()">Use
									now</a>
							</div>
						</div>


					</div>
				</div>

			</div>
		</div>
	</div>





	<!-- FOOTER -->
	<footer style="padding-top: 20px;">
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
		<div class="footer-copyright text-center py-3"
			style="background-color: #d03737; color: white">Copyright: ©
			2020 Lapeki. All Rights Reserved.</div>
	</footer>


	<script>
		function increaseValue() {
			var value = parseInt(document.getElementById('input-num').value, 10);
			value = isNaN(value) ? 0 : value;
			value++;
			document.getElementById('input-num').value = value;
		}

		function decreaseValue() {
			var value = parseInt(document.getElementById('input-num').value, 10);
			value = isNaN(value) ? 0 : value;
			value < 2 ? value = 2 : '';
			value--;
			document.getElementById('input-num').value = value;
		}

		function moreVoucher() {
			document.getElementById('popup').style.display = "block";
		}

		function closeVoucher() {
			document.getElementById('popup').style.display = "none";
		}
	</script>









	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>