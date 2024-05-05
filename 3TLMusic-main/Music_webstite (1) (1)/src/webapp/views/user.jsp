<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
</head>
<body>
    <h2>User Information</h2>

    <!-- Display user information -->
    <c:if test="${not empty user}">
        <p><strong>Username:</strong> ${user.username}</p>
        <p><strong>Email:</strong> ${user.email}</p>
        <p><strong>Fullname:</strong> ${user.fullname}</p>
        <!-- Add more fields as needed -->
    </c:if>

    <!-- Add a link to go back to the main page -->
    <a href="index.jsp">Go back to main page</a>
</body>
</html>
