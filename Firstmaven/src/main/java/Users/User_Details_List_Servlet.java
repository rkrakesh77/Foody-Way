package Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOS.User_Details_DAO;


@WebServlet("/User_Details_List_Servlet.do")
public class User_Details_List_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		ResultSet rs=User_Details_DAO.List_User_Details();
		String Name,Email,Address,Password;
		long Contact;
		
		try
		{
			
			out.print("<html><body>");
			out.print("<table border=3>");
			out.print("<div>");
			out.print("<tr>");
			out.print("<tr> <th>Name</th> <th>Email</th> <th>Address</th> <th>Contact</th> <th>Password</th> </tr>");
			while(rs.next())
			{
				Name=rs.getString("Name");
				Email=rs.getString("Email");
				Address=rs.getString("Address");
				Contact=rs.getLong("Contact");
				Password=rs.getString("Password");
				
				out.print("<tr>");
				out.print("<td>"+Name+"</td>");
				out.print("<td>"+Email+"</td>");
				out.print("<td>"+Address+"</td>");
				out.print("<td>"+Contact+"</td>");
				out.print("<td>"+Password+"</td>");
				
				out.print("</tr>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

}
}
