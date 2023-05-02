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
<link rel="stylesheet" type="text/css" href="css/myCartview.css">
<link rel="stylesheet" type="text/css" href="css/background.css">
</head>
<body>
<div class="container">
<table>
<caption>My Cart</caption>
<tr>
<th>Product_Id</th>
<th>Product_Name</th>
<th>Quantity</th>
<th>Price</th>
<th>Total</th>
<th colspan="2">Action</th>
</tr>


<% 
	int z=0;
	String emailC=request.getParameter("email");
	System.out.println(emailC);
	Connection con= new ConnectionProvider().getConnection();
	Statement stmt=con.createStatement();
	ResultSet st= stmt.executeQuery("select * from cart_table where email='"+emailC+"'");
	while(st.next()){%>
	<% z=1;%>
	<tr>
		<td><%=st.getInt(2) %></td>
		<td><%=st.getString(3) %></td>
		<td><%=st.getInt(4) %></td>
		<td><%=st.getInt(5) %></td>
		<td><%=st.getInt(6) %></td>
		<%
		String ordDate=st.getString(12);
		if(ordDate==null){
		%>
		<td><a href="buyItem.jsp?pId=<%=st.getInt(2)%>">Buy</a></td>
		<td><a href="deleteItem.jsp?pId=<%=st.getInt(2)%>">Remove From Cart</a></td>
		<%}else
		{%>
		<td colspan="2">Product has ordered on <%=st.getString(12) %> </td>			
		<% }%>
	</tr>
	<%}
	if(z==0){%>
	<tr>
	<th colspan="6">
	<h3 style="color: red">Nothing to show you!</h3>
	</th>
	</tr>
		<%}%>
</table>
</div>
</body>
</html>