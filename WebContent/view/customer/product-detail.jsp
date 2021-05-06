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
							<div class="master-slider ms-skin-default" id="masterslider">
								<div class="ms-slide">
									<script>
										function createImage(url) {
											const newImage = document
													.createElement('img');
											newImage.src = url;
											document.querySelector('.ms-slide')
													.appendChild(newImage);
										}
										const urls = "${product.productImg}";
										const urlList = urls.split(",");

										urlList.forEach(createImage);
									</script>
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-6">
						<div class="shop-product-heading">
							<h2>${product.productName}</h2>
						</div>


						<ul class="list-inline shop-product-prices margin-bottom-30">
							<li class="shop-red">Category:
								${product.category.categoryName}</li>
							<li class="shop-red">${product.productPrice} VND</li>
							<li class="shop-red">Instock: ${product.instock}</li>
						</ul>


						<h3 class="shop-product-title">Quantity</h3>
						<div class="margin-bottom-40">


							<form name="f1" class="product-quantity sm-margin-bottom-20"
								method="get" action="<c:url value="/customer/cart/add"></c:url>">
								<input type="text" value="${product.productID }"
									name="productID" hidden="">
								<button type='button' class="quantity-button" name='subtract'
									onclick='javascript: document.getElementById("qty").value--;'
									value='-'>-</button>
								<input class="quantity" min="0" name="quantity" value="1" type="number" id='qty'>
								<button type='button' class="quantity-button" name='add'
									onclick='javascript: document.getElementById("qty").value++;'
									value='+'>+</button>
								<button type="submit" class="btn-u btn-u-sea-shop btn-u-lg">Add
									to Cart</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content-md container">
			<div class="tab-v5">
				<div class="classic-tabs border rounded px-4 pt-1">
					<ul class="nav tabs-primary nav-justified" id="advancedTab"
						role="tablist">
						<li class="nav-item"><h3>Description</h3></li>
					</ul>
					<div class="tab-content" id="advancedTabContent">
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
				<h2>Product you may like</h2>
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
											<img src="${relatedProducts.productImg}">
											<div class="mask rgba-black-slight"></div>
										</div>

									</div>

									<div class="pt-4">

										<a class="namelink" href="${pageContext.request.contextPath }/product/detail?id=${relatedProducts.productID}"> ${relatedProducts.productName}</a>
										<h6>${relatedProducts.productPrice} VND</h6>
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



</body>
</html>