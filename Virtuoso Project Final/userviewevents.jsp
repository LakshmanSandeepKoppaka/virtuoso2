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
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
	</head>
	
	<style>
		/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
			-webkit-appearance: none;
			margin: 0;
		}
		/* Firefox */
		input[type=number] {
			-moz-appearance: textfield;
		}
	</style>
	<script>
		function showHideDiv(event_id) {
			var no_ticket = document.getElementById(event_id).value;
			var list = document.getElementsByClassName("user_ticket_count");
			for (var i = 0; i < list.length; i++) {
				list[i].setAttribute("value", no_ticket);
			}
			var price = document.getElementById('price').value;
			var event_tickets = document.getElementById('event_tickets').value;
			if(no_ticket == '' || no_ticket == null || no_ticket == undefined) {
				swal("", "Enter the number of tickets", "error");
				return false;
			} else if(no_ticket < 1) {
				swal("", "Enter valid number.", "warning");
				return false;
			} else if(no_ticket > 5) {
				swal("", "Maximum of 5 tickets can be booked at a time.", "warning");
				return false;
			} else {
				return true;
			}
		}
	</script>
	
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
								<h2 class="card-title text-center">EVENTS</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" style="margin-top: 50px; margin-bottom: 60px;">
				<%@include file="dbconnection.jsp"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.sql.ResultSet"%>
				<%
				int count = 0;
				PreparedStatement ps = con.prepareStatement("SELECT * FROM event_reg WHERE ev_date > DATE(NOW()) ORDER BY ev_date ASC");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					++count;
				%>
				<div class="card mb-3" style="max-width: 100%;">
					<div class="row no-gutters">
						<div class="col-md-12" style="background-color: mintcream;">
							<div class="card-body">
								<h5 class="card-title" style="margin-top: 20px;"><%=rs.getString("ev_name")%></h5>
								<p class="card-text"><b>Date: </b> <%=rs.getString("ev_date")%></p>
								<p class="card-text"><b>Time: </b> <%=rs.getString("ev_time")%></p>
								<p class="card-text"><b>Location: </b> <%=rs.getString("ev_location")%></p>
								<p class="card-text"><b>Price per Ticket: </b> <%=rs.getString("ev_price")%></p>
								<% if(rs.getString("status").equals("In Progress")) { %>
									<p class="card-text"><b>Bookings: </b> Open</p>
									<form action="usereventpayment.jsp" method="post" onsubmit="return showHideDiv(<%=rs.getString("id")%>)">
									<!--<form action="usereventpayment.jsp" method="post">-->
										<input type="hidden" name="id" id="id" value="<%=rs.getString("id")%>">
										<input type="hidden" name="price" id="price" value="<%=rs.getString("ev_price")%>">
										<input type="hidden" name="event_tickets" id="event_tickets" value="<%=rs.getString("ev_total_tickets")%>">
										<input type="hidden" class="user_ticket_count" name="user_ticket_count" id="user_ticket_count" value="">
										<div class="form-row">
											<div class="col-md-6 mb-3">
												<input type="number" class="form-control" id="<%=rs.getString("id")%>" name="<%=rs.getString("id")%>" placeholder="Number of Tickets" required>
											</div>
										</div>
										<input type="submit" class="btn btn-primary" value="PURCHASE">
									</form>
								<% } else { %>
									<p class="card-text"><b>Bookings: </b> Closed</p>
								<% } %>
							</div>
						</div>
					</div>
				</div>
				<% } 
				if(count == 0) { %>
					<h4 class="text-center" style="color: orangered;">Events not available</h4>
				<% } %>
			</div>
			
		</main>
		<!-- Main End -->
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="./js/main.js"></script>
	</body>
</html>

