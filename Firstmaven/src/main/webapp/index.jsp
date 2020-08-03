<%@page import="DAOS.Resturant_Food_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
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

<title style="font=areal">FOODY WAY</title>
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
<script src="js/simpleCart.min.js"> </script>	
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
						<li class="active"><a href="#Home" class="scroll">Home</a></li>|
						<li><a href="resturants.jsp">Popular Restaurants</a></li>|
						
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
// 						PrintWriter out=response.getWriter();
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
				<% 	}%>
			           <li><a href="#">Help</a></li>
					
						
						
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="banner wow fadeInUp" data-wow-delay="0.4s" id="Home">
		    <div class="container">
				<div class="banner-info">
					<div class="banner-info-head text-center wow fadeInLeft" data-wow-delay="0.5s">
						<h1>Network of over 5000 Restaurants</h1>
						<div class="line">
							<h2> To Order Online</h2>
						</div>
					
					<div>
					<h2 style="color:white">Quality Assured Food From Best Resturants</h2>
					</div>
					
					</div>
<!-- 					<div class="form-list wow fadeInRight" data-wow-delay="0.5s"> -->
<!-- 						<form> -->
<!-- 						  <ul class="navmain"> -->
<!-- 							<li><span>Location Name</span> -->
<!-- 							 <input type="text" class="text" value="Secunderabad" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Secunderabad';}"> -->
<!-- 							</li> -->
<!-- 							<li><span>Restaurant Name</span> -->
<!-- 							 <input type="text" class="text" value="Swagath Grand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Swagath Grand';}"> -->
<!-- 							</li> -->
<!-- 							<li><span>Cuisine Name</span> -->
<!-- 							 <input type="text" class="text" value="Chicken Biriyani" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Chicken Biriyani';}"> -->
<!-- 						    </li> -->
<!-- 						  </ul> -->
<!-- 						</form> -->
<!-- 						</div> -->
					<!-- start search-->
