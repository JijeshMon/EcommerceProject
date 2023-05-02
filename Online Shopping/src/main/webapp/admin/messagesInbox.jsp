<%@page import="java.sql.PreparedStatement"%>
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
<script type="text/javascript">


</script>
<link rel="stylesheet" href="../css/admin_Message_inbox.css">
<link rel="stylesheet" href="../css/background.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="chat-container" id="chat-div">
<%
String adm="admin@inmakes.com";
String ei=request.getParameter("eId");

Connection con=new ConnectionProvider().getConnection();
Statement stmt=con.createStatement();
ResultSet st= stmt.executeQuery("select * from message_table where  user_emaiID='"+ei+"' and admin_emaiID='"+adm+"' ");
while(st.next()){%>
<div class="chat-box" id="ch-box">
	<p id="admin-msg" ><%=st.getString(2) %></p><br>
	<p id="user-msg"><%=st.getString(4) %></p><br>
	</div>
<%}%>


<%System.out.println("Passing user mail "+ei); %>

</div>
<div class="chat-field">
<form action="messagesReceivedAction.jsp?id=<%=ei %>" method="post">
  <input type="text" id="user-message-field" name="adminMessage" placeholder="Type a message">
  <button type="submit" id="button" class="sub"></button>
</form>

</div>
<div class="bg">

<img alt="" src="../images/customer service.png" width="500px">
</div>


</body>
</html>