<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Css/Home.css" />
<style>
/* Global styles */
body {
	font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
	margin: 0;
	padding: 0;
	color: #000;
}

.slider {
	position: relative;
	width: 100%;
	height: 600px; /* NEW: Add this */
	max-width: 1200px;
	margin: auto;
	overflow: hidden;
}

.slider img {
	width: 100%;
	height: 50%;
	object-fit: cover; /* Ensures the image scales nicely */
}

.slider img.slide {
	display: none; /* Hide all images by default */
}

.prev, .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	z-index: 1;
}

.prev {
	left: 10px;
}

.next {
	right: 10px;
}

/* Popular Categories Section */
.phonegrid {
	display: flex;
	justify-content: space-around;
	padding: 20px;
	flex-wrap: wrap;
	gap: 20px;
}

/* Hover effect for cards */
.card {
	background-color: #f4f4f4;
	padding: 20px;
	text-align: center;
	border-radius: 8px;
	width: 220px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.price {
	font-size: 1.2em;
	font-weight: bold;
	color: #d50000;
	margin-top: 10px;
}

h1 {
	text-align: center;
	margin-top: 40px;
	font-size: 2em;
	color: #333;
}
</style>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/Pages/Header.jsp" />

	<main>
		<!-- Slider Section -->
		<div class="slider">
			<img class="slide"
				src="https://cdn.grabon.in/gograbon/images/web-images/uploads/1618571140235/mobile-offers.jpg"
				alt="Logo 1"> <img class="slide"
				src="https://i0.wp.com/www.smartprix.com/bytes/wp-content/uploads/2020/03/fab-blog.png?fit=1200%2C630&ssl=1"
				alt="Register Image"> <img class="slide"
				src="${pageContext.request.contextPath}/Resources/Image/login/hq720.jpg"
				alt="Logo 2">

			<button class="prev" onclick="prevSlide()">❮</button>
			<button class="next" onclick="nextSlide()">❯</button>
		</div>

		<!-- Popular Categories Section -->
		<h1>Popular Categories</h1>
		<div class="phonegrid">
			<div class="card">
				<img
					src="https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-240909_inline.jpg.large.jpg"
					alt="Iphone 14 Pro">
				<h3>Iphone 14 pro max</h3>
				<p>Elegant and timeless style.</p>
				<div class="price">$149</div>
				<form action="${pageContext.request.contextPath}/Addtocart"
					method="post">
					<input type="hidden" name="productName" value="Iphone 14 pro max" />
					<input type="hidden" name="price" value="149" />
					<button type="submit" class="addtocartbtn">Add to Cart</button>
				</form>
			</div>
			<div class="card">
				<img
					src="https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-240909_inline.jpg.large.jpg"
					alt="Iphone 14 Pro">
				<h3>Iphone 14 pro max</h3>
				<p>Elegant and timeless style.</p>
				<div class="price">$149</div>
				<form action="${pageContext.request.contextPath}/Addtocart"
					method="post">
					<input type="hidden" name="productName" value="Iphone 14 pro max" />
					<input type="hidden" name="price" value="149" />
					<button type="submit" class="addtocartbtn">Add to Cart</button>
				</form>
			</div>

			<div class="card">
				<img
					src="https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-240909_inline.jpg.large.jpg"
					alt="Iphone 14 Pro">
				<h3>Iphone 14 pro max</h3>
				<p>Elegant and timeless style.</p>
				<div class="price">$149</div>
				<form action="${pageContext.request.contextPath}/Addtocart"
					method="post">
					<input type="hidden" name="productName" value="Iphone 14 pro max" />
					<input type="hidden" name="price" value="149" />
					<button type="submit" class="addtocartbtn">Add to Cart</button>
				</form>
			</div>

			<div class="card">
				<img
					src="https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-240909_inline.jpg.large.jpg"
					alt="Iphone 14 Pro">
				<h3>Iphone 14 pro max</h3>
				<p>Elegant and timeless style.</p>
				<div class="price">$149</div>
				<form action="${pageContext.request.contextPath}/Addtocart"
					method="post">
					<input type="hidden" name="productName" value="Iphone 14 pro max" />
					<input type="hidden" name="price" value="149" />
					<button type="submit" class="addtocartbtn">Add to Cart</button>
				</form>
			</div>

			<div class="card">
				<img
					src="https://www.apple.com/newsroom/images/2024/09/apple-debuts-iphone-16-pro-and-iphone-16-pro-max/article/Apple-iPhone-16-Pro-hero-240909_inline.jpg.large.jpg"
					alt="Iphone 14 Pro">
				<h3>Iphone 14 pro max</h3>
				<p>Elegant and timeless style.</p>
				<div class="price">$149</div>
				<form action="${pageContext.request.contextPath}/Addtocart"
					method="post">
					<input type="hidden" name="productName" value="Iphone 14 pro max" />
					<input type="hidden" name="price" value="149" />
					<button type="submit" class="addtocartbtn">Add to Cart</button>
				</form>
			</div>

		</div>
	</main>

	<script>
    const slides = document.querySelectorAll(".slide");
    let index = 0;

    function showSlide(i) {
      slides.forEach((slide, idx) => {
        slide.style.display = idx === i ? "block" : "none";
      });
    }

    function nextSlide() {
      index = (index + 1) % slides.length;
      showSlide(index);
    }

    function prevSlide() {
      index = (index - 1 + slides.length) % slides.length;
      showSlide(index);
    }

    // Initialize first slide
    showSlide(index);

    // Auto-slide every 3 seconds
    setInterval(nextSlide, 3000);
  </script>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>

</html>
