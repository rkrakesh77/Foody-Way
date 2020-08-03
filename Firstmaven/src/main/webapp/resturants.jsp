<%@page import="DAOS.Resturant_Food_DAO"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="DAOS.Resturant_DAO"%>
<%@page import="ADMIN.Resturant_List_Servlet"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->



<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FOODY WAY-Resturants</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='//fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lobster+Two:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--Animation-->
<script src="js/wow.min.js"></script>
<link href="css/animate.css" rel='stylesheet' type='text/css' />
<script>
	new WOW().init();
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>		
<script src="js/simpleCart.min.js"> </script>	
</head>
<body>
    <!-- header-section-starts -->
	<div class="header">
		<div class="container">
			<div class="top-header">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" class="img-responsive" alt="" /></a>
				</div>
				<div class="queries">
					<p>Questions? Call us Toll-free!<span>7070700278 </span><label>(11AM to 11PM)</label></p>
				</div>
				<div class="header-right">
						<div class="cart box_1">
							<a href="checkout.jsp">
								<%!static int no=0; %>
							<%if(request.getSession().getAttribute("Username")!=null)
							{
							int Price=0;
							String User_Id=session.getAttribute("Cart_Id").toString();
							ResultSet r=Resturant_Food_DAO.List_Food(User_Id);
							while(r.next())
							{
// 								System.out.print(r.getString("Price"));
								int p=r.getInt("Price");
								Price=Price+p;
								no++;
							}
							
// 							stdOut.print("");
							%>
								<h3> <span>$ <% out.print(Price);%></span> (<span id="simpleCart_quantity" > <%out.print(no); %> </span> items)<img src="images/bag.png" alt=""></h3>
						<% 	}
							else 
							{%>
							<h3> <span> $ 0 </span> (<span id="simpleCart_quantity" > <%out.print(no); %> </span> items)<img src="images/bag.png" alt=""></h3>
							<%
							}
							no=0;
							%>
							</a>	
							<p><a href="Delete_cart_Food.jsp">Empty card</a></p>
							<div class="clearfix"> </div>
						</div>
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
			<div class="menu-bar">
			<div class="container">
				<div class="top-menu">
					<ul>
						<li><a href="index.jsp">Home</a></li>|
						<li class="active"><a href="resturants.jsp">Popular Restaurants</a></li>|
						
						<li><a href="contact.jsp">contact</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="login-section">
					<ul>
						<% 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
						<% 
								if (request.getSession().getAttribute("Username")!=null)
								{
									String str=(request.getSession().getAttribute("Username")).toString();
//			 						PrintWriter out=response.getWriter();
								%>
									<li><a href="#"><%out.print(str);%></a></li> |
									<li><a href="Logout.jsp">Logout</a></li>
									<li><a href="Admin_LogIn.html">ADMIN</a></li>
							<%		
								}
									else
								{
								%>
									<li><a href="login.jsp">Login</a>  </li> |
									<li><a href="Admin_LogIn.html">ADMIN</a></li>
									<li><a href="register.jsp">Register</a> </li> |
							<% 	}   %>
						<li><a href="#">Help</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>		
				</div>


	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<div class="Popular-Restaurants-content">
		<div class="Popular-Restaurants-grids">
			<div class="container">
			
			<%! Blob image = null;
			byte[] imgData = null ; 
			RequestDispatcher rd;
			%>
			
			<%ResultSet rs=Resturant_DAO.List_Resturant();
						while(rs.next())
						{
							int i=rs.getInt("Resturant_Id");
							
						%>
				<div class="Popular-Restaurants-grid wow fadeInRight" data-wow-delay="0.4s">
					<div class="col-md-3 restaurent-logo">
					
 					
						<img src="Logo.jsp?Resturant_Id=<%out.print(i);%>" class="img-responsive" alt="" />
						
					</div>
					<div class="col-md-2 restaurent-title">
					<h4><span><%out.print(rs.getString("Name"));%></span></h4>
						
						<div class="rating">
							<span>ratings</span>
							<a href="#"> <img src="images/star1.png" class="img-responsive" alt=""></a>
						</div>
					</div>
					<div class="col-md-7 buy">
						<span>Starting From <%out.print(rs.getString("Deal_Start_At")); %></span>
						<a class="morebtn hvr-rectangle-in" href="orders-list.jsp?key=<%out.print(rs.getString("Resturant_Id"));%>">Order</a>
					</div>
					<div class="clearfix"></div>
				</div>
			<%   
// 			o.flush();
						} %>
				
			</div>
		</div>
	</div>
	<div class="contact-section" id="contact">
			<div class="container">
				<div class="contact-section-grids">
					
					<div class="col-md-3 contact-section-grid wow fadeInLeft" data-wow-delay="0.4s">
						<h4>Site Links</h4>
						<ul>
							<li><i class="point"></i></li>
							<li class="data"><a href="#">About Us</a></li>
						</ul>
						<ul>
							<li><i class="point"></i></li>
							<li class="data"><a href="#">Contact Us</a></li>
						</ul>
						<ul>
							<li><i class="point"></i></li>
							<li class="data"><a href="#">Privacy Policy</a></li>
						</ul>
						<ul>
							<li><i class="point"></i></li>
							<li class="data"><a href="#">Terms of Use</a></li>
						</ul>
					</div>
					<div class="col-md-3 contact-section-grid wow fadeInRight" data-wow-delay="0.4s">
						<h4>Follow Us On...</h4>
						<ul>
							<li><i class="fb"></i></li>
							<li class="data"> <a href="#">  Facebook</a></li>
						</ul>
						<ul>
							<li><i class="tw"></i></li>
							<li class="data"> <a href="#">Twitter</a></li>
						</ul>
						<ul>
							<li><i class="in"></i></li>
							<li class="data"><a href="#"> Linkedin</a></li>
						</ul>
						<ul>
							<li><i class="gp"></i></li>
							<li class="data"><a href="#">Google Plus</a></li>
						</ul>
					</div>
					<div class="col-md-3 contact-section-grid nth-grid wow fadeInRight" data-wow-delay="0.4s">
						<h4>Subscribe Newsletter</h4>
						<p>To get latest updates and food deals every week</p>
						<input type="text" class="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
						<input type="submit" value="submit">
						</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<div class="footer">
		<div class="container">
			<p class="wow fadeInLeft" data-wow-delay="0.4s">&copy; 2014  All rights  Reserved | Template by &nbsp;<a href="#"> Rakesh Kumar </a></p>
		</div>
	</div>
	<!-- footer-section-ends -->
	  <script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>