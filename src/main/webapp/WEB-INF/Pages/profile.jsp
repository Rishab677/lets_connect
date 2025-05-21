<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>

body {
	background: #f5f5f5;
	margin: 0;
	padding: 0;
}
main {
	max-width: 900px;
	margin: 50px auto;
	display: flex;
	gap: 30px;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.left {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
}
.left img {
	width: 180px;
	height: 180px;
	border-radius: 10px;
	object-fit: cover;
}
.right {
	flex: 2;
}
.right h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}
form {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 12px;
}
form input, form select {
	width: 90%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 13px;
}
.buttons {
	grid-column: span 2;
	text-align: center;
	margin-top: 10px;
}
.buttons button {
	background: #4b1c76;
	color: white;
	border: none;
	padding: 8px 18px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	margin: 0 8px;
}
.buttons button:hover {
	background: #37155a;
}
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}
.modal-content {
	background-color: #fff;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 500px;
	border-radius: 10px;
}
.modal-content h3 {
	text-align: center;
	color: #333;
}
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}
.close:hover {
	color: black;
}
.message {
	grid-column: span 2;
	text-align: center;
	font-size: 14px;
	color: green;
}
.error {
	color: red;
}
</style>
<script>
function openModal() {
	document.getElementById("editModal").style.display = "block";
}
function closeModal() {
	document.getElementById("editModal").style.display = "none";
}
</script>
</head>
<body>

<jsp:include page="/WEB-INF/Pages/Header.jsp" />

<main>
	<!-- Static profile image for all users -->
	<div class="left">
		<img src="${pageContext.request.contextPath}/Resources/Image/profile/profile.png" alt="Profile Photo" />
	</div>

	<div class="right">
		<h2>User Profile</h2>
	<!-- 	hello world -->

		<c:if test="${not empty success}">
			<div class="message">${success}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="message error">${error}</div>
		</c:if>

		<form>
			<div><label>First Name</label><input type="text" value="${user.firstName}" readonly /></div>
			<div><label>Last Name</label><input type="text" value="${user.lastName}" readonly /></div>
			<div><label>Email</label><input type="email" value="${user.email}" readonly /></div>
			<div><label>Phone Number</label><input type="text" value="${user.phone}" readonly /></div>
			<div>
				<label>Gender</label>
				<select disabled>
					<option value="Male" <c:if test="${user.gender == 'Male'}">selected</c:if>>Male</option>
					<option value="Female" <c:if test="${user.gender == 'Female'}">selected</c:if>>Female</option>
					<option value="Other" <c:if test="${user.gender == 'Other'}">selected</c:if>>Other</option>
				</select>
			</div>
			<div><label>Username</label><input type="text" value="${user.username}" readonly /></div>
			<div><label>Province</label><input type="text" value="${user.province}" readonly /></div>
			<div><label>City</label><input type="text" value="${user.city}" readonly /></div>

			<div class="buttons">
				<button type="button" onclick="openModal()">Edit</button>
			</div>
		</form>

		<!-- Logout -->
		<form action="${pageContext.request.contextPath}/logout" method="post" style="text-align: center; margin-top: 10px;">
			<button type="submit">Logout</button>
		</form>
	</div>
</main>

<!-- Edit Modal -->
<div id="editModal" class="modal">
	<div class="modal-content">
		<span class="close" onclick="closeModal()">&times;</span>
		<h3>Edit Profile</h3>
		<form action="${pageContext.request.contextPath}/profile" method="post">
			<input type="hidden" name="username" value="${user.username}" />
			<input type="hidden" name="email" value="${user.email}" />
			<div><label>First Name</label><input type="text" name="firstName" value="${user.firstName}" required /></div>
			<div><label>Last Name</label><input type="text" name="lastName" value="${user.lastName}" required /></div>
			<div><label>Phone</label><input type="text" name="phone" value="${user.phone}" required /></div>
			<div>
				<label>Gender</label>
				<select name="gender">
					<option value="Male" <c:if test="${user.gender == 'Male'}">selected</c:if>>Male</option>
					<option value="Female" <c:if test="${user.gender == 'Female'}">selected</c:if>>Female</option>
					<option value="Other" <c:if test="${user.gender == 'Other'}">selected</c:if>>Other</option>
				</select>
			</div>
			<div><label>Province</label><input type="text" name="province" value="${user.province}" required /></div>
			<div><label>City</label><input type="text" name="city" value="${user.city}" required /></div>
			<div><label>New Password</label><input type="password" name="newPassword" /></div>
			<div><label>Confirm Password</label><input type="password" name="confirmPassword" /></div>
			<div class="buttons">
				<button type="submit">Save</button>
				<button type="button" onclick="closeModal()">Cancel</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/Pages/Footer.jsp" />

</body>
</html>