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

	<!-- Top Bar -->
	<div class="top-bar">
		<p>FREE delivery 40% Discount for next 3 orders! Place your 1st
			order in.</p>
		<div>
			Until the end of the sale: <strong>47</strong> days <strong>06</strong>
			hours <strong>49</strong> minutes <strong>27</strong> sec.
		</div>
	</div>

	<!-- Header -->
	<header class="header-container">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/home"> <img
				src="${pageContext.request.contextPath}/Resources/Image/login/Logo.jpg"
				alt="Logo Image">
			</a>
			<h1>
				LET’S <br />
				<span>CONNECT</span>
			</h1>
		</div>

		<div class="search-section">
			<input type="text"
				placeholder="Search for products, categories or brands" />
		</div>

		<div class="icon-group">
			<a href="${pageContext.request.contextPath}/Addtocart"> <img
				src="https://cdn-icons-png.flaticon.com/512/263/263142.png"
				alt="Cart" title="Cart" />
			</a> <a href="${pageContext.request.contextPath}/profile"> <img
				src="https://randomuser.me/api/portraits/women/68.jpg" alt="User"
				title="User" />
			</a>


			<div class="account">
				<select name="account" id="accountSelect">
					<option value="">My Account</option>
					<option value="${pageContext.request.contextPath}/login">Log
						In</option>
					<option value="${pageContext.request.contextPath}/Register">Sign
						Up</option>
					<option value="${pageContext.request.contextPath}/logout">Log
						Out</option>
					<option value="${pageContext.request.contextPath}/contact">Contact
						Us</option>
				</select>
			</div>
		</div>
	</header>


	<div class="nav-bar">
		<div class="nav-left">
			<select class="Select"
				onchange="if(this.value) location = this.value;">
				<option value="${pageContext.request.contextPath}/home">Home</option>
				<option value="${pageContext.request.contextPath}/login">About
					Us</option>
				<option value="#">Page1</option>
				<option value="#">Page2</option>
			</select> <select class="Select" onchange="location = this.value;">
				<option value="">Shop</option>
				<option value="${pageContext.request.contextPath}/admin">
					Admin Panel</option>
				<option value="${pageContext.request.contextPath}/pagenotfound">page
					Not Found</option>
			</select> <a href="${pageContext.request.contextPath}/blog">Blog</a> <a
				href="${pageContext.request.contextPath}/contact">Contact</a>
		</div>

		<div class="nav-right">
			<select class="Select" onchange="location = this.value;">
				<option value="#">Trending Products</option>
				<option value="${pageContext.request.contextPath}/productDetails">Product
					Details</option>
				<option value="${pageContext.request.contextPath}/checkOut">Check
					Out</option>
			</select>
		</div>
	</div>



</body>
</html>
