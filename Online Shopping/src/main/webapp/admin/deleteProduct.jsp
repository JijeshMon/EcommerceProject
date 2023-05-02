<%@page import="java.sql.Statement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String sId = request.getParameter("id");
	int id = Integer.parseInt(sId);
	int status = 0;
	try {
		Connection con = ConnectionProvider.getConnection();
		Statement stmt = con.createStatement();
		status = stmt.executeUpdate("delete from product_table where id='" + id + "'");
		if (status > 0) {
			response.sendRedirect("allProductEditProduct.jsp?msg=deleted");
		} else {
			response.sendRedirect("allProductEditProduct.jsp?msg=invalid");
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>