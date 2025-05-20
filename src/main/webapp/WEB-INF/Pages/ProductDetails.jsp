<%@ page import="com.letsconnect.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 40px;
            font-size: 2.5em;
            color: #2c3e50;
        }

        .product-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
            gap: 30px;
        }

        .product-info {
            flex: 1;
            max-width: 500px;
        }

        .product-info h2 {
            font-size: 2em;
            color: #e74c3c;
        }

        .product-info p {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .price {
            font-size: 1.5em;
            color: #2ecc71;
            font-weight: bold;
        }

        .product-image {
            flex: 1;
            text-align: center;
        }

        .product-image img {
            width: 300px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .back-link {
            display: block;
            margin-top: 30px;
            text-align: center;
            font-size: 1.2em;
            color: #3498db;
            text-decoration: none;
            border: 2px solid #3498db;
            padding: 10px 20px;
            border-radius: 4px;
        }

        .back-link:hover {
            background-color: #3498db;
            color: white;
        }

        .product-not-found {
            text-align: center;
            font-size: 1.5em;
            color: #e74c3c;
        }
    </style>
</head>
<body>

    <h1>Product Details</h1>

    <c:if test="${not empty product}">
        <div class="product-container">
            <div class="product-info">
                <h2>${product.name}</h2>
                <p>Brand: ${product.brand}</p>
                <p>Price: <span class="price">$${product.price}</span></p>
                <p>Specifications: ${product.specifications}</p>
            </div>
            <div class="product-image">
                <img src="${product.imagePath}" alt="Product Image" />
            </div>
        </div>
    </c:if>

    <c:if test="${empty product}">
        <div class="product-not-found">
            <p>Product not found!</p>
        </div>
    </c:if>

    <a href="${pageContext.request.contextPath}/home" class="back-link">Back to Home</a>

</body>
</html>
