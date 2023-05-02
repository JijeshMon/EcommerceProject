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
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/background.css">
<title>Insert title here</title>

</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("exist".equals(msg)) {
	%>
	<h3 style="color: yellow; position: relative;left:45%;">Product already exist in your cart!
		Quantity increased!</h3>

	<%
	} else if ("added".equals(msg)) {
	%>
	<h3 style="color: green; position: relative;left:45%;">Product Added Successfully!</h3>
	<%
	} else if ("changed".equals(msg)) {
	%>
	<h3 style="color: green; position: relative;left:45%;">User details changed Successfully!</h3>
	<%
	} else if ("done".equals(msg)) {
	%>
	<h3 style="color: green; position: relative;left:45%;">Your Order success!</h3>
	<%
	} else if ("invalid".equals(msg)) {
	%>
	<h3 style="color: red; position: relative;left:45%;">Something went wrong try again!</h3>
	<%
	}
	%>
	<div class="container">
		<table>
			<caption>Home</caption>
			<tr>
				<th>ID</th>
				<th>PRODUCT_NAME</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>ADD TO CART</th>
			</tr>
			<%
			Connection con = ConnectionProvider.getConnection();
			Statement stmt = con.createStatement();
			ResultSet st = stmt.executeQuery("select * from product_table where active='yes'");
			while (st.next()) {
			%>
			<tr>
				<td><%=st.getInt(1)%></td>
				<td><%=st.getString(2)%></td>
				<td><%=st.getString(3)%></td>
				<td>Rs <%=st.getInt(4)%></td>
				<td><a href="myCart.jsp?id=<%=st.getInt(1)%>">Add to Cart</a></td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
</body>
</html>