<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
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
	String sId = request.getParameter("id");
	int id = Integer.parseInt(sId);
	System.out.println(id);
	String name="";
	String status="pending";
	int quantity = 1;
	int product_price = 0;
	int product_total = 0;
	int cart_total = 0;
	int z = 0;
	try {
		Connection con = ConnectionProvider.getConnection();

		Statement stmt = con.createStatement();
		ResultSet st = stmt.executeQuery("select * from product_table where id='" + id + "'");
		while (st.next()) {
			product_price = st.getInt(4);
			name=st.getString(2);
			product_total = product_price;
		}
		ResultSet st1 = stmt.executeQuery(
		"select * from cart_table where product_id='" + id + "' and email='" + email + "' and address is null ");
		while (st1.next()) {
			cart_total = st1.getInt(6);
			cart_total = cart_total + product_total;
			quantity = st1.getInt(4);
			quantity = quantity + 1;
			z = 1;
		}
		if (z == 1) {
			stmt.executeUpdate("update  cart_table set total='" + cart_total + "', quantity='" + quantity
			+ "' where product_id='" + id + "' and email='" + email + "' and orderDate is null");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if (z == 0) {
			PreparedStatement pstmt = con
			.prepareStatement("insert into cart_table(email,product_id,name,quantity,price,total,status) values(?,?,?,?,?,?,?)");
			pstmt.setString(1, email);
			pstmt.setInt(2, id);
			pstmt.setString(3,name);
			pstmt.setInt(4, quantity);
			pstmt.setInt(5, product_price);
			pstmt.setInt(6, product_total);
			pstmt.setString(7,status);
			pstmt.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("home.jsp?msg=invalid");
	}
	%>

</body>
</html>