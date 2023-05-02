<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
	<%
	String mail = request.getParameter("id");
	String userMsg = "";
	System.out.println("Insert before user mail "+mail);
	String adminMsg = request.getParameter("adminMessage");
	String adminMail="admin@inmakes.com";
	Connection con = new ConnectionProvider().getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement pstmt=con.prepareStatement("insert into message_table (admin_emaiID,admin_Message,user_emaiID,user_Message) values (?,?,?,?) ");
	pstmt.setString(1, adminMail);
	pstmt.setString(2, adminMsg);
	pstmt.setString(3, mail);
	pstmt.setString(4, userMsg);
	int status=pstmt.executeUpdate();
	if(status>0){
		response.sendRedirect("messagesInbox.jsp?eId="+mail);
	}else {
		response.sendRedirect("messagesInbox.jsp?eId="+mail);
	}
	%>
