package ADMIN;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Admin_Servlet.do")
public class Admin_Servlet extends HttpServlet {
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
		String Name,Password;
		Name=request.getParameter("Name");
		Password=request.getParameter("Password");
		if(Name.equals("admin@123")  && Password.equals("admin"))
		{
			out.print("Welcome Admin <br>");
			dispatch=request.getRequestDispatcher("Admin_Home.html");
			dispatch.include(request, response);
			
		}
		else
		{
			out.print("Sorry please enter valid credentials ");
		}
	}

}
