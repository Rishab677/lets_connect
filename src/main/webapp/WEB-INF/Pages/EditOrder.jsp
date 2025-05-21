<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Order</title>
<style>
/* Simple styles for form */
.container {
	width: 400px;
	margin: 50px auto;
	background: #f4f4f4;
	padding: 20px;
	border-radius: 8px;
}

input, select {
	width: 100%;
	padding: 8px;
	margin-bottom: 12px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

button {
	background-color: #6a0dad;
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	border-radius: 4px;
	font-weight: bold;
}

.error-msg {
	color: red;
	margin-bottom: 12px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Edit Order</h2>

		<c:if test="${not empty error}">
			<div class="error-msg">${error}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/EditOrder"
			method="post">
			<input type="hidden" name="orderId" value="${order.orderID}" /> <label>Quantity:</label>
			<input type="number" name="quantity" value="${order.quantity}"
				required /> <label>Total Price:</label> <input type="number"
				step="0.01" name="totalPrice" value="${order.totalPrice}" required />

			<label>Location:</label> <input type="text" name="location"
				value="${order.location}" required /> <label>Delivery ID:</label> <input
				type="text" name="deliveryId" value="${order.deliveryID}" required />

			<label>Payment ID:</label> <input type="text" name="paymentId"
				value="${order.paymentID}" required /> <label>Status:</label> <select
				name="status" required>
				<option value="Pending"
					<c:if test="${order.status == 'Pending'}">selected</c:if>>Pending</option>
				<option value="Complete"
					<c:if test="${order.status == 'Complete'}">selected</c:if>>Complete</option>
				<option value="Rejected"
					<c:if test="${order.status == 'Rejected'}">selected</c:if>>Rejected</option>
			</select>

			<button type="submit">Update Order</button>
		</form>
	</div>
</body>
</html>