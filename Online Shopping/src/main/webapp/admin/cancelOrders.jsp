<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="adminheader.jsp"%>
<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/background.css">
<link rel="stylesheet" href="../css/cancelOrders.css">

</head>
<body>
	<div class="container">
		<%
		int z = 0;
		int count = 1;
		Connection con = null;
		try {
			con=new ConnectionProvider().getConnection();
			Statement stmt = con.createStatement();
			ResultSet st = stmt.executeQuery("select * from cancel_order_table");
			while (st.next()) {
				z = 1;
		%>
		<table>
			<caption>
				Cancelled Order_No:
				<%=count%></caption>
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
				<th>Status</th>
			</tr>
			<tr>
				<td><%=st.getString(1)%></td>
				<td><%=st.getInt(2)%></td>
				<td><%=st.getString(3)%></td>
				<td><%=st.getInt(4)%></td>
				<td><%=st.getInt(5)%></td>
				<td><%=st.getInt(6)%></td>
				<td><%=st.getString(7)%></td>
				<td><%=st.getString(8)%></td>
				<td><%=st.getString(9)%></td>
				<td><%=st.getString(10)%></td>
			</tr>
		</table>
		<%
		count++;
		}
		} catch (Exception e) {
		System.out.println(e);
		} finally {
		if (con != null)
		con.close();
		}
		%>


	</div>


</body>
</html>