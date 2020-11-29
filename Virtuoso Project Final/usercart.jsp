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
		var productIdMap = [];
		var priceList = [];
		function fetchProductId(icon, pr_id, price) {
			if(document.getElementById(icon).className == "fas fa-plus-circle") {
				document.getElementById(icon).className = "fas fa-minus-circle";
				productIdMap.push(pr_id);
				priceList.push(price);
			} else {
				document.getElementById(icon).className = "fas fa-plus-circle";
				var pr_index = productIdMap.indexOf(pr_id);
				productIdMap.splice(pr_index, 1);
				var price_index = priceList.indexOf(price);
				priceList.splice(price_index, 1);
			}
		}
		
		function getProductList() {
			if(productIdMap.length == 0) {
				swal("", "Select the products to purchase", "error");
				return false;
			} else {
				console.log(productIdMap.join());
				var x = productIdMap.join();
				document.getElementById("product_list").value = x;
				var y = priceList.join();
				document.getElementById("price_list").value = y;
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
								<h2 class="card-title text-center">YOUR CART ITEMS</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" style="margin-top: 50px; margin-bottom: 60px;">
				<%@include file="dbconnection.jsp"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.sql.ResultSet"%>
				<%@page import="java.util.ArrayList"%>
				<%
				int count = 0;
				String cart_pr_id = "";
				String cart_pr_price = "";
				String u_id = (String) session.getAttribute("user_id");
				String u_name = (String) session.getAttribute("u_name");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM user_product u INNER JOIN product p on u.product_id = p.id WHERE u.pr_status = 'In Cart' AND u.user_id = '" + u_id + "'");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					count++;
				%>
				<div class="card mb-3" style="max-width: 100%;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="./images/<%=rs.getString(20)%>" class="card-img" alt="<%=rs.getString(2)%>" style="width: 250px; height: 250px; padding: 10px;">
						</div>
						<div class="col-md-8" style="background-color: mintcream;">
							<div class="card-body">
								<%
								if(rs.getString("p.pr_stock").equals("In Stock")) {
									cart_pr_id += rs.getString(1) + ",";
									cart_pr_price += rs.getString("total_price") + ",";
								%>
									<a href="crudoperations.jsp?pr_id=<%=rs.getString(1)%>&role=cart_product_delete" title="Delete" style="float: right;">
										<i class="fas fa-trash-alt"></i>
									</a>
									<a href="crudoperations.jsp?pr_id=<%=rs.getString(1)%>&role=cart_product_save_later" style="text-decoration: none;">
										<p>Save For Later</p>
									</a>
								<% } else { %>
									<h4 class="text-center" style="color: orangered;">Out of Stock</h4>
								<% } %>
								<h5 class="card-title" style="margin-top: 20px;"><%=rs.getString("pr_name")%></h5>
								<p class="card-text"><b>Quantity: </b> <%=rs.getString("user_qnty")%></p>
								<p class="card-text"><b>Price: </b> <%=rs.getString("total_price")%></p>
							</div>
						</div>
					</div>
				</div>
				<% } 
				if(count == 0) { %>
					<h4 class="text-center" style="color: orangered;">No items in cart</h4>
				<% } %>
				<% if(count != 0) { %>
					<form action="userproductpayment.jsp" method="post" style="margin-bottom: 20px;">
						<div>
							<input type="hidden" name="product_list" id="product_list" value="<%=cart_pr_id%>" />
							<input type="hidden" name="price_list" id="price_list" value="<%=cart_pr_price%>" />
							<input type="submit" value="PROCEED TO BUY" class="btn btn-primary">
						</div>
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

