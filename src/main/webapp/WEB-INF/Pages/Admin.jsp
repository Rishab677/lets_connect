<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Admin Dashboard</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	display: flex;
	height: 100%;
	width: 100%;
	min-height: 1000px;
}

/* Sidebar */
.sidebar {
	width: 220px;
	background-color: #151934;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 20px 15px;
	height: 100%;
}

.logo {
	font-size: 20px;
	font-weight: bold;
	color: #ae00ff;
	margin-bottom: 40px;
}

.menu a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 12px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	transition: 0.3s;
}

.menu a:hover {
	background-color: #292f53;
}

.menu a.active {
	background-color: #ae00ff; /* Active background color */
	color: white; /* Active text color */
}

.logout-btn {
	background-color: #ae00ff;
	border: none;
	color: white;
	padding: 10px;
	width: 100%;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

/* Main Content */
.main {
	flex: 1;
	padding: 20px 30px;
	background-color: #f4f4f4;
}

.main h2 {
	font-size: 22px;
	margin-bottom: 20px;
}

.cards {
	display: flex;
	gap: 20px;
	margin-bottom: 30px;
}

.card {
	background-color: white;
	border-radius: 10px;
	padding: 20px;
	width: 200px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.card-icon {
	font-size: 30px;
	margin-bottom: 10px;
	color: #6a0dad;
}

.card-title {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 8px;
}

.card-value {
	font-size: 22px;
	color: #6a0dad;
	font-weight: bold;
}

.graph {
	background: linear-gradient(to top, #e5ccff, #ffffff);
	height: 280px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: center;
	color: #6a0dad;
	font-size: 24px;
	font-weight: bold;
}
</style>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>

	<div class="container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div>
				<div class="logo">Let's Connect</div>
				<div class="menu">
					<a href="${pageContext.request.contextPath}/Dashboard"
						class="${activePage == 'dashboard' ? 'active' : ''}">Dashboard</a>

					<a href="${pageContext.request.contextPath}/Product"
						class="${activePage == 'product' ? 'active' : ''}">Product</a> <a
						href="${pageContext.request.contextPath}/Orders"
						class="${activePage == 'orders' ? 'active' : ''}">Orders</a>
				</div>
			</div>
			<button class="logout-btn">Log out</button>
		</div>

		<!-- Main content -->
		<div class="main">
			<h2>Dashboard</h2>

			<div class="cards">
				<div class="card">
					<div class="card-icon">
						<i class="fas fa-home"></i>
					</div>
					<div class="card-title">Total Orders</div>
					<div class="card-value">9</div>
				</div>
				<div class="card">
					<div class="card-icon">
						<i class="fas fa-crosshairs"></i>
					</div>
					<div class="card-title">Total Product</div>
					<div class="card-value">21</div>
				</div>
				<div class="card">
					<div class="card-icon">
						<i class="fas fa-user"></i>
					</div>
					<div class="card-title">Total Customer</div>
					<div class="card-value">15</div>
				</div>
			</div>

			<div class="graph">Chart Placeholder</div>
		</div>
	</div>

</body>
</html>
