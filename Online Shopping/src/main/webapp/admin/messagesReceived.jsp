<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@ include file="adminheader.jsp"%>
<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/messageReceived.css">
<link rel="stylesheet" href="../css/background.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title	>
</head>
<body>
<marquee>Customer care Support of J Cart</marquee>
<div class="container">
<%
Connection con=new ConnectionProvider().getConnection();
Statement stmt=con.createStatement();
ResultSet st= stmt.executeQuery("select distinct user_emaiID from message_table");

while(st.next()){%>
    <form action="messagesInbox.jsp?emId=<%=st.getString(1) %>" method="post">
	<p>Messages from: <a href="messagesInbox.jsp?eId=<%=st.getString(1)%>"><%=st.getString(1)%></a>*</p>
</form>
<%}%>
</div>
</body>
</html>