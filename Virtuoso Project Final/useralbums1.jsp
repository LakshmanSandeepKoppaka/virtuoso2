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
								<h2 class="card-title text-center">ALBUMS</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" style="padding: 30px;">
				<h4>CATEGORY SEARCH</h4>
				<form action="useralbums1.jsp" method="post">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_category">Category</label>
							<select class="form-control" id="al_category" name="al_category" required>
								<option value="Acoustic">Acoustic</option>
								<option value="Blues">Blues</option>
								<option value="Country">Country</option>
								<option value="Electronic">Electronic</option>
								<option value="Funk">Funk</option>
								<option value="Hip Hop">Hip Hop</option>
								<option value="Jazz">Jazz</option>
								<option value="Melodies">Melodies</option>
								<option value="Opera">Opera</option>
								<option value="Pop">Pop</option>
								<option value="Punk">Punk</option>
								<option value="Rap">Rap</option>
								<option value="Reggae">Reggae</option>
								<option value="Rock">Rock</option>
							</select>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="SEARCH">
				</form>
			</div>
			
			<div class="container" style="margin-top: 50px; margin-bottom: 60px;">
				<%@include file="dbconnection.jsp"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.sql.ResultSet"%>
				<%
				int count = 0;
				String u_id = (String) session.getAttribute("user_id");
				String album_cat = request.getParameter("al_category");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM album WHERE al_category = '" + album_cat + "'");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					++count;
				%>
				<div class="card mb-3" style="max-width: 100%;">
					<div class="row no-gutters">
						<div class="col-md-12" style="background-color: mintcream;">
							<div class="card-body">
								<h5 class="card-title" style="margin-top: 20px;"><%=rs.getString("al_name")%></h5>
								<p class="card-text"><b>Artist Name: </b> <%=rs.getString("al_artist_name")%></p>
								<p class="card-text"><b>Category: </b> <%=rs.getString("al_category")%></p>
								<p class="card-text"><b>Price: </b> <%=rs.getString("al_price")%></p>
								<p class="card-text"><b>Description: </b> <%=rs.getString("al_desc")%></p>
								<% 
								PreparedStatement ps1 = con.prepareStatement("SELECT * FROM user_song WHERE song_id = '" + rs.getString("id") + "' AND aud_status = 'Purchased' AND user_id = '" + u_id + "'");
								ResultSet rs1 = ps1.executeQuery();
								if(rs1.next()) { %>
									<p class="card-text" style="color: orangered;"><b><a href="userpurchasedsongs.jsp">Purchased</a></b></p>
								<% } else { %>
									<a href="userbuysong.jsp?a_id=<%=rs.getString(1)%>&u_id=<%=u_id%>&s_price=<%=rs.getString(4)%>" title="Purchase Album" class="icon-style"><b>Buy</b>&nbsp;<i class="fas fa-money-check"></i></a>
								<% } %>
							</div>
						</div>
					</div>
				</div>
				<% } 
				if(count == 0) { %>
					<h4 class="text-center" style="color: orangered;">Albums not available</h4>
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

