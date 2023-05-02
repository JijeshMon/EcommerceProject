<%@page import="java.sql.PreparedStatement"%>
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
	String mId=session.getAttribute("email").toString();
	String pId=request.getParameter("id");
	int prodId=Integer.parseInt(pId);
	String emId="";
	int proId=0;
	String pName="";
	int qnty=0;
	int pric=0;
	int tot=0;
	String addrs="";
	String mobileNum="0";
	String ordDate="0";
	String stat="";
	try{
	Connection con=new ConnectionProvider().getConnection();
	Statement stmt=con.createStatement();
	 ResultSet st=stmt.executeQuery("select * from cart_table where email='"+mId+"' and product_id='"+prodId+"'");
	while(st.next())
	{
		emId = st.getString(1);
		proId= st.getInt(2);
		System.out.println(st.getInt(2));
		pName=st.getString(3);
		System.out.println(st.getString(3));
		pric=st.getInt(5);
		tot=st.getInt(6);
		addrs=st.getString(7);
		System.out.println(st.getString(7));
		mobileNum=st.getString(11);
		ordDate=st.getString(12);
		stat=st.getString(14);
	}
		System.out.println(proId);
		System.out.println(addrs);
		if(stat!="delivered"){
		PreparedStatement pstmt=con.prepareStatement("insert into cancel_order_table (email,product_id,product_name,quantity,price,total,address,mobile_number,orderDate,status) values(?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, emId);
		pstmt.setInt(2, proId);
		pstmt.setString(3, pName);
		pstmt.setInt(4, qnty);
		pstmt.setInt(5, pric);
		pstmt.setInt(6, tot);
		pstmt.setString(7, addrs);
		pstmt.setString(8, mobileNum);
		pstmt.setString(9, ordDate);
		pstmt.setString(10, stat);
		int status=pstmt.executeUpdate();
		
		if(status>0)
		{
			Statement stmtD=con.createStatement();
			stmtD.executeUpdate("delete from cart_table where email='"+mId+"' and  product_id='"+pId+"' && orderDate is not null");
			response.sendRedirect("userOrders.jsp?msg=cancelled");
		}
		}
	}
	catch(Exception e)
	{
		
		System.out.println(e);
	}
	
	if(stat=="delivered")
	{
		response.sendRedirect("userOrders.jsp?msg=delivered");
		
	}
		
	
%>


</body>
</html>