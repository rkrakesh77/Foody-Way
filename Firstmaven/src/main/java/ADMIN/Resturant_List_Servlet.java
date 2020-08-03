
package ADMIN;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOS.Resturant_DAO;


@WebServlet("/Resturant_List_Servlet.do")
public class Resturant_List_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		RequestDispatcher dispatch;
		ResultSet rs=Resturant_DAO.List_Resturant();
		String Name,Email,Address,Password;
		long Contact;
		int Resturant_Id;
		try
		{
			
			out.print("<html><body>");
			out.print("<table border=3>");
			out.print("<div>");
			out.print("<tr> <th>Resturant_Id</th> <th>Name</th> <th>Email</th> <th>Contact</th> <th>Address</th> <th>Password</th> </tr>");
			
			while(rs.next())
			{
				Resturant_Id=rs.getInt("Resturant_Id");
				Name=rs.getString("Name");
				Email=rs.getString("Email");
				Contact=rs.getLong("Contact");
				Address=rs.getString("Address");
				Password=rs.getString("Password");
				
				out.print("<tr>");
				out.print("<td>"+Resturant_Id+"</td>");
				out.print("<td>"+Name+"</td>");
				out.print("<td>"+Email+"</td>");
				out.print("<td>"+Contact+"</td>");
				out.print("<td>"+Address+"</td>");
				out.print("<td>"+Password+"</td>");
				
				out.print("</tr>");
			}
			out.print("</div>");
		}
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		out.print("<div>");
		dispatch=request.getRequestDispatcher("Resturant_Delete.html");
		dispatch.include(request, response);
		out.print("</div>");
		out.print("</body></html>");
	}
}


