<%@page import="java.io.PrintWriter"%>
<%@page import="DAOS.Resturant_Food_DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
<%int Resturant_Id=Integer.parseInt(request.getParameter("Resturant_Id"));

String Name=request.getParameter("Name");
int Price=Integer.parseInt(request.getParameter("Price"));
// Price=Integer.getInteger(request.getParameter("Price")).intValue();

// int Price = 20;
if(session.getAttribute("Username")!=null)
{
	String Id=(request.getSession().getAttribute("Cart_Id")).toString();
	if(Resturant_Food_DAO.Add_Food(Id, Name, Price, Resturant_Id))
	{
		response.sendRedirect("orders-list.jsp?key="+ Integer.parseInt(request.getParameter("Resturant_Id")));
	}
	else
		out.print("Failure");
}
else
{
	response.sendRedirect("login.jsp");	
}

%>

</body>
</html>