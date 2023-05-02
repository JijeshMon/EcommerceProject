<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conection.ConnectionProvider"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "";
String country = "";
System.out.println(name);
System.out.println(email);
System.out.println(mobileNumber);
System.out.println(securityQuestion);
System.out.println(answer);
System.out.println(password);
System.out.println(address);
System.out.println(city);
System.out.println(state);
System.out.println(country);
try {
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement stmt = con.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?,?,?)");
	stmt.setString(1, name);
	stmt.setString(2, email);
	stmt.setString(3, mobileNumber);
	stmt.setString(4, securityQuestion);
	stmt.setString(5, answer);
	stmt.setString(6, password);
	stmt.setString(7, address);
	stmt.setString(8, city);
	stmt.setString(9, state);
	stmt.setString(10, country);
	int status = stmt.executeUpdate();
	if (status > 0) {
		response.sendRedirect("signup.jsp?msg=valid");
	} else {
		response.sendRedirect("signup.jsp?msg=invalid");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>


