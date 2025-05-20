<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobile Product Management</title>
<style>
body {
	margin: 0;
	background: #f4f4f4;
	font-family: Arial, sans-serif;
}
.wrap {
	display: flex;
	width: 100%;
	min-height: 100vh;
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
.nav a:hover, .nav a.active {
	background: #ae00ff;
	font-weight: bold;
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
.container {
	width: 100%;
	padding: 20px;
	background: #f4f4f4;
	display: flex;
	flex-direction: column;
	align-items: center;
}
h2 {
	margin-bottom: 20px;
	color: #333;
}
.btn-purple {
	background-color: #6a0dad;
	color: white;
	padding: 10px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
	margin-bottom: 20px;
}
.btn-red {
	background-color: #e74c3c;
	color: white;
	padding: 10px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
}
form {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 30px;
	width: 100%;
	max-width: 600px;
	display: ${editProduct != null ? "block" : "none"};
}
form input, form textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
table {
	width: 100%;
	border-collapse: collapse;
	background: white;
}
table, th, td {
	border: 1px solid #ddd;
}
th {
	background-color: #6a0dad;
	color: white;
}
th, td {
	padding: 12px;
	text-align: left;
}
img {
	max-width: 50px;
	height: auto;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="side">
			<div>
				<div class="logo">Let's Connect</div>
				<div class="nav">
					<a href="${pageContext.request.contextPath}/admin">Dashboard</a>
					<a class="active" href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
					<a href="${pageContext.request.contextPath}/Orders">Orders</a>
					<a href="${pageContext.request.contextPath}/Manageuser">Manage User</a>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/Logout" method="post">
				<button type="submit" class="logout">Log out</button>
			</form>
		</div>

		<div class="container">
			<h2>Mobile Product Management</h2>

			<c:if test="${editProduct == null}">
				<button class="btn-purple" onclick="toggleForm()">Add Product</button>
			</c:if>

			<form id="productForm"
				action="${pageContext.request.contextPath}/UpdateProduct?action=${editProduct != null ? 'edit' : 'add'}"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="productId" value="${editProduct != null ? editProduct.id : ''}" />
				<input type="text" name="product_name" placeholder="Product Name" required
					value="${editProduct != null ? editProduct.name : ''}" />
				<input type="text" name="product_brand" placeholder="Brand" required
					value="${editProduct != null ? editProduct.brand : ''}" />
				<input type="text" name="product_price" placeholder="Price" required
					value="${editProduct != null ? editProduct.price : ''}" />
				<textarea name="product_specifications" placeholder="Specifications" rows="3" required>
${editProduct != null ? editProduct.specifications : ''}</textarea>
				<input type="file" name="product_image" ${editProduct == null ? "required" : ""} />
				<button type="submit" class="btn-purple">${editProduct != null ? "Update" : "Add"} Product</button>
				<button type="button" class="btn-red" onclick="cancelForm()">Cancel</button>
			</form>

			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Brand</th>
						<th>Price</th>
						<th>Specifications</th>
						<th>Image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${products}">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td>${p.brand}</td>
							<td>${p.price}</td>
							<td>${p.specifications}</td>
							<td>
								<c:if test="${not empty p.imagePath}">
									<img src="${pageContext.request.contextPath}/${p.imagePath}" alt="${p.name}" />
								</c:if>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/UpdateProduct?action=edit&id=${p.id}" class="btn-purple">Edit</a>
								<a href="#" onclick="deleteProduct(${p.id})" class="btn-red">Delete</a>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty products}">
						<tr>
							<td colspan="7">No products found.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>

	<script>
	function toggleForm() {
		const form = document.getElementById("productForm");
		form.reset();
		form.style.display = "block";
	}
	function cancelForm() {
		const form = document.getElementById("productForm");
		form.reset();
		form.style.display = "none";
	}
	function deleteProduct(productId) {
		if (confirm("Are you sure you want to delete this product?")) {
			const form = document.createElement("form");
			form.method = "POST";
			form.action = "${pageContext.request.contextPath}/UpdateProduct?action=delete&id=" + productId;
			document.body.appendChild(form);
			form.submit();
		}
	}
	</script>
</body>
</html>