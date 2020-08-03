<%@page import="DAOS.Resturant_Food_DAO"%>
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
<title>FOODY WAY-Contact US</title>
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
					<p>Questions? Call us Toll-free!<span>7070700278</span><label>(11AM to 11PM)</label></p>
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
						<li><a href="resturants.jsp">Popular Restaurants</a></li>|
						
						<li class="active"><a href="#contact" class="scroll">contact</a></li>
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
	<!-- header-section-ends -->
	<div class="contact-section-page">
		<div class="contact-head">
		    <div class="container">
				<h3>Contact</h3>
				<p>Home/Contact</p>
			</div>
		</div>
		<div class="contact_top">
			 		<div class="container">
			 			<div class="col-md-6 contact_left wow fadeInRight" data-wow-delay="0.4s">
			 				<h4>Contact Form</h4>
			 				<p>Please enter the details below so that we can contact you After Resolution of your Problems and Suggestion</p>
							  <form>
								 <div class="form_details">
					                 <input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
									 <input type="text" class="text" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
									 <input type="text" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
									 <textarea value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
									 <div class="clearfix"> </div>
									 <div class="sub-button wow swing animated" data-wow-delay= "0.4s">
									 	<input name="submit" type="submit" value="Send message">
									 </div>
						          </div>
						       </form>
					        </div>
					        <div class="col-md-6 company-right wow fadeInLeft" data-wow-delay="0.4s">
					        	<div class="contact-map">
			<iframe src="https://maps.google.com/maps?q=saheed%20bhagat%20singh%20state%20technical%20campus&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></div><style>.mapouter{text-align:right;height:500px;width:600px;}.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div>> </iframe>
		</div>
      
	  <div class="company-right">
					        	<div class="company_ad">
							     		<h3>Contact Info</h3>
							     		<span>FOODY WAY</span>
			      						<address>
											 <p>email : <a href="mailto:info@example.com">contact@foodyway.com</a></p>
											 <p>phone :  7070700278, 8083700390</p>
									   		<p>Saheed Bhagat Singh State Technical Campus</p>
									   		<p>Moga Road NH-95 Ferozepur, Punjab-152004	</p>
									 	 	
							   			</address>
							   		</div>
									</div>	
									<div class="follow-us">
										<h3>follow us on</h3>
										<a href="#"><i class="facebook"></i></a>
										<a href="#"><i class="twitter"></i></a>
										<a href="#"><i class="google-pluse"></i></a>
									</div>
			
							
							 </div>
						</div>
					</div>

	</div>
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