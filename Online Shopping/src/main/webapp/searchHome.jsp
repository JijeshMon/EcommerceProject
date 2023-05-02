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
<link rel="stylesheet" href="css/allProductEditProduct.css">
<link rel="stylesheet" href="css/home.css">
</head>
<body>

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
	String search = request.getParameter("searchBox");
	int z = 0;
	try {
		Connection con = ConnectionProvider.getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select * from product_table where name like '%" + search
		+ "%' or category like '%" + search + "%' and active like 'yes'  ");
		while (st.next()) {
			z = 1;
	%>
	<tr>
		<td><%=st.getInt(1)%></td>
		<td><%=st.getString(2) %></td>
		<td><%=st.getString(3) %></td>
		<td><%=st.getString(4) %></td>
		<td><a href="myCart.jsp?id=<%=st.getInt(1)%>">Add to Cart</a></td>
	</tr>
	<%}%> 
	
		<%if(z==0) {%>
		<h2 style="font-size: 20px;position: relative;top: 200px;text-align: center; opacity: .5">Nothing to show</h2>
		<%}
		
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html>