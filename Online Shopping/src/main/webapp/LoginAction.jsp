<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if ("admin@inmakes.com".equals(email) && "admin".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
} else {
	int z = 0;
	try {
		Connection con = ConnectionProvider.getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt
		.executeQuery("select * from user_table where email='" + email + "' && password='" + password + "'");
		while (st.next()) {
	z = 1;
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
		}
		if (z == 0)
	response.sendRedirect("Login.jsp?msg=notexist");
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("Login.jsp?msg=invalid");
	}
}
%>