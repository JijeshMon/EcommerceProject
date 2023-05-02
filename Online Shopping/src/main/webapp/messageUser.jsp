<%@page import="java.sql.PreparedStatement"%>
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
<link rel="stylesheet" type="text/css" href="css/messageUser.css">
<link rel="stylesheet" type="text/css" href="css/background.css">
<title>Insert title here</title>
</head>
<body>
<marquee>Customer care Support of J Cart</marquee>
<div class="chat-container" id="chat-div">
<%
String mailId =request.getParameter("mail");
String adm="admin@inmakes.com";
System.out.println("Message User started");
Connection con=new ConnectionProvider().getConnection();
Statement stmt=con.createStatement();
ResultSet st= stmt.executeQuery("select * from message_table where  user_emaiID='"+mailId+"' and admin_emaiID='"+adm+"' ");
while(st.next()){%>
<div class="chat-box" id="ch-box">

	<% 
	System.out.println("div started");
	String adMsg=st.getString("admin_Message");
		String usMsg=st.getString("user_Message");
	System.out.println(adMsg);
	System.out.println(adMsg);
	System.out.println(st.getString(1));
	System.out.println(st.getString(2));
	System.out.println(st.getString(3));
	System.out.println(st.getString(4));
	%>
	<p id="admin-msg" ><%=st.getString(2)%></p><br>
	<p id="user-msg"><%=st.getString(4) %></p><br>
	</div>
<%}%>

</div>
<div class="chat-field">
<form  action="message_User_Action.jsp?id=<%=mailId%>"method="post">
<input type="text" id="user-message-field" name="usermessage" placeholder="Type a message" "  ><button type="submit" id="button"   class="sub"></button>
</form>
</div>
<div class="bg">

<img alt="" src="images/customer service.png" width="500px">
</div>
</body>
</html>