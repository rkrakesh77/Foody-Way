package Users;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/User_Details_Add_Servlet.do")
public class User_Details_Add_Servlet extends HttpServlet {
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
		String Name,Password,Email,Address;
		long Contact;
		Name=request.getParameter("Name");
		Password=request.getParameter("Password");
		Email=request.getParameter("Email");
		Address=request.getParameter("Address");
		Contact=Long.parseLong(request.getParameter("Contact"));
		System.out.println(Name);
		System.out.println(Email);
		System.out.println(Address);
		System.out.println(Contact);
		System.out.println(Password);
		
		if(DAOS.User_Details_DAO.Add_User_Details(Name, Email, Address, Contact,  Password))
		{
			out.print("You Are Registered Please Log In To Continue...");
			dispatch=request.getRequestDispatcher("login.jsp");
			dispatch.include(request, response);
		}
		else
		{
			out.print("Please Try Again");
		}
		
	}

}
