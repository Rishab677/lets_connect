<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>This is the Cart Page</title>

<!-- Improved Internal CSS -->
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	background-color: #fff;
	color: #333;
}

.breadcrumb {
	padding: 10px 25px;
	font-size: 14px;
	color: #666;
	margin: 0;
}

.breadcrumb strong {
	color: #000;
}

.breadcrumb a {
	text-decoration: none;
	color: #6b4cc7;
	font-weight: bold;
}

.breadcrumb a:hover {
	text-decoration: underline;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 60px 20px;
	text-align: center;
}

.cart-icon img {
	width: 100px;
	height: auto;
	margin-bottom: 25px;
}

.empty-message {
	font-size: 18px;
	font-weight: bold;
	color: #d9534f;
	margin-bottom: 30px;
	border: 1px solid #ddd;
	padding: 20px 30px;
	border-radius: 8px;
	background-color: #fff0f0;
}

.btn {
	background-color: #6b4cc7;
	color: white;
	padding: 12px 28px;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	cursor: pointer;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #5538a6;
}

iframe {
	display: block;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/Pages/Header.jsp" />


	<div class="breadcrumb">
		<a href="/Home.html">Home</a> &gt; <strong>Cart</strong>
	</div>

	<div class="container">
		<div class="cart-icon">
			<img src="https://cdn-icons-png.flaticon.com/512/102/102661.png"
				alt="Empty Box" />
		</div>

		<div class="empty-message">YOUR CART IS CURRENTLY EMPTY.</div>

		<a href="#" class="btn">Return to Shop</a>
	</div>

	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>