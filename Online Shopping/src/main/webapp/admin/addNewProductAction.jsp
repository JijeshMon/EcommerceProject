<%@page import="java.sql.PreparedStatement"%>
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
	String pname = request.getParameter("pname");
	String pcategory = request.getParameter("pcategory");
	String sPrice = request.getParameter("price");
	int price = Integer.parseInt(sPrice);
	String pactive = request.getParameter("pactive");
	
	
	int status = 0;
	try{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement stmt = con.prepareStatement("insert into product_table(name,category,price,active) values(?,?,?,?)");
	stmt.setString(1, pname);
	stmt.setString(2, pcategory);
	stmt.setInt(3, price);
	stmt.setString(4, pactive);
	status = stmt.executeUpdate();
	}
	catch(Exception e){
		System.out.println(e);
	}
	if(status>0){
		response.sendRedirect("addNewProduct.jsp?msg=valid");
	}else{
		response.sendRedirect("addNewProduct.jsp?msg=invalid");
	}
	%>
</body>
</html>