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
<link rel="stylesheet" href="../css/background.css">
<link rel="stylesheet" href="../css/all_Product.css">

</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 style="color: green; text-align: center;">Product details
		edited successfully!</h3>
	<%
	} else if ("invalid".equals(msg)) {
	%>

	<h3 style="color: red; text-align: center;">Sorry something went
		wrong!</h3>
	<%
	} else if ("deleted".equals(msg)) {
	%>
	<h3 style="color: green; text-align: center;">Product deleted
		successfully!</h3>
	<%
	}
	%>
	<div class="container">
		<table>
			<caption>Add and Edit Product Details</caption>
			<tr>
				<th>Product_ID</th>
				<th>Product_Name</th>
				<th>Product_Category</th>
				<th>Product_Price</th>
				<th>Product_Active</th>
				<th colspan="2">Product_Edit/Delete</th>
			</tr>

			<%
			try {
				Connection con = ConnectionProvider.getConnection();
				Statement stmt = con.createStatement();
				ResultSet st = stmt.executeQuery("select * from product_table");

				while (st.next()) {
			%>
			<tr>
				<td>
					<%
					out.print(st.getInt(1));
					%>
				</td>
				<td>
					<%
					out.print(st.getString(2));
					%>
				</td>
				<td>
					<%
					out.print(st.getString(3));
					%>
				</td>
				<td>
					<%
					out.print(st.getString(4));
					%>
				</td>
				<td>
					<%
					out.print(st.getString(5));
					%>
				</td>
				<td><a href="editProduct.jsp?id=<%=st.getInt(1)%>">Edit</a></td>
				<td><a href="deleteProduct.jsp?id=<%=st.getInt(1)%>">Delete</a></td>
			</tr>
			<%
			}

			} catch (Exception e) {
			System.out.println(e);
			}
			%>

		</table>
	</div>
</body>
</html>