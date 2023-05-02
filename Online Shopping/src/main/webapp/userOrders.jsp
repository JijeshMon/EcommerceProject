<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="userHeader.jsp"%>
<%@ include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/userOrder.css">
<link rel="stylesheet" type="text/css" href="css/background.css">
</head>
<body>
	<%
	String message = request.getParameter("msg");
	if ("delivered".equals(message)) {
	%>
	<h3 style="color: red; position: relative; left: 45%;">Product has
		already delivered</h3>
	<%
	}
	%>

	<%
	if ("cancelled".equals(message)) {
	%>
	<h3 style="color: red; position: relative; left: 45%;">Order
		cancelled</h3>
	<%
	}int count=1;
	%>


	<div class="container">


		<%
		String emailId = session.getAttribute("email").toString();
		int z = 0;

		try{
		Connection con = new ConnectionProvider().getConnection();
		
		
		
		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select * from cart_table where email='" + emailId + "' && orderDate is not null ");
		while (st.next()) 
		{
			
			
		%>
		
		<table>
			<caption>My Order No:<%= count %></caption>
			
			<tr>
				<th>Product_Id</th>
				<th>Product_Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Total_Price</th>
				<th>Delivered_Address</th>
				<th>Contact Number</th>
				<th>Order_Date</th>
				<th>Delivery_Date</th>
				<th>Status</th>
				<th>Cancel Order</th>

			</tr>
			<tr>
				<th><%=st.getInt(2)%></th>
				<th><%=st.getString(3)%></th>
				<th><%=st.getInt(4)%></th>
				<th><%=st.getInt(5)%></th>
				<th><%=st.getInt(6)%></th>
				<th><%=st.getString(7)%></th>
				<th><%=st.getString(11)%></th>
				<th><%=st.getString(12)%></th>
				<th><%=st.getString(13)%></th>
				<th><%=st.getString(14)%></th>
				<th><a href="cancelOrderAction.jsp?id=<%=st.getInt(2)%>">Cancel Order</a></th>
			</tr>
			<%
			count++;
			z = 1;
			%>
			<%
			}
			%>
		</table>
		<%
		if (z == 0) {
		%>
		<h3 style="color: red; position: absolute; left: 45%;">Currently
			you have no Order</h3>
		<%
		}
		
		Statement stmtD = con.createStatement();
		int numDeleted = stmtD.executeUpdate("delete from cart_table where deliveryDate < date_sub(now(), interval 1 hour) and deliveryDate = '" + st.getString(12) + "'");
		
		
		
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}

		
		
		
		%>
	</div>
</body>
</html>