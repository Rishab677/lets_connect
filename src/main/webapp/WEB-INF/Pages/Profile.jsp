<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Responsive User Profile</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.profile-container {
	max-width: 450px;
	margin: auto;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	padding: 2rem;
}

.profile-header {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	gap: 1.5rem;
	border-bottom: 1px solid #ddd;
	padding-bottom: 1rem;
}

.profile-header img {
	width: 130px;
	height: 130px;
	border-radius: 50%;
	border: 4px solid #7e22ce;
	object-fit: cover;
}

.info {
	flex: 1;
	min-width: 250px;
}

.info h2 {
	margin: 0;
	font-size: 1.8rem;
	color: #333;
}

.info .type {
	margin: 0.4rem 0;
	background-color: #7e22ce;
	color: #fff;
	padding: 4px 12px;
	font-size: 0.9rem;
	border-radius: 5px;
	display: inline-block;
}

.info p {
	margin: 4px 0;
	color: #555;
}

.profile-details {
	margin-top: 1.5rem;
}

.profile-details h3 {
	color: #7e22ce;
	margin-bottom: 1rem;
}

.profile-details ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.profile-details li {
	padding: 0.6rem 0;
	border-bottom: 1px solid #eee;
	color: #333;
}
</style>
</head>
<body>

	<!-- Header -->
	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<div class="profile-container">
		<div class="profile-header">
			<img src="https://randomuser.me/api/portraits/women/68.jpg"
				alt="Profile Photo" />
			<div class="info">
				<h2>Jane Doe</h2>
				<div class="type">User Profile Type: Admin</div>
				<p>Email: jane.doe@example.com</p>
				<p>Phone: +1 (555) 123-4567</p>
				<p>Location: New York, USA</p>
			</div>
		</div>

		<div class="profile-details">
			<h3>About</h3>
			<ul>
				<li><strong>Role:</strong> Full Stack Developer</li>
				<li><strong>Skills:</strong> HTML, CSS, JavaScript, React,
					Node.js, MongoDB</li>
				<li><strong>Experience:</strong> 3+ years in Web Development</li>
				<li><strong>Education:</strong> B.Sc. in Computer Science</li>
				<li><strong>Interests:</strong> UI/UX Design, Open Source,
					Travel, Blogging</li>
			</ul>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>
