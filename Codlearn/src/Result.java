import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Result extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter pw=response.getWriter();
		
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
			marks=marks+3;
            pw.println("<html>");
            pw.println("<script type='text/javascript'> "
            		+ "window.history.forward();"
            		+ "function noBack() { window.history.forward(); }"
            		+ "</script>"
            		+ "</head>"
            		+ "<body onload='noBack(););"
            + "'onpageshow='if (event.persisted) noBack();' onunload=''>");
            		
            pw.println("<center>");
            pw.println("<font size=10 color=blue>");
            pw.println("<br>");
            pw.println("<br>");
            pw.println("<br>");
            pw.println("<br>");
            pw.println("you have got.............................            "+marks+"marks");
            pw.println("<br>");
            pw.println("<br>");
            pw.println("<a href='Thanku.jsp'><input type='button' name='logout' value='logout'></a>");
            pw.println("</center>");
            pw.println("</font>");
            pw.println("</body>");
            pw.println("</html>");
            st.close();
        }
		catch(Exception x)
    	{
        		pw.println("Error"+x);
        }
    }
	}
