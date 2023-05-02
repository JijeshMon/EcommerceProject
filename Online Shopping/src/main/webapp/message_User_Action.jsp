<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
	<%
	String mailId = session.getAttribute("email").toString();
	String userMsg = request.getParameter("usermessage");
	String adminMsg = "";
	String adminMail="admin@inmakes.com";
	Connection con = new ConnectionProvider().getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement pstmt=con.prepareStatement("insert into message_table (admin_emaiID,admin_Message,user_emaiID,user_Message) values (?,?,?,?) ");
	pstmt.setString(1, adminMail);
	pstmt.setString(2, adminMsg);
	pstmt.setString(3, mailId);
	pstmt.setString(4, userMsg);
	int status=pstmt.executeUpdate();
	if(status>0){
		response.sendRedirect("messageUser.jsp?mail="+mailId);
	}else {
		response.sendRedirect("messageUser.jsp?mail="+mailId);
	}
	%>
