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
<link rel="stylesheet" href="css/allProductEditProduct.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
background-image: url("images/bg.jpg");

}
table, th, td {
	background-color: white;
	border-color: gray;
}


</style>
</head>
<body>

	<%
	String emailId = session.getAttribute("email").toString();
	String pIds = request.getParameter("pId");
	int pId = Integer.parseInt(pIds);
	try {
		Connection con = new ConnectionProvider().getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt
		.executeQuery("select * from cart_table where product_id='" + pId + "' and email='" + emailId + "' && orderDate is null");
		while (st.next()) {
	%>
	<form action="placeYourOrder.jsp?pId=<%=pIds %>" method="post">
		<table style="width: 50%; position: relative; left: 20%;">
			<caption>Buy Your Product</caption>
			<tr>
				<th style="text-align: left;">Product_Id</th>
				<td style="text-align: center;"><%=st.getInt(2)%></td>
			</tr>
			<tr>
				<th style="text-align: left;">Product_Name</th>
				<td style="text-align: center;"><%=st.getString(3)%></td>
			</tr>
			<tr>
				<th style="text-align: left;">Product_Quantity</th>
				<td style="text-align: center;"><%=st.getInt(4)%></td>
			</tr>
			<tr>
				<th style="text-align: left;">Product_Price</th>
				<td style="text-align: center;"><%=st.getInt(5)%></td>
			</tr>
			<tr>
				<th style="text-align: left;">Total</th>
				<td style="text-align: center;"><%=st.getInt(6)%></td>
			</tr>
		</table>

		<button type="submit" value="Place Your Order"
			style="position: relative; left: 62%; top: 30px; background-color: #F7A200; color: yellow; border: none; cursor: pointer; height: 30px; font-size: 15px; border-radius: 10px"
			onmouseover="this.style.backgroundColor='green';this.style.color='white';this.style.fontSize='20px'"
			onmouseleave="this.style.backgroundColor='#F7A200';this.style.color='yellow';this.style.fontSize='15px'">Place Your Order</button>

	</form>
	<button type="submit" value="Cancel Your Order"
		style="position: relative; left: 20%; background-color: #F7A200; color: yellow; border: none; cursor: pointer; height: 30px; font-size: 15px; border-radius: 10px"
		onmouseover="this.style.backgroundColor='red';this.style.color='white';this.style.fontSize='20px'"
		onmouseleave="this.style.backgroundColor='#F7A200';this.style.color='yellow';this.style.fontSize='15px'"
		onclick="goBack()">Back to Cart</button>
	<script>
      function goBack() {
        var email = '<%=emailId%>';
		window.location.href = "myCartView.jsp?email="+ encodeURIComponent(email);
		}
	</script>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>


</body>
</html>