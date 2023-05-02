<%@page import="java.sql.PreparedStatement"%>
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
<link rel="stylesheet" href="../css/adminHome.css">
</head>
<body>
	<%
	String sId = request.getParameter("id");
	int id = Integer.parseInt(sId);
	System.out.println(id);
	String pname = request.getParameter("pname");
	System.out.println(pname);
	String pcategory = request.getParameter("pcategory");
	String sPrice = request.getParameter("price");
	int price = Integer.parseInt(sPrice);
	String pactive = request.getParameter("pactive");
	
	int status=0;
	try{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement stmt = con
			.prepareStatement("update product_table set name=?,category=?,price=?,active=? where id=? ");
	
	stmt.setString(1, pname);
	stmt.setString(2, pcategory);
	stmt.setInt(3, price);
	stmt.setString(4, pactive);
	stmt.setInt(5, id);
	status=stmt.executeUpdate();
	// Delete from cart
// 	if(pactive.equals("no")){
		
// 		stmt.executeUpdate("delete product_table where id='"+id+"'");
// 	}
	if(status>0){
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
	}else {
		response.sendRedirect("allProductEditProduct.jsp?msg=invalid");
	}
	}
	catch(Exception e){
		System.out.println(e);
	}
	%>
</body>
</html>