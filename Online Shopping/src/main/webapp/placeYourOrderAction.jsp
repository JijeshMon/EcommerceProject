<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="userHeader.jsp"%>
<%@ include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/allProductEditProduct.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String mailId = session.getAttribute("email").toString();
	String pId = request.getParameter("id");
	int id=Integer.parseInt(pId);
	
	String name=request.getParameter("name");
	String mobNum=request.getParameter("mobNum");
	String address=request.getParameter("address");
	String city=request.getParameter("city");
	String state=request.getParameter("state");
	String country=request.getParameter("country");
	
// 	LocalDate currentDate = LocalDate.now();
// 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
// 	String orderDate= currentDate.format(formatter);
	
	Date currentDate2 = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
    String orderDate = dateFormat.format(currentDate2);
	
	
	Connection con=new ConnectionProvider().getConnection();
	PreparedStatement pstmt=con.prepareStatement("update user_table set name=?,mobileNumber=?,address=?,city=?,state=?,country=? where email='"+mailId+"' ");
	pstmt.setString(1, name);
	pstmt.setString(2, mobNum);
	pstmt.setString(3, address);
	pstmt.setString(4, city);
	pstmt.setString(5, state);
	pstmt.setString(6, country);
	int status=pstmt.executeUpdate();
	
	PreparedStatement pstmt2=con.prepareStatement("update cart_table set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=? where email=? and product_id=?");
	pstmt2.setString(1, address);
	pstmt2.setString(2, city);
	pstmt2.setString(3, state);
	pstmt2.setString(4, country);
	pstmt2.setString(5, mobNum);
	pstmt2.setString(6, orderDate);
	pstmt2.setString(7, mailId);
	pstmt2.setInt(8, id);
	int status2=pstmt2.executeUpdate();
	
	
	
	
	if(status>0 && status2>0){
		response.sendRedirect("home.jsp?msg=done");
	}else{
		response.sendRedirect("home.jsp?msg=invalid");
	}
	
	%>

</body>
</html>