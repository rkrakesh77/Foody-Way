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

<title>Foody Way-Checkout</title>
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
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script>
 $(window).load(function(){
      $('.slider')._TMS({
              show:0,
              pauseOnHover:false,
              prevBu:'.prev',
              nextBu:'.next',
              playBu:false,
              duration:800,
              preset:'fade', 
              pagination:true,//'.pagination',true,'<ul></ul>'
              pagNums:false,
              slideshow:8000,
              numStatus:false,
              banners:false,
          waitBannerAnimation:false,
        progressBar:false
      })  
      });
      
     $(window).load (
    function(){$('.carousel1').carouFredSel({auto: false,prev: '.prev',next: '.next', width: 960, items: {
      visible : {min: 1,
       max: 4
},
height: 'auto',
 width: 240,

    }, responsive: false, 
    
    scroll: 1, 
    
    mousewheel: false,
    
    swipe: {onMouse: false, onTouch: false}});
    
    
    });      

     </script>
<script src="js/jquery.easydropdown.js"></script>
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

						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		</div>
	<!-- header-section-ends -->
	<div class="order-section-page">
		<div class="ordering-form">
			<div class="container">
			<div class="order-form-head text-center wow bounceInLeft" data-wow-delay="0.4s">
						<h3>Restaurant Order Form</h3>
						<p>Ordering Food Was Never So Simple !!!!!!</p>
					</div>
				<div class="col-md-6 order-form-grids">
					
					<div class="order-form-grid  wow fadeInLeft" data-wow-delay="0.4s">
						<h5>Order Information</h5>
								<span>Type of Order</span>
								 <div class="dropdown-button">           			
            			<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'>
            			
            			<option value="0">Delivery</option>
            			<option value="1">Pick up</option>	
						
<!-- 						<option value="2">Catering</option> -->
					  </select>
					</div>
		              <span>Restaurant Location</span>
					   <div class="dropdown-button wow">           			
            			<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'>
            			<option value="0">SBS COLLEGE PUNJAB</option>	
<!-- 						<option value="1">Restaurent B,64 Paarli Hills IndoreIndore</option> -->
					  </select> 
					</div>
					<span>Address :</span>
					
					<div> <input type="text" class="text" onfocus="this.value = '';" onblur="if (this.value == '') ">
									 <div class="clearfix"> </div>
							</div>		 
<!-- 								 <div class="dropdown-button">           			 -->
<!--             			<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'> -->
<!--             			<option value="0"> Secunderabad</option>	 -->
<!-- 						<option value="1">Location-1</option> -->
<!-- 						<option value="2">Location-2</option> -->
<!-- 					  </select> -->
						<span>Phone Number :</span>
					<div> <input type="text" class="text" onfocus="this.value = '';" onblur="if (this.value == '') ">
</div>
<!-- 					   <div class="dropdown-button">           			 -->
<!--             			<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'> -->
<!--             			<option value="0">cuisine-name</option>	 -->
<!-- 						<option value="1">cuisine-name</option> -->
<!-- 						<option value="2">cuisine-name</option> -->
<!-- 					  </select>  -->
<!-- 					</div> -->
					<div class="wow swing animated" data-wow-delay= "0.4s">
					<a href="PaymentPage.jsp"><input type="button" value="order now"></a>
					</div>
					</div>
				</div>
				</div>
				
<!-- 				<div class="col-md-6 ordering-image wow bounceIn" data-wow-delay="0.4s"> -->
<!-- 					<img src="images/order.jpg" class="img-responsive" alt="" /> -->
<!-- 				</div> -->
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