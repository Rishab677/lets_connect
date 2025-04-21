<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <style>
        /* Basic styling for the profile page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            text-align: center;
        }
        .profile-header h1 {
            color: #333;
        }
        .profile-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .profile-details .field {
            width: 45%;
            margin-bottom: 10px;
        }
        .field label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-header">
        <h1>User Profile</h1>
        <img src="<c:if test="${not empty user.profilePhoto}">/resources/images/${user.profilePhoto}</c:if><c:if test="${empty user.profilePhoto}">/resources/images/default.png</c:if>" alt="Profile Photo" style="width: 150px; height: 150px; border-radius: 50%;"/>
    </div>

    <div class="profile-details">
        <div class="field">
            <label>First Name:</label>
            <p><c:out value="${user.firstName}" /></p>
        </div>
        <div class="field">
            <label>Last Name:</label>
            <p><c:out value="${user.lastName}" /></p>
        </div>
        <div class="field">
            <label>Email:</label>
            <p><c:out value="${user.email}" /></p>
        </div>
        <div class="field">
            <label>Phone Number:</label>
            <p><c:out value="${user.phone}" /></p>
        </div>
        <div class="field">
            <label>Gender:</label>
            <p><c:out value="${user.gender}" /></p>
        </div>
        <div class="field">
            <label>Username:</label>
            <p><c:out value="${user.username}" /></p>
        </div>
        <div class="field">
            <label>Province:</label>
            <p><c:out value="${user.province}" /></p>
        </div>
        <div class="field">
            <label>City:</label>
            <p><c:out value="${user.city}" /></p>
        </div>
    </div>

    <a href="logout" style="display: block; text-align: center; margin-top: 20px; text-decoration: none; color: #5a2ea6;">Logout</a>
</div>
</body>
</html>