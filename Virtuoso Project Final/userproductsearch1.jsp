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
						<li class="nav-item border rounded-circle mx-2 search-icon" style="cursor: pointer;">
							<i class="fas fa-search p-2" onclick="location.href='userproductsearch.jsp'" title="Search Products"></i>
						</li>
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
								<h2 class="card-title text-center">PRODUCTS</h2>
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
				String search_for = request.getParameter("search_for");
				String search_price = request.getParameter("search_price");
				String price_range = request.getParameter("price_range");
				String price_based = request.getParameter("price_based");
				
				String query = "SELECT * FROM product WHERE ";
				
				if(search_for != null && search_for != "" && search_for.length() != 0) {
					query += "pr_name LIKE '%" + search_for + "%' AND ";
				}
				if(search_price != null && search_price != "" && search_price.length() != 0) {
					if(price_range != null && price_range != "" && price_range.length() != 0) {
						if(price_range.equals("equalPrice")) {
							query += "pr_price = '" + search_price + "' AND ";
						} else if(price_range.equals("greaterPrice")) {
							query += "pr_price >= '" + search_price + "' AND ";
						} else if(price_range.equals("lesserPrice")) {
							query += "pr_price <= '" + search_price + "' AND ";
						} else {
							query += "pr_price >= '" + search_price + "' AND ";
						}
					} else {
						query += "pr_price >= '" + search_price + "' AND ";
					}
				}
				if(price_based != null && price_based != "" && price_based.length() != 0) {
					query = query.substring(0, query.length() - 4);
					if(price_based.equals("LowToHigh")) {
						query += "ORDER BY pr_price ASC";
					} else if(price_based.equals("HighToLow")) {
						query += "ORDER BY pr_price DESC";
					} else {
						query += "ORDER BY pr_price ASC";
					}
				}
				
				if(query.equals("SELECT * FROM product WHORDER BY pr_price ASC")) {
					query = "SELECT * FROM product ORDER BY pr_price ASC";
				}
				if(query.equals("SELECT * FROM product WHORDER BY pr_price DESC")) {
					query = "SELECT * FROM product ORDER BY pr_price DESC";
				}
				
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					count++;
				%>
				<div class="card mb-3" style="max-width: 100%;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="./images/<%=rs.getString("pr_image")%>" class="card-img" alt="<%=rs.getString("pr_name")%>" style="width: 300px; height: 300px; padding: 10px;">
						</div>
						<div class="col-md-8" style="background-color: mintcream;">
							<div class="card-body">
								<h5 class="card-title" style="margin-top: 20px;"><%=rs.getString("pr_name")%></h5>
								<p class="card-text"><b>Price: </b> <%=rs.getString("pr_price")%></p>
								<p class="card-text"><b>Quantity: </b> <%=rs.getString("pr_quantity")%></p>
								<p class="card-text"><b>Details: </b> <%=rs.getString("pr_desc")%></p>
								<%
								if(rs.getString("pr_stock").equals("In Stock")) { %>
									<form action="crudoperations.jsp" method="post">
										<input type="hidden" name="role" value="product_add_to_cart">
										<input type="hidden" name="p_id" value="<%=rs.getString("id")%>">
										<input type="hidden" name="pr_cost" value="<%=rs.getString("pr_price")%>">
										<div class="form-row">
											<div class="col-md-6 mb-3">
												<input type="number" class="form-control" id="user_qnty" name="user_qnty" placeholder="Enter Quantity" required>
											</div>
										</div>
										<input type="submit" class="btn btn-primary" value="ADD TO CART">
									</form>
								<% } else { %>
									<h4 class="text-center" style="color: orangered;">Out of Stock</h4>
								<% } %>
							</div>
						</div>
					</div>
				</div>
				<% } 
				if(count == 0) { %>
					<h4 class="text-center" style="color: orangered;">Products not available for those search results</h4>
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

