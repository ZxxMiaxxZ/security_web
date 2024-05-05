<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Add Album</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #007bff;
        }

        form {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label, input {
            margin-bottom: 10px;
            display: block;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        p {
            margin: 10px 0;
        }

        a {
            color: #007bff;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <h1>Add Album</h1>

    <%-- Display success message --%>
    <% String successMessage = (String) request.getAttribute("successMessage"); %>
    <% if (successMessage != null && !successMessage.isEmpty()) { %>
        <p style="color: green;"><%= successMessage %></p>
    <% } %>

    <%-- Display error message --%>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <%-- Your form goes here --%>
<form action="AlbumServlet" method="post">
    <input type="hidden" name="csrfToken" value="${csrfToken}">

    <label>Album Name:</label>
    <input type="text" name="albumname" required>

    <label>Singer Name:</label>
    <input type="text" name="singername" required>

    <input type="submit" value="Add Album">
</form>


    <br>

    <%-- Link to show all albums --%>
    <a href="${pageContext.request.contextPath}/HomeServlet">Show All Albums</a>
</body>
</html>
