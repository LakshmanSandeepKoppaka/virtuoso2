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
		function defaultValues() {
			var today = new Date().toISOString().split('T')[0];
			var nextDay = new Date(new Date().getTime() + 1 * 24 * 60 * 60 * 1000).toISOString().split('T')[0];
			document.getElementById("ev_date").setAttribute('min', nextDay);
		}
		
		function validateForm() {
			var password = document.getElementById("password").value;
			var mobile = document.getElementById("mobile").value;
			if(password.length < 6) {
				swal("", "Password must contain minimum of 6 characters", "warning");
				return false;
			} else if(mobile.length != 10) {
				swal("", "Mobile number must contain 10 digits", "warning");
				return false;
			} else {
				return true;
			}
		}
	</script>
	
	<body onload="defaultValues()">
		
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
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="adminhome.jsp">HOME</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ALUBMS</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="adminaddalbum.jsp">ADD</a>
									<a class="dropdown-item" href="adminviewalbums.jsp">VIEW</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PRODUCTS</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="adminaddproduct.jsp">ADD</a>
									<a class="dropdown-item" href="adminviewproducts.jsp">VIEW</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">EVENTS</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="adminaddevent.jsp">ADD</a>
									<a class="dropdown-item" href="adminviewevents.jsp">VIEW</a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="index.jsp">LOGOUT</a>
							</li>
						</ul>
					</div>
					
				</nav>
			</div>
		</header>
		<!-- Header End -->
		
		<!-- Main Start -->
		<main>
			<div class="container" style="padding: 30px;">
				<h4>EDIT EVENT DETAILS</h4>
				<%@include file="dbconnection.jsp"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.sql.ResultSet"%>
				<%
				String eid = request.getParameter("eid");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM event_reg WHERE id = '" + eid + "'");
				ResultSet rs = ps.executeQuery();
				if(rs.next()) { %>
				<form action="crudoperations.jsp" method="post">
					<input type="hidden" name="role" value="event_details_edit">
					<input type="hidden" name="eid" value="<%=eid%>">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_name">Event Name</label>
							<input type="text" class="form-control" id="ev_name" name="ev_name" value="<%=rs.getString("ev_name")%>" placeholder="Enter Event Name" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_price">Price</label>
							<input type="number" class="form-control" id="ev_price" name="ev_price" value="<%=rs.getString("ev_price")%>" placeholder="Enter Price per Ticket" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_date">Date</label>
							<input type="date" class="form-control" id="ev_date" name="ev_date" value="<%=rs.getString("ev_date")%>" placeholder="Enter Date" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_time">Time</label>
							<input type="time" class="form-control" id="ev_time" name="ev_time" value="<%=rs.getString("ev_time")%>" placeholder="Enter Time" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_location">Location</label>
							<input type="text" class="form-control" id="ev_location" name="ev_location" value="<%=rs.getString("ev_location")%>" placeholder="Enter Event Location" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_total_tickets">Total Tickets</label>
							<input type="number" class="form-control" id="ev_total_tickets" name="ev_total_tickets" readonly value="<%=rs.getString("ev_total_tickets")%>" placeholder="Enter Total Tickets" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_coord_name">Coordinator Name</label>
							<input type="text" class="form-control" id="ev_coord_name" name="ev_coord_name" value="<%=rs.getString("ev_coord_name")%>" placeholder="Enter Coordinator Name" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="ev_coord_mobile">Coordinator Contact</label>
							<input type="number" class="form-control" id="ev_coord_mobile" name="ev_coord_mobile" value="<%=rs.getString("ev_coord_mobile")%>" placeholder="Enter Coordinator Mobile Number" required>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="UPDATE">
				</form>
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

