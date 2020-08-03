package ADMIN;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOS.Resturant_DAO;


@WebServlet("/Resturant_Delete_Servlet.do")
public class Resturant_Delete_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int Resturant_Id;
		RequestDispatcher dispatch;
		Resturant_Id=Integer.parseInt(request.getParameter("Resturant_Id"));
		if(Resturant_DAO.Delete_Resturant(Resturant_Id))
		{
			out.print("Record Deleted");
			dispatch=request.getRequestDispatcher("Resturant_List_Servlet.do");
			dispatch.include(request, response);
			
		}
		else
		{
			out.print("please try again");
		}
	}

}
