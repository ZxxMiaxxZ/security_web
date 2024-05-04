<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="styles/LoginCss.css" type="text/css">
</head>
<body>
	<section>
		<div class="form-box">
			<div class="form-value">
				<form action="./LoginServlet" method="post">
					<input type="hidden" name="csrf_token" value="${csrfToken}">
					<h2>Login</h2>
					<div class="inputbox">
						<ion-icon name="mail-outline"></ion-icon>
						<input type="text" name="username" required> <label>Email</label>
					</div>
					<div class="inputbox">
						<ion-icon name="lock-closed-outline"></ion-icon>
						<input type="password" name="password" required> <label>Password</label>
					</div>

					<p style="color: red">${MESSAGE}</p>
					<button>Log in</button>
					<div class="forget">
						<a href="EditPassServlet">Forget Password</a>
					</div>
					<div class="register">
						<p>
							Don't have an account? <a
								href="${pageContext.request.contextPath}/RegisterServlet">Register</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
