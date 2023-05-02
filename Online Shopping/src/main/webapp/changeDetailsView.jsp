<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.conection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="userHeader.jsp"%>
<%@ include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/changeDetails.css">
<link rel="stylesheet" type="text/css" href="css/background.css">
<title>Insert title here</title>
</head>
<body>
<%
String eId=session.getAttribute("email").toString();
Connection con=new ConnectionProvider().getConnection();
Statement stmt=con.createStatement();
ResultSet st=stmt.executeQuery("select * from user_table where email='"+eId+"'");
%>
<form action="changeDetailsAction.jsp?id=<%=eId%>">

<% 
while(st.next())
{%>
	<table style="width: 50%; position: absolute;left: 20%">
		<caption>Change Personal Details</caption>
		<tr>
		<th>Email_Id</th>
		<th><label><%=st.getString(2)%></label></th>
		</tr>
		<tr>
		<th>Name</th>
		<th><input type="text" name="uname" value="<%=st.getString(1)%>"></th>
		</tr>
		<tr>
		<th>Mobile_Number</th>
		<th><input type="text" name="mob" value="<%=st.getString(3)%>"></th>
		</tr>
		<tr>
		<th>Security Question </th>
		<th><select  name="quest">
		 			<option><%=st.getString(4) %></option>
					<option value="What was your first car?">What was your
						first car?</option>
					<option value="What is the name of your first pet?">What
						is the name of your first pet?</option>
					<option value="What elementary school did you attend?">What
						elementary school did you attend?</option>
					<option value="What is the name of the town where you were born?">What
						is the name of the town where you were born?</option>
				</select></th>
		</tr>
		<tr>
		<th>Answer</th>
		<th><input type="text" name="ans" value="<%=st.getString(5)%>"></th>
		</tr>
		<tr>
		<th>Address</th>
		<th><input type="text" name="addr" value="<%=st.getString(7)%>"></th>
		</tr>
		<tr>
		<th>City</th>
		<th><input type="text" name="cit" value="<%=st.getString(8)%>"></th>
		</tr>
		<tr>
		<th>State</th>
		<th><input type="text" name="stat" value="<%=st.getString(9)%>"></th>
		</tr>
		<tr>
		<th>Country</th>
		<th><input type="text" name="coun" value="<%=st.getString(10)%>"></th>
		</tr>
		
	</table>
	<button id="btn" type="submit" value="changedetails">Save</button>
	
<%}	
%>

</form>
<button id="btn" type="submit"  value="back to home" onclick="goBack()">Back to Home</button>
	<script>
      function goBack() {
        
		window.location.href = "home.jsp";
		}
	</script>

</body>
</html>