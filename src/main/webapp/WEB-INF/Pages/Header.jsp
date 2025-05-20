 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Css/Header.css" />
</head>
<body>

	<header class="header">
		<div class="bar">


			<div class="left">
				<a href="${pageContext.request.contextPath}/home" class="logo-link">
					<img
					src="${pageContext.request.contextPath}/Resources/Image/login/Logo.jpg"
					alt="Logo" class="logo" />
				</a>
				<div class="brand">
					<span>LET’S </span><br />
					<span class="connect">CONNECT</span>
				</div>
			</div>




			<nav class="nav">
				<a href="${pageContext.request.contextPath}/home">Home</a> <a
					href="${pageContext.request.contextPath}/Productpagecontroller">Product</a>
				<a href="${pageContext.request.contextPath}/Aboutus">About Us</a> <a
					href="${pageContext.request.contextPath}/ContactUs">Contact Us</a>
			</nav>

			<!-- Icons -->
			<div class="right">
				<a href="${pageContext.request.contextPath}/cart"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/shopping-cart.png"
					alt="Cart" title="Cart" />
				</a> <a href="${pageContext.request.contextPath}/profile"> <img
					src="${pageContext.request.contextPath}/Resources/Image/login/user.png"
					alt="User" title="User" />
				</a>
			</div>
		</div>
	</header>

</body>
</html>
