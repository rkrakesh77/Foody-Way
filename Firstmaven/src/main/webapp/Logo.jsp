<%@page import="com.mysql.cj.Session"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="DAOS.Resturant_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%! Blob image = null;
			byte[] imgData = null ;
			int res;
			
			%>
			
			<% 
			res=Integer.parseInt(request.getParameter("Resturant_Id"));
			ResultSet rs=Resturant_DAO.List_Resturant_Logo(res);
						while(rs.next())
						{
							
							
							String imglen="";
							imglen=rs.getString("Photo");
							int len=imglen.length();
							byte [] rb=new byte[len];
							InputStream readimg=rs.getBinaryStream(7);
							int index=readimg.read(rb, 0, len);
							response.setContentType("image/png");
							OutputStream o=response.getOutputStream();
							o.write(rb, 0,len);  o.flush(); o.close();
						}
							

						%>


</body>
</html>