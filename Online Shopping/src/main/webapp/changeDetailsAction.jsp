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
	String eID=session.getAttribute("email").toString();
	String userName=request.getParameter("uname");
	String mobNum=request.getParameter("mob");
	String question=request.getParameter("quest");
	String answer=request.getParameter("ans");
	String address=request.getParameter("addr");
	String city=request.getParameter("cit");
	String state=request.getParameter("stat");
	String country=request.getParameter("coun");
	
	Connection con=new ConnectionProvider().getConnection();
	PreparedStatement pstmt=con.prepareStatement("update user_table set name=?, mobileNumber=?, securityQuestion=?, answer=?,address=?, city=?,state=?,country=? where email=?");
	pstmt.setString(1, userName);
	pstmt.setString(2, mobNum);
	pstmt.setString(3, question);
	pstmt.setString(4, answer);
	pstmt.setString(5, address);
	pstmt.setString(6, city);
	pstmt.setString(7, state);
	pstmt.setString(8, country);
	pstmt.setString(9, eID);
	int status=pstmt.executeUpdate();
	if(status>0)
	{
		response.sendRedirect("home.jsp?msg=changed");
		
	}
	else 
	{
		response.sendRedirect("home.jsp?msg=invalid");
		
	}
%>


</body>
</html>