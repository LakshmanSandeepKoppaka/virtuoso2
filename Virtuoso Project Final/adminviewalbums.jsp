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
				<h4 class="text-center p-3">VIEW ALBUMS DETAILS</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Album Name</th>
							<th scope="col">Artist Name</th>
							<th scope="col">Price</th>
							<th scope="col">Description</th>
							<th scope="col">Category</th>
							<th scope="col">Audio</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<%@include file="dbconnection.jsp"%>
					<%@page import="java.sql.PreparedStatement"%>
					<%@page import="java.sql.ResultSet"%>
					<%
					int count = 0;
					PreparedStatement ps = con.prepareStatement("SELECT * FROM album");
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						++count;
					%>
					<tbody>
						<tr>
							<td><%=rs.getString("al_name")%></td>
							<td><%=rs.getString("al_artist_name")%></td>
							<td><%=rs.getString("al_price")%></td>
							<td><%=rs.getString("al_desc")%></td>
							<td><%=rs.getString("al_category")%></td>
							<td>
								<audio controls controlslist="nodownload">
									<source src="audios/<%=rs.getString(8)%>" type="audio/ogg">
									<source src="audios/<%=rs.getString(8)%>" type="audio/mp3">
									Your browser does not support the audio element.
								</audio>
							</td>
							<td>
								<a href="admineditalbum.jsp?aid=<%=rs.getString(1)%>" title="Edit" class="icon-style"><i class="fa fa-pencil"></i></a>
								<a href="crudoperations.jsp?aid=<%=rs.getString(1)%>&role=album_delete" title="Delete" class="icon-style"><i class="fas fa-trash"></i></a>
							</td>
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

