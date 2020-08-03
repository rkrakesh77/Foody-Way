<%@page import="java.sql.ResultSet"%>
<%@page import="DAOS.Resturant_DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LogIn</title>
</head>
<body>
<%!String Password,Email;
   int Resturant_Id;
%>

<%
	if(request.getMethod().equalsIgnoreCase("get"))
	{
%>
		<form action="Resturant_LogIn.jsp" method="post">
		Enter your Resturant Id : <input type="text" name="Resturant_Id"/>
		<br>
		Enter Email : <input type="text" name="Email"/>
		<br>
		Enter Password : <input type="Password" name="Password"/>
		<input type="submit" value="LogIn">
		</form>
<%	
	}
	else if(request.getMethod().equalsIgnoreCase("post"))
	{
		Resturant_Id=Integer.parseInt(request.getParameter("Resturant_Id"));
		Password=request.getParameter("Password");
		Email=request.getParameter("Email");
		ResultSet rs=DAOS.Resturant_DAO.List_Resturant();
		while(rs.next())
		{
		if(Resturant_Id==rs.getInt("Resturant_Id") && Password.equals(rs.getString("Password")))
		{
%>
			<a href="Resturant_Add_Food.jsp">Add Food</a>
			<a href="#">Delete Food</a>
<% 
		
		}
		}
%>
		
<% 
	}
%>
</body>
</html>