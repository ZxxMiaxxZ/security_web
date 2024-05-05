<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/searchheader.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/hearder1.jsp" />
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #bf5050;
            color: #333;
        }

        h2 {
            color: #973030
        }

        form {
            margin: 20px;
            padding: 20px;
   background-color: #5c4040;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            opacity: 100%;
        }

        label, input, select {
            margin-bottom: 10px;
            display: block;
        }

        input[type="text"], input[type="file"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #973030;
            color: #fff;
            cursor: pointer;
        }
    </style>
    <title>Upload Song Information</title>
</head>
    <h2>Upload Song Information</h2>
    <form action="UploadFolderServlet" method="post" enctype="multipart/form-data">
    <label for="audioFile">Select Music File:</label>
    <input type="file" name="audioFile" id="audioFile" required>
    <br>
    <label for="imageFile">Select image file:</label>
    <input type="file" name="imageFile" id="imageFile" required>
    <br>
    <input type="text" name="name" placeholder="Song Name" required>
    <br>
    <input type="text" name="author" placeholder="Author" required>
    <br>
    <input type="text" name="releaseDay" placeholder="Release Day" required>
    <br>
    <input type="text" name="type" placeholder="Type" required>
    <br>
    <input type="text" name="albumname" placeholder="Album" required>
    <br>
    <input type="submit" value="Upload">
</form>
    </div>
    
    </div>
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />