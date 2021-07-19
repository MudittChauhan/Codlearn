import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Userlogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	PrintWriter pw=response.getWriter();
    	String s1=request.getParameter("email");
    	String s2=request.getParameter("password");
    	String e,f=null,g=null,p,adn="muditt@admin.com",adp="12345";
    	HttpSession session = request.getSession();
    	boolean b = false,c = false;
    	try
    	{
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
    	Statement st=con.createStatement();
    	ResultSet rs=st.executeQuery("select * from user_info");
    	
    	while(rs.next())
        {
    		f = rs.getString(1);
    		g = rs.getString(2);
    		e = rs.getString(3);
        	p=rs.getString(4);
        if(s1.equals(e) && s2.equals(p))
        {
        	 b=true;   
        }
        if(s1.equals(adn) && s2.equals(adp))
        {
        	c=true;
        }
        } 
    	
    	if(c==true)
    	{
    		RequestDispatcher rd=request.getRequestDispatcher("AdminOption.html");
    		rd.include(request, response);
    		
    	}
    	else 
    		{
    		if(b==true)
    		{
    			session.setAttribute("name", f+" "+g); 
		RequestDispatcher rd=request.getRequestDispatcher("Instructions.jsp");
                rd.include(request, response);
            }
    		else
    	    {
    	    		RequestDispatcher rd=request.getRequestDispatcher("UserLogin.jsp");
        			rd.include(request, response);
        			pw.println("You're a Invalid user, If not register, firstly register yourself");   		
            }
    	}
        st.close();
    	}catch(Exception x)
    	{
    		pw.println("Error"+x);
    	}
     }

}
