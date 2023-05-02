<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	String mId = request.getParameter("id");
	String ordDate = request.getParameter("date");
	String status = request.getParameter("status-select");
	System.out.println(status);

	Date currentDate3 = new Date();
	SimpleDateFormat dateFormat3 = new SimpleDateFormat("dd/MM/yyyy 'at' HH:mm:ss");
	String currentDate = dateFormat3.format(currentDate3);
	System.out.println("Before" + currentDate);

	Connection con = new ConnectionProvider().getConnection();
	if ("Product Delivered".equals(status)) {

		PreparedStatement pstmt = con
		.prepareStatement("update cart_table set status=? , deliveryDate=? where email=? and orderDate=?");
		pstmt.setString(1, status);
		pstmt.setString(2, currentDate);
		pstmt.setString(3, mId);
		pstmt.setString(4, ordDate);
		int note = pstmt.executeUpdate();
		if (note > 0) {
			response.sendRedirect("ordersReceived.jsp?msg=updated");
		} else {
			{
		response.sendRedirect("ordersReceived.jsp?msg=invalid");
			}
		}

	} else {
		PreparedStatement pstmt1 = con.prepareStatement("update cart_table set status=?  where email=? and orderDate=?");
		pstmt1.setString(1, status);
		pstmt1.setString(2, mId);
		pstmt1.setString(3, ordDate);
		int note = pstmt1.executeUpdate();
		if (note > 0) {
			response.sendRedirect("ordersReceived.jsp?msg=updated");
		} else {
			{
		response.sendRedirect("ordersReceived.jsp?msg=invalid");
			}
		}
	}
	%>


</body>
</html>