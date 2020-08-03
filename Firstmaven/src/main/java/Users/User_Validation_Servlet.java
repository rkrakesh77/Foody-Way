package Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOS.User_Details_DAO;

@WebServlet("/User_Validation_Servlet.do")
public class User_Validation_Servlet extends HttpServlet {
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
		ResultSet sr=DAOS.Resturant_DAO.List_Resturant();
		RequestDispatcher dispatch;
		String Password,Name="";
		String Email,id="";
		
		Email=(request.getParameter("Email"));
		Password=request.getParameter("Password");
		int i=0,j=0;
		try {
			if(!Email.isEmpty())
			{
				
			while(rs.next())
			{
				if(Email.equals(rs.getString("Email"))  && Password.equals(rs.getString("Password")))
				{
					Name=rs.getString("Name");
					id=rs.getString("Email");
					
					i++;
					
				}
				
			}
			
			while(sr.next())
			{
				if(Email.equals(sr.getString("Email"))  && Password.equals(sr.getString("Password")))
				{
					int Resturant_Id=sr.getInt("Resturant_Id");
					j++;
				}
			}
			if(i==0 && j==0)
			{
				out.print("Sorry");
			}
			else if(i==0 && j!=0)
			{
				out.print("Welcome Resturant Owner");
				
				dispatch=request.getRequestDispatcher("Resturant_Home.html");
				dispatch.include(request, response);
				
			}
			else if(i!=0 && j==0)
			{
				out.print("Welcome "+ Name);
				
				HttpSession session=request.getSession(true);
				session.setAttribute("Username", Name);
				
				
				session.setAttribute("Cart_Id", id);
				
//				dispatch=request.getRequestDispatcher("index.jsp?");
//				dispatch.forward(request, response);
				response.sendRedirect("index.jsp");
			}
			
//			if(i==0)
//			{
//				out.print("Please SignUp First");
//				dispatch=request.getRequestDispatcher("User_SignUp.html");
//				dispatch.include(request, response);
//				
//				
//			}
//			if(j==0)
//			{
//				out.print("Please Contact Admin");
//				dispatch=request.getRequestDispatcher("User_SignUp.html");
//				dispatch.include(request, response);
//			}
		} }
			catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