<!-- 		 <div class="main-search"> -->
<!-- 	        <form action="search.html"> -->
<!-- 	           <input type="text" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" class="text"/> -->
<!-- 	            <input type="submit" value=""/> -->
<!-- 	        </form> -->
<!-- 	        <div class="close"><img src="images/cross.png" /></div> -->
<!-- 	    </div> -->
<!-- 	    <div class="srch"><button></button></div> -->
					
				</div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<!-- content-section-starts -->
	<div class="content">
		<div class="ordering-section" id="Order">
			<div class="container">
				<div class="ordering-section-head text-center wow bounceInRight" data-wow-delay="0.4s">
					<h3>Ordering food was never so easy</h3>
					<div class="dotted-line">
						<h4>Just 4 steps to follow </h4>
					</div>
				</div>
				<div class="ordering-section-grids">
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="one"></i><br>
							<i class="one-icon"></i>
							<p>Choose <span>Your Restaurant</span></p>
							<label></label>
						</div>
					</div>
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="two"></i><br>
							<i class="two-icon"></i>
							<p>Order  <span>Your Cuisine</span></p>
							<label></label>
						</div>
					</div>
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="three"></i><br>
							<i class="three-icon"></i>
							<p>Pay   <span> online / on delivery</span></p>
							<label></label>
						</div>
					</div>
					<div class="col-md-3 ordering-section-grid">
						<div class="ordering-section-grid-process wow fadeInRight" data-wow-delay="0.4s"">
							<i class="four"></i><br>
							<i class="four-icon"></i>
							<p>Enjoy <span>your food </span></p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		
		<div class="popular-restaurents" id="Popular-Restaurants">
			<div class="container">
				<div class="col-md-4 top-restaurents">
					<div class="top-restaurent-head">
						<h3>Top Restaurants</h3>
					</div>
					<div class="top-restaurent-grids">
						<div class="top-restaurent-logos">
							<div class="res-img-1 wow bounceIn" data-wow-delay="0.4s">
								<img src="images/restaurent-1.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 wow bounceIn" data-wow-delay="0.4s">
							    <img src="images/restaurent-2.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="images/restaurent-3.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 wow bounceIn" data-wow-delay="0.4s">
							    <img src="images/restaurent-4.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-1 nth-grid1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="images/restaurent-5.jpg" class="img-responsive" alt="" />
							</div>
							<div class="res-img-2 nth-grid1 wow bounceIn" data-wow-delay="0.4s">
							    <img src="images/restaurent-6.jpg" class="img-responsive" alt="" />
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-8 top-cuisines">
					<div class="top-cuisine-head">
						<h3>Top Cuisines</h3>
					</div>
					<div class="top-cuisine-grids">
						<div class="top-cuisine-grid wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine1.jpg" class="img-responsive" alt="" /> </a>
							<label>PIZZA</label>
					    </div>
						<div class="top-cuisine-grid wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine2.jpg" class="img-responsive" alt="" /> </a>
							<label>BURGER</label>
					    </div>
						<div class="top-cuisine-grid wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine3.jpg" class="img-responsive" alt="" /> </a>
							<label>GARLIC BREAD</label>
					    </div>
						<div class="top-cuisine-grid nth-grid wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine4.jpg" class="img-responsive" alt="" /> </a>
							<label>SALADS</label>
					    </div>
						<div class="top-cuisine-grid nth-grid1 wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine5.jpg" class="img-responsive" alt="" /> </a>
							<label>COMBO</label>
					    </div>
						<div class="top-cuisine-grid nth-grid1 wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine6.jpg" class="img-responsive" alt="" /> </a>
							<label>VEG BURGER</label>
					    </div>
						<div class="top-cuisine-grid nth-grid1 wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine7.jpg" class="img-responsive" alt="" /> </a>
							<label>CHEESE BURST PIZZA</label>
					    </div>
						<div class="top-cuisine-grid nth-grid nth-grid1 wow bounceIn" data-wow-delay="0.4s">
						    <a href=""><img src="images/cuisine8.jpg" class="img-responsive" alt="" /> </a>
							<label>SPROUTS</label>
					    </div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="service-section">
			<div class="service-section-top-row">
				<div class="container">
					<div class="service-section-top-row-grids wow bounceInLeft" data-wow-delay="0.4s">
					<div class="col-md-3 service-section-top-row-grid1">
						<h3>Enjoy Exclusive Food Order any of these</h3>
					</div>
					<div class="col-md-2 service-section-top-row-grid2">
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists">Party Orders</li>
						</ul>
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists">Home Made Food</li>
						</ul>
						<ul>
							<li><i class="arrow"></i></li>
							<li class="lists"> Diet Food </li>
						</ul>
					</div>
					<div class="col-md-5 service-section-top-row-grid3">
						<img src="images/lunch.png" class="img-responsive" alt="" />
					</div>
					<div class="col-md-2 service-section-top-row-grid4 wow swing animated" data-wow-delay= "0.4s">
						<a href="resturants.jsp"><input type="submit" value="Order Now"></a>
					</div>
					<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="service-section-bottom-row">
				<div class="container">
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="images/icon1.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>100% Service Guarantee</h4>
							<p>If you Have Any complaint Regarding Food you will get full Refund. </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="images/icon2.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>Fully Secure Payment</h4>
							<p>We accept almost every payment mode and they are 100% secured. </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 service-section-bottom-grid wow bounceIn "data-wow-delay="0.2s">
						<div class="icon">
							<img src="images/icon3.jpg" class="img-responsive" alt="" />
						</div>
						<div class="icon-data">
							<h4>Track Your Order</h4>
							<p>Track your order until it reaches you. </p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
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
	</div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<div class="footer">
		<div class="container">
			<p class="wow fadeInLeft" data-wow-delay="0.4s">&copy; 2018  All rights  Reserved | Developed By  &nbsp;<a href="#"> Rakesh Kumar </a></p>
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