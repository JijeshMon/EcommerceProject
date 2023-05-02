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
<link rel="stylesheet" type="text/css" href="../css/editProduct.css">


</head>
<body>
	<%
	String sId = request.getParameter("id");
	int id = Integer.parseInt(sId);
	String pname = "";
	String pcategory = "";
	int price=0;
	String pactive = "";

	 

	try {
	Connection con = ConnectionProvider.getConnection();
	Statement stmt = con.createStatement();
	ResultSet st = stmt.executeQuery("select * from product_table where id='"+id+"'");
	while (st.next()) {
		
		pname=st.getString(2);
		pcategory=st.getString(3);
		price=st.getInt(4);
		pactive=st.getString(5);
		
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
	<h3 style="text-align: center;color: gray;">
		Product ID:<%=sId%></h3>


	<form action="editProductAction.jsp?id=<%=id %>" method="post">
		<div class="container">
			<table>
				<tr>
					<th>Enter Name</th>
					<th>Enter Category</th>
				</tr>
				<tr>
					<td><input
						
						type="text" placeholder="Enter Product Name" name="pname" value="<%=pname%>"></td>
					<td><input
						
						type="text" placeholder="Enter Category" name="pcategory" value="<%=pcategory%>"></td>
				</tr>
				<tr>
					<th>Enter Price</th>
					<th>Active</th>
				</tr>
				<tr>
					<td><input	type="text" placeholder="Enter Price" name="price" value="<%=price%>" ></td>
					<td><select	name="pactive">
						<%if("yes".equals(pactive)){ %>
							<option selected="selected"  value="yes">yes</option>
							<option   value="no">no</option>
							<%}
							 else if("no".equals(pactive)){ %>
							 <option   value="yes">yes</option>
							<option selected="selected"  value="no">no</option>
							<%}%>
					</select></td>
				</tr>
			</table>
			<button id="btn">Edit and Save</button>
		</div>
	</form>


</body>
</html>