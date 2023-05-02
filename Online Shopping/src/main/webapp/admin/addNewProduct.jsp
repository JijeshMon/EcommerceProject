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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/addNewProduct.css">
</head>
<body>

	<%
	
	String msg=request.getParameter("msg");
	if("valid".equals(msg)){%>
		<h3 style="color: green; text-align: center;">Product added successfully!</h3>
	<%}else if("invalid".equals(msg)){%>
		
		<h3 style="color: red; text-align: center;">Sorry something went wrong!</h3>
	<%}
	int id = 1;

	try {
		Connection con = ConnectionProvider.getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select max(id) from product_table");
		while (st.next()) {
			id = st.getInt(1);
			id = id + 1;
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
<h3 >Product ID:<%out.println(id); %></h3>


<form action="addNewProductAction.jsp" method="post">
<div class="container">
<table> 
<tr>
<th>Enter Name</th>
<th>Enter Category</th>
</tr>
<tr>
<td><input type="text" placeholder="Enter Product Name" name="pname"></td>
<td><input type="text" placeholder="Enter Category" name="pcategory"></td>
</tr>
<tr>
<th>Enter Price</th>
<th>Active</th>
</tr>
<tr>
<td><input  type="text" placeholder="Enter Price" name="price"></td>
<td><select  name="pactive">
<option value="yes">yes</option>
<option value="no">no</option>
</select></td>
</tr>
</table>
<button id="btn">Save</button>
</div>
</form>



</body>
</html>