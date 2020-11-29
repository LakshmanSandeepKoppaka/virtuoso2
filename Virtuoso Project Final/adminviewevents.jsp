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
				<h4 class="text-center p-3">VIEW EVENT DETAILS</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Price</th>
							<th scope="col">Date</th>
							<th scope="col">Time</th>
							<th scope="col">Location</th>
							<th scope="col">Tickets Remaining</th>
							<th scope="col">Coord. Name</th>
							<th scope="col">Coord. Phone</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<%@include file="dbconnection.jsp"%>
					<%@page import="java.sql.PreparedStatement"%>
					<%@page import="java.sql.ResultSet"%>
					<%
					int count = 0;
					PreparedStatement ps = con.prepareStatement("SELECT * FROM event_reg");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						++count;
					%>
					<tbody>
						<tr>
							<td><%=rs.getString("ev_name")%></td>
							<td><%=rs.getString("ev_price")%></td>
							<td><%=rs.getString("ev_date")%></td>
							<td><%=rs.getString("ev_time")%></td>
							<td><%=rs.getString("ev_location")%></td>
							<td><%=rs.getString("ev_total_tickets")%></td>
							<td><%=rs.getString("ev_coord_name")%></td>
							<td><%=rs.getString("ev_coord_mobile")%></td>
							<%
							if(rs.getString("status").equals("In Progress")) { %>
								<td>
									<a href="admineditevent.jsp?eid=<%=rs.getString(1)%>" title="Edit" class="icon-style"><i class="fa fa-pencil"></i></a>
									<a href="crudoperations.jsp?eid=<%=rs.getString(1)%>&role=event_delete" title="Delete" class="icon-style"><i class="fa fa-trash"></i></a>
									<a href="crudoperations.jsp?eid=<%=rs.getString(1)%>&role=event_stop_book" title="Close Bookings" class="icon-style"><i class="fa fa-ban"></i></a>
								</td>
							<% } else { %>
								<td><%=rs.getString("status")%></td>
							<% } %>
						</tr>
						<% }
						if(count == 0) { %>
							<tr><td colspan="9"><h4 class="text-center" style="color: orangered;">No records found.</h4></td></tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</main>
		<!-- Main End -->
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="./js/main.js"></script>
	</body>
</html>

