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
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/allProductEditProduct.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 30%;
	float:left;
	position: relative;
	left: 10%;
}

</style>
</head>
<body>
	<%
	String mId = session.getAttribute("email").toString();
	String pId = request.getParameter("pId");
	int id = Integer.parseInt(pId);
	Connection con1 = new ConnectionProvider().getConnection();
	Statement stmt1 = con1.createStatement();
	ResultSet st1 = stmt1.executeQuery("select * from cart_table where product_id='" + pId + "' and email='" + mId + "' && orderDate is null");
	while (st1.next()) {
%>
	<table >
		<caption>Your Product</caption>
		<tr>
			<th >Product_Id</th>
			<td ><%=st1.getInt(2)%></td>
		</tr>
		<tr>
			<th >Product_Name</th>
			<td ><%=st1.getString(3)%></td>
		</tr>
		<tr>
			<th >Product_Quantity</th>
			<td ><%=st1.getInt(4)%></td>
		</tr>
		<tr>
			<th >Product_Price</th>
			<td ><%=st1.getInt(5)%></td>
		</tr>
		<tr>
			<th >Total</th>
			<td ><%=st1.getInt(6)%></td>
		</tr>
		<tr>
			<th style="color: purple; background-color: white;" colspan="2">Cash on delivery</th>
		</tr>
	</table>
	<% }
	Connection con2 = new ConnectionProvider().getConnection();
	Statement stmt2 = con2.createStatement();
	ResultSet st2 = stmt2.executeQuery("select * from user_table where email='" + mId + "'");
	while (st2.next()) {
	%>
	<form action="placeYourOrderAction.jsp?id=<%=pId%>" method="post">
		<table style="background-color: white;">
			<caption>Place Your Order</caption>
			<tr>
				<th>Name</th>
				<td><input type="text" value="<%=st2.getString(1)%>" name="name"></td>
				</tr>
				<tr>
				<th>MobileNumber</th>
				<td><input type="text" value="<%=st2.getLong(3)%>" name="mobNum"></td>
				</tr>
				<tr>
				<th>Address</th>
				<td><input type="text" value="<%=st2.getString(7)%>" name="address"></td>
				</tr>
				<tr>
				<th>City</th>
				<td><input type="text" value="<%=st2.getString(8)%>" name="city"></td>
				</tr>
				<tr>
				<th>State</th>
				<td><input type="text" value="<%=st2.getString(9)%>" name="state"></td>
				</tr>
				<tr>
				<th>Country</th>
				<td><input type="text" value="<%=st2.getString(10)%>" name="country"></td>
			</tr>
		</table>
		<button type="submit" value="Confirm"
			style="position: relative; left: 5px; top: 460px; background-color: #F7A200; color: yellow; border: none; cursor: pointer; height: 30px; font-size: 15px; border-radius: 10px"
			onmouseover="this.style.backgroundColor='green';this.style.color='white';this.style.fontSize='20px'"
			onmouseleave="this.style.backgroundColor='#F7A200';this.style.color='yellow';this.style.fontSize='15px'">Confirm</button>
			
		</form>
		<button type="submit" value="Cancel Your Order"
		style="position: relative; top:430px; right:160px; background-color: #F7A200; color: yellow; border: none; cursor: pointer; height: 30px; font-size: 15px; border-radius: 10px"
		onmouseover="this.style.backgroundColor='red';this.style.color='white';this.style.fontSize='20px'"
		onmouseleave="this.style.backgroundColor='#F7A200';this.style.color='yellow';this.style.fontSize='15px'"
		onclick="goBack()">Back to Cart</button>
	<script>
      function goBack() {
        var email = '<%=mId%>';
		window.location.href = "myCartView.jsp?email="+ encodeURIComponent(email);
		}
	</script>
	<%} %>


</div>
</body>
</html>