package ADMIN;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAOS.Resturant_DAO;


@WebServlet("/Resturant_Add_Servlet.do")
@MultipartConfig(fileSizeThreshold=1024*1024*10, // 10MB
maxFileSize=1024*1024*10)      // 10MB
public class Resturant_Add_Servlet extends HttpServlet {
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
				
		String Name,Email,Address,Password;
		long Contact;
		int Deal_Start_At;
		InputStream is=null;
		
		Name=request.getParameter("Name");
		Email=request.getParameter("Email");
		Address=request.getParameter("Address");
		Contact=Long.parseLong(request.getParameter("Contact"));
		Password=request.getParameter("Password");
		Deal_Start_At=Integer.parseInt(request.getParameter("Deal_Start_At"));
		
		System.out.println(Name);
		System.out.println(Email);
		System.out.println(Address);
		
		Part Photo=request.getPart("Photo");
		
		if(Photo!=null)
		{
			is=Photo.getInputStream();
		}
		
		
		if(Resturant_DAO.Add_Resturant(Name, Email, Address, Contact, Password,is, Deal_Start_At))
		{
			out.print("Resturant ADDED");
			dispatch=request.getRequestDispatcher("Resturant_List_Servlet");
			dispatch.include(request, response);
		}
		else
		{
			out.print("Please try Again");
			dispatch=request.getRequestDispatcher("Resturant_Add.html");
			dispatch.include(request, response);
		}
		
	}

}
