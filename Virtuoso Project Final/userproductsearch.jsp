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
					
					<!--<div class="collapse navbar-collapse" id="navbarNavDropdown">
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
					</div>-->
					
					<div class="navbar-nav">
						<!--<li class="nav-item border rounded-circle mx-2 search-icon" style="cursor: pointer;">
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
						</li>-->
					</div>
					
				</nav>
			</div>
		</header>
		<!-- Header End -->
		
		<!-- Main Start -->
		<main>
			<div class="container" style="padding: 30px;">
				<h4>PRODUCT SEARCH</h4>
				<form action="userproductsearch1.jsp" method="post">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="search_for">Search For</label>
							<input type="text" class="form-control" id="search_for" name="search_for" placeholder="Search for...">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="search_price">Price</label>
							<input type="number" class="form-control" id="search_price" name="search_price" placeholder="Enter Price">
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="price_range">Choose Price Range</label>
							<select class="form-control" id="price_range" name="price_range">
								<option value="--None--">--None--</option>
								<option value="equalPrice">Equal To Entered Price</option>
								<option value="greaterPrice">Greater Than Entered Price</option>
								<option value="lesserPrice">Lesser Than Entered Price</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="price_based">Based on Pricing</label>
							<select class="form-control" id="price_based" name="price_based">
								<option value="--None--">--None--</option>
								<option value="LowToHigh">Low To High</option>
								<option value="HighToLow">High To Low</option>
							</select>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="SEARCH">
				</form>
			</div>
		</main>
		<!-- Main End -->
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="./js/main.js"></script>
	</body>
</html>

