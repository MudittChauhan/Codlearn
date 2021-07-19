import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Form extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	PrintWriter pw=response.getWriter();
	String s1=request.getParameter("firstname");
	String s2=request.getParameter("lastname");
	String s3=request.getParameter("email");
	String s4=request.getParameter("password");
	String s5=request.getParameter("course");
	String s6=request.getParameter("college");
	//String f;
	//boolean b = false;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
	PreparedStatement ps = con.prepareStatement("insert into user_info(fname, lname, email, pass, course, college) values (?, ?, ?, ?, ?, ?)");
    ps.setString(1,s1);
    ps.setString(2,s2);
	ps.setString(3,s3);
	ps.setString(4,s4);
	ps.setString(5,s5);
	ps.setString(6,s6);
    ps.executeUpdate();
    ps.close();
    RequestDispatcher rd=request.getRequestDispatcher("Form.html");
    rd.include(request, response);
    }catch(Exception e)
	{
		pw.println("Error"+e);
	}
	}
}

/*try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from user_info");
	while(rs.next())
    {
    f=rs.getString(3);
    if(s3.equals(f))
    {
    	 b=true;   
    }
}
	if(b==true)
	{
		
		pw.println("You are already register with JOE, Login or Try again with new E-Mail Id");
	}
	else
    {
    		RequestDispatcher rd=request.getRequestDispatcher("Userlogin.html");
			rd.include(request, response);
	}
}catch(Exception e)
{
	pw.println("Error"+e);
}
}
}*/