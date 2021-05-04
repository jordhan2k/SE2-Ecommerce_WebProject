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

	<jsp:include page="../customer/account-header.jsp"></jsp:include>

	<div class="popup-voucher" id="popup">
		<div class="outer-background" style="z-index: 1050">
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
						<c:forEach items="${vouchers}" var="vou">
							<div class="row">
								<div class="col-voucher">
									<img alt="voucher-img" src="${url}images/voucher-img.png"
										style="height: 100px; width: 100px;">
									<div>
										<h5>${vou.discountPercentage}%offperorder</h5>
										<p>Code: ${vou.voucherCode }</p>
										<p>Expire date: ${vou.expireDate }</p>

									</div>
									<button class="btn btn-primary" id="${vou.discountPercentage }"
										onclick="selectVoucher(this.id)">Use Now</button>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container-cart">
		<div class="cart">
			<div class="cart-inner">
				<h2 class="cart-products__title">Your Cart</h2>
				<div class="cart-products-inner">
					<c:forEach items="${sessionScope.cart}" var="map">
						<div class="cart-products__group">
							<div class="cart-products__product">
								<div class="cart-products__inner">
									<div class="cart-products__img">
										<c:set var="imgs" value="${map.value.product.productImg}" />
										<c:set var="img" value="${fn:split(imgs,',')}" />
										<c:set var="ava" value="${img[0]}" />
										<c:url value="/image?fname=${ava }" var="imgUrl"></c:url>
										<a href=""> <img src="${imgUrl}" alt="">
										</a>
									</div>
									<div class="cart-products__content">
										<div class="cart-products__content--inner">
											<div class="cart-product-desc">
												<a class="cart-product-name" href="">${map.value.product.productName }</a>
												<p class="cart-product-description">${map.value.product.productDesc }</p>

												<p class="cart-product-action">
													<a class="cart-product-del"
														href="${pageContext.request.contextPath}/customer/cart/remove?pId=${map.value.product.productID}">Delete</a>
												</p>
											</div>
											<div class="cart-product-details">
												<div class="cart-product-pricess">
													<div class="cart-product-realprice">$
														${map.value.product.productPrice }</div>
												</div>
												<div class="cart-product-qty">
													<div class="qty-wrapper">
														<span class="qty-decrease" onclick="decreaseValue()">-</span>
														<input type="tel" class="qty-input" id="input-num"
															value="${map.value.quantity }"> <span
															class="qty-increase" onclick="increaseValue()">+</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>

			<div class="cart-total-prices">
				<div class="cart-total-prices__inner">

					<div class="voucher-choose">
						<div class="title-usage">
							<p class="voucher-title">Voucher</p>
							<p class="discount-percent">
								<ins id="dis-per" style="text-decoration: none">0</ins>
								% OFF
							</p>
						</div>
						<div class="more-voucher" onclick="moreVoucher()">
							<img
								src="https://frontend.tikicdn.com/_desktop-next/static/img/mycoupon/coupon_icon.svg" />
							<span>Choose a voucher</span>
						</div>
					</div>

					<form role="form" action="<c:url value='/customer/checkout'/>"
						method="post" enctype="multipart/form-data">
						<div class="cart-price">
							<ul class="prices-item-list">
								<li class="prices-item"><span class="text">Subtotal</span>
									<c:set var="total" value="${0}" /> <c:forEach
										items="${sessionScope.cart}" var="map">
										<c:set var="total"
											value="${total + map.value.quantity * map.value.product.productPrice}" />
									</c:forEach> <span class="value">$ <ins id="subtotal">${total }</ins>
										<input style="display: none" id="subtotal-input" value=""
										name="subtotal">
								</span></li>
								<li class="prices-item"><span class="text">Discount</span>
									<span class="value"> <ins id="discount">0</ins> <input
										style="display: none;" id="discount-input" value=""
										name="discount">
								</span></li>
							</ul>
							<p class="prices-total">
								<span class="text">Total Amount</span> <span class="final-value">
									$<ins id="total">${total }</ins> <input style="display: none;"
									value="" id="total-input" name="total"> <i>(VAT
										included)</i>
								</span>
							</p>
						</div>

						<button class="cart-submit" type="submit">Place Order</button>
					</form>
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

		//case: do not use voucher
		const subtotalValue = parseInt(document.getElementById('subtotal').innerText)
		document.getElementById('subtotal-input').value = subtotalValue
		document.getElementById('total-input').value = subtotalValue

		console.log(document.getElementById('subtotal-input').value)
		console.log(document.getElementById('total-input').value)

		//case: use voucher
		function selectVoucher(discount) {
			document.getElementById('dis-per').innerText = discount;
			closeVoucher();
			const subtotalValue = parseInt(document.getElementById('subtotal').innerText)
			const discountValue = (subtotalValue * discount) / 100
			document.getElementById('discount').innerText = "-" + discountValue
			document.getElementById('total').innerText = subtotalValue
					- discountValue

			document.getElementById('subtotal-input').value = subtotalValue
			document.getElementById('discount-input').value = discountValue
			document.getElementById('total-input').value = subtotalValue
					- discountValue

			console.log(document.getElementById('subtotal-input').value)
			console.log(document.getElementById('discount-input').value)
			console.log(document.getElementById('total-input').value)
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