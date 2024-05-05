<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Singer</title>
</head>
<body>
    <h2>Add Singer</h2>
    <form action="SingerServlet" method="post" enctype="multipart/form-data">
        <label for="name">Singer Name:</label>
        <input type="text" name="name" id="name" required>
        <br>
        <label for="date">Singer Date:</label>
        <input type="text" name="date" id="date" required>
        <br>
        <label for="imgsinger">Choose singer's image:</label>
        <input type="file" name="imgsinger" id="imgsinger" required>
        <br>
        <input type="submit" value="Add Singer">
    </form>
</body>
</html>
