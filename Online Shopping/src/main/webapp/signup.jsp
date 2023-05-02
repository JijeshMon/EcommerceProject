<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<link rel="stylesheet" href="css/background.css">
<link rel="stylesheet" href="css/signup_user.css">
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="SignupAction.jsp" method="post">
				<input type="text" name="name" placeholder="Enter Name"
					required="required"> <input type="email" name="email"
					placeholder="Enter Email" required="required"> 
					<input type="number" name="mobileNumber" placeholder="Enter Mobile Number"
					required="required"> 
					<select name="securityQuestion">
					<option value="What was your first car?">What was your
						first car?</option>
					<option value="What is the name of your first pet?">What
						is the name of your first pet?</option>
					<option value="What elementary school did you attend?">What
						elementary school did you attend?</option>
					<option value="What is the name of the town where you were born?">What
						is the name of the town where you were born?</option>
				</select> 
				<input type="text" name="answer" placeholder="Enter Answer"
					required="required"> <input type="password" name="password"
					placeholder="Enter Password" required="required"> 
					<input type="submit"  id="btn" value="signup">
			</form>
			<h2>
				<a href="Login.jsp">Login</a>
			</h2>

		</div>
		<div class='whysign'>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Successfully Registered !</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Something went wrong! Try again!</h1>
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