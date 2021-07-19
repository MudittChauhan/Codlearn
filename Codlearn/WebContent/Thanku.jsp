<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You</title>
<script type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<% 
request.getSession().invalidate();
                 
        %>
        <%
        PrintWriter pw=response.getWriter();
		
		try
        {
			response.setContentType("text/html");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
			Statement st=con.createStatement(); 
			st.executeUpdate("delete from save");
			st.close();
			}
		catch(Exception x)
    	{
        		pw.println("Error"+x);
        }%>
<div id="facebook-Bar">
		<div id="facebook-Frame"></div>
	</div>
	<center>
		<font size="12" color="blue"><br>
		<br>
		<br> !! THANK YOU !!<br> <font size="4" color="red"><br>
			<br> You Are Logout Successfully. If in future, You want to try JOE again, You can use your
				Email-Id and Password which you register with us. We Preserve your
				record. </font> </font>
	</center>
	
</body>
</html>