<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<% 
PrintWriter pw=response.getWriter();
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
PreparedStatement ps=con.prepareStatement("insert into save values(?,?)");
String b=(String)request.getParameter("rb");
String p=(String)session.getAttribute("un");
if(b!=null)
{
	ps.setString(1,b);
	ps.setString(2,p);
	}
	ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("Questions.jsp");
	rd.include(request, response);
	}catch(Exception x)
	{
	pw.println("Error"+x);
	}
	%>
</body>
</html>