<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/adminheader.css">
<link rel="stylesheet" type="text/css" href="css/userHeader.css">

<style type="text/css">
.top{
background-image:url("images/header.jpg");
height: 150px;
}
a{
position:relative;
color: white; 
background-color:graytext; 
font-size: 100px;

}
.top a{

position: relative;
top: 90px;
}
</style>
</head>
<body>
<!-- Header -->
	<br>
	<div class="top">

		<%
		String email = session.getAttribute("email").toString();
		%>

		<center>
			<!--  <h2>Online Shopping</h2>-->
		</center>
		
				<a href=""><%=email %></a>
				<a  href="home.jsp">Home</a>
				<a  href="myCartView.jsp?email=<%=email %>">My Cart</a>
				<a  href="userOrders.jsp">My Orders</a>
				<a  href="changeDetailsView.jsp?email=<%=email %>">Change Details</a>
				<a  href="messageUser.jsp?mail=<%=email%>">Message Us</a>
				<a  href="">About</a>
				<a  href="admin/logOut.jsp">Log Out</a>
				
				<div class="search">
				<form action="searchHome.jsp"  method="post">
				<input type="text" name="searchBox" placeholder="Search here">
				<button class="icon"></button>
				</div>
				</form>
	</div>

</body>
</html>