<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/background.css">
<link rel="stylesheet" href="css/login.css">
<title>Login</title>
</head>
<body>
	<div id='container'>
		<div class="signup">
			<form action="LoginAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter Email"
					required="required"> <input type="password" name="password"
					placeholder="Enter Password" required="required"> <input
					type="submit" id="btn"  value="Login">
			</form>
			<h2>
				<a href="signup.jsp">SignUp</a>
			</h2>
			<h2>
				<a href="forgotPassword.jsp">Forgot Password</a>
			</h2>
		</div>
		<div class='whysignLogin'>
			<%
			String msg = request.getParameter("msg");
			if ("notexist".equals(msg)) {
			%>
			<h1>Incorrect Username or Password</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing went wrong! Try Again !</h1>
			<%
			}
			%>
		<!--  <h2>Online Shopping</h2>-->	
		<img alt="" src="images/jcart-logo.png">
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>