<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/adminheader.css">
</head>
<body>

	<!-- Header -->
	<br>
	<div class="top">

		<%
		String email = session.getAttribute("email").toString();
		%>

		<center>
		<!-- <h2>J Kart</h2> -->
		</center>
		
		
				<a    href="addNewProduct.jsp">Add New Product</a>
				<a   href="allProductEditProduct.jsp">All Product & Edit Product</a>
				<a  href="messagesReceived.jsp">Messages Received</a>
				<a  href="ordersReceived.jsp">Orders Received</a>
				<a   href="cancelOrders.jsp">Cancel Orders</a>
				<a  href="deliveredOrders.jsp">Delivered Orders</a>
				<a   href="logOut.jsp">Log Out</a>
			
	</div>

</body>
</html>