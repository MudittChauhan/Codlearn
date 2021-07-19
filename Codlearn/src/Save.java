import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Save extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	PrintWriter pw=response.getWriter();
    	String q=request.getParameter("ques");
    	String o1=request.getParameter("op1");
    	String o2=request.getParameter("op2");
    	String o3=request.getParameter("op3");
    	String o4=request.getParameter("op4");
    	String o=request.getParameter("op");   
    	try
    	{    
    	    Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/joe","root","");
    		PreparedStatement ps = con.prepareStatement("insert into questions(question, option1, option2, option3, option4, op) values (?, ?, ?, ?, ?, ?)");
    		ps.setString(1,q);
    	    ps.setString(2,o1);
    		ps.setString(3,o2);
    		ps.setString(4,o3);
    		ps.setString(5,o4);
    		ps.setString(6,o);
    		ps.executeUpdate();
    	    ps.close();
    	    RequestDispatcher rd=request.getRequestDispatcher("SetPaper.html");
    	    rd.include(request, response);
    		}catch(Exception x)
    	{
        		pw.println("Error"+x);
        	}
    }
    	            
    	            



	}

