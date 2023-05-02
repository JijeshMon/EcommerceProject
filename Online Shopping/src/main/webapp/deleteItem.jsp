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
	String email = session.getAttribute("email").toString();
	String pIds = request.getParameter("pId");
	int pId = Integer.parseInt(pIds);
	int quantity = 0;
	int price=0;
	int total=0;
	int z = 0;
	try {
		Connection con = new ConnectionProvider().getConnection();
		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select * from cart_table where product_id='" + pId + "' && orderDate is  null");
		while (st.next()) {
			quantity = st.getInt(4);
			price=st.getInt(5);
			total=st.getInt(6);
			total=total-price;
					
			if (quantity > 1) {
		z = 1;

			} else if (quantity < 1) {
		z = 0;

			}
		}
		if (z == 1) {
			stmt.executeUpdate("update cart_table set quantity='" + --quantity + "',total='"+total+"' where product_id='" + pId + "' && orderDate is null");
			response.sendRedirect("myCartView.jsp?email="+email);
		} else if (z == 0) {
			stmt.executeUpdate("delete from cart_table where product_id='" + pId + "' && orderDate is  null");
			response.sendRedirect("myCartView.jsp?email="+email);
		}

	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("myCartView.jsp?email='email'");
	}
	%>


</body>
</html>