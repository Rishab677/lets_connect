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

.wrap {
	display: flex;
	width: 100%;
	min-height: 1000px;
}


.side {
	width: 220px;
	background: #151934;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 20px 15px;
}

.logo {
	font-size: 20px;
	font-weight: bold;
	color: #ae00ff;
	margin-bottom: 40px;
}

.nav a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 12px 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	transition: 0.3s;
}

.nav a:hover {
	background: #292f53;
}

.logout {
	background: #ae00ff;
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
	background: #f4f4f4;
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
	background: white;
	border-radius: 10px;
	padding: 20px;
	width: 200px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.card-title {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 8px;
}

.card-val {
	font-size: 22px;
	color: #6a0dad;
	font-weight: bold;
}

.chart {
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
.nav a.active {
	background: #ae00ff;
	color: white;
	font-weight: bold;
}
.nav a:hover {
	background: #292f53;
}


</style>
</head>
<body>

	<div class="wrap">
		<!-- Sidebar -->
		<div class="side">
			<div>
				<div class="logo">Let's Connect</div>
				<div class="nav">
					<a class="active" href="${pageContext.request.contextPath}/admin">Dashboard</a> 
					<a href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
					<a href="${pageContext.request.contextPath}/Orders">Orders</a>
					<a href="${pageContext.request.contextPath}/Manageuser">Manage User </a>
				</div>
			</div>
			<button class="logout">Log out</button>
		</div>

		<!-- Main content -->
		<div class="main">
			<h2>Dashboard</h2>

			<div class="cards">
				<div class="card">
					<div class="card-title">Total Orders</div>
					<div class="card-val">9</div>
				</div>
				<div class="card">
					<div class="card-title">Total Product</div>
					<div class="card-val">21</div>
				</div>
				<div class="card">
					<div class="card-title">Total Customer</div>
					<div class="card-val">15</div>
				</div>
			</div>

			<div class="chart">Chart Placeholder</div>
		</div>
	</div>

</body>
</html>