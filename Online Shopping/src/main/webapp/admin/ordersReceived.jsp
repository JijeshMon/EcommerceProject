<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
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
<link rel="stylesheet" href="../css/ordersReceived.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<div class="container">
<%
String message=request.getParameter("msg");
if("updated".equals(message)){%>
	<h3 style="color: green; position: relative; left: 45%;">Current Status Updated</h3>
<% }

else
	if("invalid".equals(message)){%>
	<h3 style="color: red; position: relative; left: 45%;">Something went wrong please try again!</h3>
<% }
int count=1;
Date currentDate3 = new Date();
SimpleDateFormat dateFormat3 = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
String currentDate = dateFormat3.format(currentDate3);

Connection con=new ConnectionProvider().getConnection();
Statement stmt=con.createStatement();
ResultSet st= stmt.executeQuery("select * from cart_table where deliveryDate is null && orderDate is not null");

int z=0;
while(st.next())
{
	String status=st.getString(14);
	z=1;
%>
	
	<table>
	<caption>Order_No: <%=count %></caption>
	<tr>
	<th>Email_ID</th>
	<th>Product_Id</th>
	<th>Product_Name</th>
	<th>Quantity</th>
	<th>Price</th>
	<th>Total</th>
	<th>Address</th>
	<th>MobileNumber</th>
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
	<td><%=st.getString(12)  %></td>
	<td><%=st.getString(13)  %></td>
	<td>
	<form action="status_updation.jsp?id=<%=st.getString(1)%>&date=<%=st.getString(12)%>" method="post">
	<select name="status-select">
	<option><%=st.getString(14)  %></option>
	<option>Product Packed</option>
	<option>Product Shipped</option>
	<option>Product Delivered</option>
	</select></td>
	</tr>
	</table>
	<input type="submit" style="position: absolute;left: 30%;  width:500px;" value="Update Current Status">
	</form>
	<br>

<%count++;
}
if(z==0){%>
	
	<h3 style="color: red; position: absolute; left: 45%;">Currently
			 no Order received</h3>
	
<%}
%>

</div>
</body>
</html>