<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Enter Album Name</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/ShowSongsServlet" method="GET">
        <label for="albumName">Enter Album Name:</label>
        <input type="text" id="albumName" name="albumName" required>
        <button type="submit">Show Songs</button>
    </form>
</body>
</html>
