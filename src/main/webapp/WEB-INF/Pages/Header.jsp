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
		<div class="header-content">
			<!-- Top Section -->
			<div class="top">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/home"> <img
						src="${pageContext.request.contextPath}/Resources/Image/login/Logo.jpg"
						alt="Logo">
					</a>
					<div class="brand">
						<span>LET’S</span><br /> <span class="connect">CONNECT</span>
					</div>
				</div>

				<div class="search">
					<input type="text"
						placeholder="Search for products, categories or brands" />
				</div>

				<div class="icons">
					<a href="${pageContext.request.contextPath}/Addtocart"> <img
						src="${pageContext.request.contextPath}/Resources/Image/login/shopping-cart.png"
						alt="Cart" title="Cart" />
					</a> <a href="${pageContext.request.contextPath}/login"> <img
						src="${pageContext.request.contextPath}/Resources/Image/login/user.png" alt="User"
						title="User" />
					</a>

				</div>
			</div>

			<!-- Nav Below Search Box -->
			<nav class="nav">
				<a href="${pageContext.request.contextPath}/home">Home</a> <a
					href="${pageContext.request.contextPath}/product">Product</a> <a
					href="${pageContext.request.contextPath}/about">About Us</a> <a
					href="${pageContext.request.contextPath}/contact">Contact Us</a>
			</nav>
		</div>
	</header>


</body>
</html>
