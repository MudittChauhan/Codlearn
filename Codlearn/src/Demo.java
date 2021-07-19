import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc://mysql:localhost/3306/emp","root"," ");
			Statement s1= con.createStatement();
			ResultSet r=s1.executeQuery("select* from empdata");
			while(r.next())
			{
				System.out.println(r.getString(1));
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
    	
	}

}
