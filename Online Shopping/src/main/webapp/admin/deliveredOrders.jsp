<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="adminheader.jsp"%>
<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/background.css">
<link rel="stylesheet" href="../css/deliveredOrders.css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%
	int z=0;
	int count=1;
	Connection con = null;
	try {
		con = new ConnectionProvider().getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select * from cart_table where deliveryDate is not null");
		while(st.next())
		{
			z=1;
		%>
			<table>
			<caption>Delivered Order_Num: <%=count %></caption>
			<tr>
				<th>Email_Id</th>
				<th>Product_Id</th>
				<th>Product_Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Total</th>
				<th>Address</th>
				<th>Mobile_Number</th>
				<th>Order_Date</th>
				<th>Delivery_Date</th>
				<th>Status</th>
			</tr>
			
			<tr>
				<td><%=st.getString(1) %></td>
				<td><%=st.getInt(2) %></td>
				<td><%=st.getString(3) %></td>
				<td><%=st.getInt(4)  %></td>
				<td><%=st.getInt(5) %></td>
				<td><%=st.getInt(6) %></td>
				<td><%=st.getString(7) %></td>
				<td><%=st.getString(11) %></td>
				<td><%=st.getString(12) %></td>
				<td><%=st.getString(13) %></td>
				<td><%=st.getString(14) %></td>
				
			</tr>
			
			
			
			</table>
			
		<% count++;
		
		}
		
		if(z==0){%>
			
			<h3 style="color: red; position: absolute; left: 45%;">Currently
			 no Order delivered</h3>
			
		<%}
		
	} catch (Exception e) {

		System.out.println(e);
	} finally {
		
		con.close();

	}
	%>
	</div>
</body>
</html>