<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Virtuoso Music Services</title>
		
		<!-- Bootstrap CDN -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		<!-- Font Awesome CDN -->
		<script src="https://kit.fontawesome.com/8382366d70.js" crossorigin="anonymous"></script>
		
		<!-- Slick Slider CDN -->
		<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
		
		<!-- Custom Style Sheet -->
		<link rel="stylesheet" href="./css/style.css" />
		
	</head>
	
	<body>
		
		<!-- Header Start -->
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-12 col-12">
						<div class="btn-group">
						</div>
					</div>
					<div class="col-md-4 col-12 text-center">
						<h3 class="my-md-3 site-title text-white">Virtuoso Music Services</h3>
					</div>
					<div class="col-md-4 col-12 text-right">
					</div>
				</div>
			</div>
			
			<div class="container-fluid p-0">
				<nav class="navbar navbar-expand-lg navbar-light bg-white">
					<div class="navbar-nav">
						<li class="nav-item border rounded-circle mx-2 search-icon" style="cursor: pointer;">
							<i class="fas fa-home p-2" onclick="location.href='userhome.jsp'" title="Home"></i>
						</li>
					</div>
					
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="useralbums.jsp">ALBUMS</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PRODUCTS</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="userviewproducts.jsp">VIEW</a>
									<a class="dropdown-item" href="userbuylater.jsp">SAVED PRODUCTS</a>
									<a class="dropdown-item" href="userhistory.jsp">HISTORY</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">EVENTS</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="userviewevents.jsp">VIEW</a>
									<a class="dropdown-item" href="userbookedevents.jsp">BOOKED</a>
								</div>
							</li>
						</ul>
					</div>
					
					<div class="navbar-nav">
						<!--<li class="nav-item border rounded-circle mx-2 search-icon" style="cursor: pointer;">
							<i class="fas fa-search p-2" onclick="location.href='userproductsearch.jsp'" title="Search Products"></i>
						</li>-->
						<li class="nav-item border rounded-circle mx-2 library-icon" style="cursor: pointer;">
							<i class="fas fa-music p-2" onclick="location.href='userpurchasedsongs.jsp'" title="Music Library"></i>
						</li>
						<li class="nav-item border rounded-circle mx-2 cart-icon" style="cursor: pointer;">
							<i class="fas fa-shopping-cart p-2" onclick="location.href='usercart.jsp'" title="Cart"></i>
						</li>
						<li class="nav-item border rounded-circle mx-2 account-icon" style="cursor: pointer;">
							<i class="fas fa-user-alt p-2" onclick="location.href='userviewprofile.jsp'" title="Account"></i>
						</li>
						<li class="nav-item border rounded-circle mx-2 signout-icon" style="cursor: pointer; margin-right: 3rem !important;">
							<i class="fas fa-sign-out-alt p-2" onclick="location.href='index.jsp'" title="Sign Out"></i>
						</li>
					</div>
					
				</nav>
			</div>
		</header>
		<!-- Header End -->
		
		<!-- Main Start -->
		<main>
			<div class="container">
				<div class="card mb-3">
					<div class="row no-gutters">
						<div class="col-md-12">
							<div class="card-body">
								<h2 class="card-title text-center">Welcome <%=session.getAttribute("u_name")%></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" style="margin-top: 50px; margin-bottom: 30px;">
				<h3>New Arrivals</h3>
				<div class="row">
					<%@include file="dbconnection.jsp"%>
					<%@page import="java.sql.PreparedStatement"%>
					<%@page import="java.sql.ResultSet"%>
					<%
					int count = 0;
					PreparedStatement ps = con.prepareStatement("SELECT * FROM product ORDER BY id DESC LIMIT 3");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						++count;
					%>
					<div class="card col-md-4 col-12 text-center" style="background-color: mintcream;">
						<img src="./images/<%=rs.getString(7)%>" class="card-img-top" alt="<%=rs.getString(2)%>" style="width: 200px; height: 200px; padding: 10px; align-self: center;">
						<div class="card-body">
							<h5 class="card-title"><%=rs.getString("pr_name")%></h5>
							<p class="card-text">Price: <%=rs.getString("pr_price")%></p>
							<a href="userviewproducts.jsp" class="btn btn-primary">View Details</a>
						</div>
					</div>
					<% }
					if(count == 0) { %>
						<h4 class="text-center" style="color: cornflowerblue; margin-left: 30px;">Arriving Soon...</h4>
					<% } %>
				</div>
			</div>
			
			<div class="container" style="margin-top: 50px; margin-bottom: 30px;">
				<h3>Upcoming Events</h3>
				<div class="row">
					<%
					int count1 = 0;
					PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_reg WHERE ev_date >= DATE(NOW()) ORDER BY ev_date ASC LIMIT 3");
					ResultSet rs1 = ps1.executeQuery();
					while(rs1.next()) {
						++count1;
					%>
					<div class="card col-md-4 col-12 text-center" style="background-color: mintcream;">
						<div class="card-body">
							<h3 class="card-title"><%=rs1.getString("ev_name")%></h3>
							<p class="card-text">Date: <%=rs1.getString("ev_date")%></p>
							<p class="card-text">Location: <%=rs1.getString("ev_location")%></p>
							<a href="userviewevents.jsp" class="btn btn-primary">View Details</a>
						</div>
					</div>
					<% }
					if(count1 == 0) { %>
						<h4 class="text-center" style="color: cornflowerblue; margin-left: 30px;">Bookings will open soon...</h4>
					<% } %>
				</div>
			</div>
			
		</main>
		<!-- Main End -->
		
		<!-- Footer Start -->
		<footer>
			<div class="card p-0">
				<div class="card-body">
					<h5 class="card-title">&#169; Virtuoso Music Services</h5>
					<!--<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>-->
				</div>
			</div>
		</footer>
		<!-- Footer End -->
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="./js/main.js"></script>
	</body>
</html>

