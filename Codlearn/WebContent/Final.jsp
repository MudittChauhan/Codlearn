<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
<link rel='stylesheet' type='text/css' href='css/rs.css'>
<script type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();"onpageshow="if (event.persisted) noBack();" onunload="">
<%PrintWriter pw=response.getWriter();
try
{
	response.setContentType("text/html");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
	Statement st=con.createStatement(); 
	ResultSet rs=st.executeQuery("select * from save");
	int marks=0; 
	while (rs.next())
    {
    	String q=rs.getString(1);
    	String op=rs.getString(2); 
        
        	if(op.equals(q))
        	{ 
        		marks=marks+2;   
        	}
        	else
        	{
        		marks=marks-1;   
        	}
        
    }
	//marks=marks+3;
	%>
	<section class="buttons">
  <div class="container">
    <h1>Dear  <%= session.getAttribute("name")%>, You got <%= marks %> marks.</h1>
    <a href="Thanku.jsp" class="btn btn-1">
      <svg>
        <rect x="0" y="0" fill="none" width="100%" height="100%"/>
      </svg>
     Logout
    </a>
</section>
	<%st.close();
	}
		catch(Exception x)
    	{
        		pw.println("Error"+x);
        }%>
</body>
</html>