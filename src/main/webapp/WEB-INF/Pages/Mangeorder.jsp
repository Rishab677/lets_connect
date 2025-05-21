<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Management</title>
<style>
.body {
    margin: 0;
    background: #f4f4f4;
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
    padding: 6px 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
    text-decoration: none;
    display: inline-block;
}
.btn-red {
    background-color: #e74c3c;
    color: white;
    padding: 6px 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
    text-decoration: none;
    display: inline-block;
}
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    margin-top: 20px;
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
select {
    padding: 6px;
    border-radius: 4px;
}
.nav a.active {
    background: #ae00ff;
    color: white;
    font-weight: bold;
}
.error-msg {
    color: red;
    margin-bottom: 15px;
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
                    <a href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
                    <a class="active" href="${pageContext.request.contextPath}/Orders">Orders</a>
                    <a href="${pageContext.request.contextPath}/ManageUser">Manage User</a>
                </div>
            </div>
            <button class="logout">Log out</button>
        </div>

        <div class="container">
            <h2>Order Management</h2>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="error-msg">${error}</div>
            </c:if>

            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Location</th>
                        <th>Delivery ID</th>
                        <th>Payment ID</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.quantity}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.location}</td>
                            <td>${order.deliveryID}</td>
                            <td>${order.paymentID}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/UpdateOrderStatus" method="post" style="margin:0;">
                                    <input type="hidden" name="orderId" value="${order.orderID}" />
                                    <select name="status" onchange="this.form.submit()">
                                        <option value="Pending" <c:if test="${order.status == 'Pending'}">selected</c:if>>Pending</option>
                                        <option value="Complete" <c:if test="${order.status == 'Complete'}">selected</c:if>>Complete</option>
                                        <option value="Rejected" <c:if test="${order.status == 'Rejected'}">selected</c:if>>Rejected</option>
                                    </select>
                                </form>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/EditOrder.jsp${order.orderID}" class="btn-purple">Edit</a>

                                <form action="${pageContext.request.contextPath}/DeleteOrder" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this order?');">
                                    <input type="hidden" name="orderId" value="${order.orderID}" />
                                    <button type="submit" class="btn-red">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>

    </div>
</body>
</html>