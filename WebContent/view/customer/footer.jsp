<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="${url }custom.css/footer.css">
</head>
<body>
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

</body>
</html>