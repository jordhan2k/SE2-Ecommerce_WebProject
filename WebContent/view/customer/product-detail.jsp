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
<link rel="stylesheet" href="${url }custom.css/style.css">

<style>
.wrapper {
	margin: 35px 25px 5px 25px;
}

.productName {
	min-height: 40px;
	text-decoration:;
}

.info {
	font-size: 15px;
	line-height: 0.5;
	margin-top: 30px;
}

table, td {
	text-align: left;
	padding: 15px;
	border-bottom: 1px solid #ddd;
	flex: 1 1 0%;
}

/* .content-has-table{
    width: 1000px;
    padding: 20px;
    display: inline-block;
    color: rgb(36, 36, 36);
    line-height:25px;
    text-align: justify;
    background-color: rgb(255, 255, 255);
    border-radius: 4px; */
}
.shop-product-title {
	min-height: 40px;
}

.price {
	font-size: 20px;
	font-weight: bolder;
	margin-bottom: 50px;
}

.quantity {
	border: 1px solid #94c4ec;
	border-radius: 3px;
	display: block;
	width: 70px;
	text-align: center;
	height: 30px;
}

.btn-add-to-cart {
	margin-top: 20px;
	color: rgb(255, 255, 255);
	background-color: rgb(255, 57, 69);
	cursor: pointer;
	display: block;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	min-width: 190px;
	width: 100%;
	max-width: 300px;
	height: 48px;
	font-size: 15px;
	line-height: 24px;
	font-weight: 500;
	text-transform: capitalize;
	border: none;
	border-radius: 4px;
	outline: none;
}

h3 {
	margin-top: 15px;
	margin-bottom: 15px;
	text-align: center;
}

.pt-1 {
	text-align: justify;
	margin: 5px 30px 20px 5px;
	line-height: 2.2;
}

h2 {
	/* font-family: Roboto, Helvetica, Arial, sans-serif; */
	margin-left: 30px;
	margin-top: 10px
}

.qty-wrapper {
	display: flex;
	flex-wrap: nowrap;
	border: 2px solid #808080;
	border-radius: 3px;
	width: 100px;
}

.qty-decrease {
	display: inline-block;
	border-right: 2px solid #808080;
	color: rgb(153, 153, 153);
	padding: 6px 12px;
	cursor: pointer;
}

.qty-input {
	padding: 6px 12px;
}

.qty-increase {
	border-right: none;
	border-left: 2px solid #808080;
	color: rgb(153, 153, 153);
	padding: 6px 12px;
	cursor: pointer;
	display: inline-block;
}

.qty-input {
	border: none;
	background: transparent;
	width: 35px;
	text-align: center;
	font-size: 13px;
	appearance: none;
	margin: 0px;
}

#button {
	border-radius: 5px;
}
</style>


</head>
<body style="background-color: rgb(244, 244, 244);">

	<jsp:include page="../customer/header.jsp"></jsp:include>


	<div class="wrapper">

		<!--=== Shop Product ===-->
		<div class="shop-product">

			<div class="container">
				<div class="row">
					<div class="col-md-6 md-margin-bottom-50">
						<div class="ms-showcase2-template">
							<!-- Master Slider -->
<!-- 							<div class="master-slider ms-skin-default" id="masterslider"> -->
<!-- 								<div class="ms-slide"></div> -->
<%-- 								<c:set var="imgs" value="${cl.product.productImg}"/> --%>
<%-- 								<c:set var="img" value="${fn:split(imgs,',') }"/> --%>
<%-- 								<c:set var="ava" value="${img[0] }"/> --%>
<%-- 								<td><img height="100" src ="${img[0]}" /></td> --%>
<!-- 							</div> -->
						</div>
					</div>


					<div class="col-md-6">
						<div class="productName">
							<h1>${product.productName}</h1>
						</div>


						<ul class="list-inline shop-product-prices margin-bottom-30">
							<li class="price">${product.productPrice}VND</li>

							<div class=content-has-table></div>
							<table>
								<tr>
									<td>Category</td>
									<td>${product.category.categoryName}</td>
								</tr>

								<tr>
									<td>Instock</td>
									<td>${product.instock}</td>
								</tr>

								<tr>
									<td>Quantity</td>

								</tr>


							</table>
							<%-- 	<li class="info">Category:
										${product.category.categoryName}</li>
									<li class="info">Instock: ${product.instock}</li>
									
									<li class="info">Quantity</li>
								</ul> --%>

							<div class="qty-box">
								<div class="margin-bottom-40">

									<form name="f1" class="product-quantity sm-margin-bottom-20"
										method="get"
										action="<c:url value="/customer/cart/add"></c:url>">
										<input type="text" value="${product.productID }"
											name="productID" hidden="">

										<div class="cart-product-qty">
											<div class="qty-wrapper">
												<span class="qty-decrease" onclick="decreaseValue()">-</span>

												<input class="qty-input" min="1" name="quantity"
													value="${map.value.quantity }" type="tel" id='input-num'>

												<span class="qty-increase" onclick="increaseValue()">+</span>
											</div>
										</div>

										<button type="submit" class="btn-add-to-cart">Add to
											Cart</button>
									</form>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content-md container">
		<div class="tab-v5">
			<div class="classic-tabs border rounded px-4 pt-1">




				<button data-toggle="collapse" data-target="#demo" id="button">
					<h3>Description</h3>
				</button>
				<div class="collapse" id="demo">
					<div class="tab-pane fade show active" id="description"
						role="tabpanel" aria-labelledby="description-tab">
						<p class="pt-1">${product.productDesc }</p>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="heading heading-v1 margin-bottom-20">
			<h2>Product You May Like</h2>
		</div>

		<section class="text-center">




			<!-- Grid row -->
			<div class="row">
				<c:forEach var="relatedProducts" items="${relatedProducts}">

					<c:if test="${relatedProducts.productID != product.productID}">
						<!-- Grid column -->
						<div class="col-md-6 col-lg-3 mb-5">

							<!-- Card -->
							<div class="">


								<div class="view zoom overlay z-depth-2 rounded">
									<div class="mask">
										<c:set var="imgs" value="${relatedProducts.productImg}" />
										<c:set var="img" value="${fn:split(imgs,',')}" />
										<c:set var="ava" value="${img[0]}" />
										<div class="mask rgba-black-slight"></div>
										<td><img src="${ava}" /></td>
									</div>

								</div>

								<div class="pt-4">

									<a class="namelink"
										href="${pageContext.request.contextPath }/product/detail?id=${relatedProducts.productID}">
										${relatedProducts.productName}</a>
									<h6>${relatedProducts.productPrice}VND</h6>
								</div>

							</div>
							<!-- Card -->

						</div>
						<!-- Grid column -->

					</c:if>
				</c:forEach>
			</div>
			<!-- Grid row -->

		</section>
		<!--Section: Block Content-->
	</div>
	</div>




	<!-- FOOTER -->
	<jsp:include page="../customer/footer.jsp"></jsp:include>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
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
	</script>
	<script>
		function createImage(url) {
			const newImage = document.createElement('img');
			newImage.src = url;
			document.querySelector('.ms-slide').appendChild(newImage);
		}
		const urls = "${product.productImg}";
		const urlList = urls.split(",");

		urlList.forEach(createImage);
	</script>


</body>
</html>