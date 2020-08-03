package ADMIN;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Resturant_Add_Food extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		int Resturant_Id, Category_Id;
		String Category,Description,Food_Item;
		double Price;
		
		
		Resturant_Id=Integer.parseInt(request.getParameter("Resturant_Id"));
		 Category_Id=Integer.parseInt(request.getParameter("Category_Id"));
		 Price=Double.parseDouble(request.getParameter("Price"));
		 Category=request.getParameter("Category");
		 Description=request.getParameter("Description");
		 Food_Item=request.getParameter("Food_Item");
		 if(DAOS.Resturant_Food_DAO.Add_Resturant_Food(Resturant_Id, Category, Category_Id, Food_Item, Price, Description))
		 {
			 out.println("Food Added");
		 }
		 else
			 out.print("Please Try Again");
	}

}
