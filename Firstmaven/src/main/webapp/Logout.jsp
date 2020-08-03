<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<% 
	     

		 session.setAttribute("Username",null);
		 session.setAttribute("Cart_Id",null);
		 // 		 request.getSession().invalidate();
		 
		
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
// 	RequestDispatcher dispatch;
// 		dispatch=request.getRequestDispatcher("index.jsp");
// 				dispatch.forward(request, response);
  response.sendRedirect("index.jsp"); %> 

</body>
</html>