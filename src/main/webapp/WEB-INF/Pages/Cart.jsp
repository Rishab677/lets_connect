<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<style>
body {
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}

main {
	max-width: 1000px;
	margin: 50px auto;
	padding: 30px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 20px;
	font-size: 26px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background-color: #eee;
}

th, td {
	padding: 14px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

.btn {
	padding: 5px 12px;
	border: none;
	background-color: #6b4cc7;
	color: #fff;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
}

.btn:hover {
	background-color: #5538a6;
}

.qty-box {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5px;
}

.qty-input {
	width: 40px;
	text-align: center;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
<script>
	function updateTotalPrice(rowId, price) {
		const qtyInput = document.getElementById("qty" + rowId);
		const qty = parseInt(qtyInput.value);
		const totalField = document.getElementById("total" + rowId);
		totalField.innerText = "Rs. " + (qty * price).toFixed(2);
	}

	function increaseQty(rowId, price) {
		const qtyInput = document.getElementById("qty" + rowId);
		qtyInput.value = parseInt(qtyInput.value) + 1;
		updateTotalPrice(rowId, price);
	}

	function decreaseQty(rowId, price) {
		const qtyInput = document.getElementById("qty" + rowId);
		if (parseInt(qtyInput.value) > 1) {
			qtyInput.value = parseInt(qtyInput.value) - 1;
			updateTotalPrice(rowId, price);
		}
	}
</script>
</head>
<body>

	<!-- Header Include -->
	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<main>
		<h1>Your Cart</h1>

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Qty</th>
					<th>Total Price</th>
				</tr>
			</thead>
			<tbody>
				<!-- Example Row 1 -->
				<tr>
					<td>1</td>
					<td>Wireless Mouse</td>
					<td>Rs. 499.00</td>
					<td>
						<div class="qty-box">
							<button class="btn" onclick="decreaseQty(1, 499)">−</button>
							<input type="text" id="qty1" class="qty-input" value="1" readonly />
							<button class="btn" onclick="increaseQty(1, 499)">+</button>
						</div>
					</td>
					<td id="total1">Rs. 499.00</td>
				</tr>

				<!-- Example Row 2 -->
				<tr>
					<td>2</td>
					<td>USB Keyboard</td>
					<td>Rs. 699.00</td>
					<td>
						<div class="qty-box">
							<button class="btn" onclick="decreaseQty(2, 699)">−</button>
							<input type="text" id="qty2" class="qty-input" value="1" readonly />
							<button class="btn" onclick="increaseQty(2, 699)">+</button>
						</div>
					</td>
					<td id="total2">Rs. 699.00</td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: right; margin-top: 25px;">
			<button class="btn" onclick="alert('Proceeding to checkout...')">Checkout</button>
		</div>
	</main>

	<!-- Footer Include -->
	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>
