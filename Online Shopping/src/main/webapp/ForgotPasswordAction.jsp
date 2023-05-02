<%@page import="java.sql.ResultSet"%>
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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String mobileNumber = request.getParameter("mobileNumber");
	String securityQuestion = request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String newpassword = request.getParameter("newpassword");

	int z = 0;
try{
	Connection con = ConnectionProvider.getConnection();
	Statement stmt = con.createStatement();
	ResultSet st = stmt
			.executeQuery("select * from user_table where name='" + name + "' and email='" + email + "' and mobileNumber='"
			+ mobileNumber + "' and securityQuestion='" + securityQuestion + "' and answer='" + answer + "'");
	while(st.next()){
		z=1;
		stmt.executeUpdate("update user_table set password='"+newpassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");		
	}if(z==0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e){
	System.out.println(e);
}
	%>


</body>
</html>