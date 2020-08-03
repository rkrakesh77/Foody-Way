<%@page import="DAOS.Resturant_Food_DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!String Food_Item,Category,Description;
   int Resturant_Id,Category_Id;
   double Price;
%>

<%
	if(request.getMethod().equalsIgnoreCase("get"))
	{
%>
		<form action="Resturant_Add_Food.jsp" method="post">
		Enter your Resturant Id : <input type="text" name="Resturant_Id"/>
		<br>
		Enter Category : <input type="text" name="Category"/>
		<br>
		Enter Food Item : <input type="text" name="Food_Item"/>
		<br>
		Enter Price : <input type="text" name="Price"/>
		<br>
		Enter Description : <input type="text" name="Description"/>
		<br>
		<input type="submit" value="ADD">
		</form>
	<% 
	}
	else if(request.getMethod().equalsIgnoreCase("post"))
	{
		Resturant_Id=Integer.parseInt(request.getParameter("Resturant_Id"));
		Food_Item=request.getParameter("Food_Item");
		Category=request.getParameter("Category");
		Price=Double.parseDouble(request.getParameter("Price"));
		Description=request.getParameter("Description");
		Category_Id=Integer.parseInt(request.getParameter("Category_Id"));
		if(DAOS.Resturant_Food_DAO.Add_Resturant_Food(Resturant_Id, Category,Category_Id, Food_Item, Price, Description))
		{
			out.print("ADDED");
		}
		else
		{
			out.print("Try Again...");
		}
	}
%>

</body>
</html>