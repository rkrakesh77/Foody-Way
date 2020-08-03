<%@page import="DAOS.Resturant_Food_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
String Food_Item,Category,Description;
int Resturant_Id;
double Price;
%>

<%
	/* if(request.getMethod().equalsIgnoreCase("get"))
	{
		doPost(request, response);
	
	}
	else if(request.getMethod().equalsIgnoreCase("post"))
	{ */
		ResultSet rs=Resturant_Food_DAO.List_Resturant_Food();
%>

	<table border="2">
	<tr> <th>Resturant Id</th> <th>Category</th> <th>Food_Item</th> <th>Price</th> <th>Description</th> </tr>
	
<% 
	while(rs.next())
	{
		Resturant_Id=Integer.parseInt(rs.getString("Resturant_Id"));
		Category=rs.getString("Category");
		Food_Item=rs.getString("Food_Item");
		Price=rs.getDouble("Price");
		Description=rs.getString("Description");
%>
		<tr>
			<td>Resturant_Id</td>
			<td>Category</td>
			<td>Food_Item</td>
			<td>Price</td>
			<td>Description</td>
		</tr>
<%
	}
	//}
%>
</table>
</body>
</html>