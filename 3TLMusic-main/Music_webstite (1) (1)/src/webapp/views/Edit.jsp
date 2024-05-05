<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit User Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <style>
		body {
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(to bottom, #8B0000, #000000);
    color: #ffffff; /* Màu chữ trắng */
}

        
        </style>
</head>
<body>

<div class="container" style="width: 50%; margin: 0 auto;">
    <div class="row" style="border: 1px darkgrey solid; border-radius: 10px; padding: 20px;">
        <div class="col-sm-12">
            <h2>Edit User Information</h2>
            <form action="./EditPassServlet" method="post">
            	<input type="hidden" name="csrfToken" value="${csrfToken}">
                <div class="form-group">
                    <label for="username">UserName</label>
                    <input type="text" class="form-control" id="username" name="username" value="${cookie.user.value}" placeholder="Your UserName" readonly>
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password (leave blank if unchanged)</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter New Password">
                </div>
                <div class="form-group">
                    <label for="fullname">FullName</label>
                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Your FullName">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Your Email">
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="${pageContext.request.contextPath}/LoginServlet" class="btn btn-primary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<script src="./js/script.js"></script>

</body>
</html>
