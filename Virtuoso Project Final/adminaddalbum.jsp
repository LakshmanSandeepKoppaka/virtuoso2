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
				<h4>UPLOAD ALBUM</h4>
				<!--<form action="AdminInsertProduct" method="post" enctype="multipart/form-data">-->
				<form action="adminalbums1.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="role" value="album_reg">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_name">Album Name</label>
							<input type="text" class="form-control" id="al_name" name="al_name" placeholder="Enter Album Name" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_artist_name">Artist Name</label>
							<input type="text" class="form-control" id="al_artist_name" name="al_artist_name" placeholder="Enter Artist Name" required>
						</div>
					</div>
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
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_price">Price</label>
							<input type="number" class="form-control" id="al_price" name="al_price" placeholder="Enter Price" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_desc">Description</label>
							<textarea class="form-control" name="al_desc" id="al_desc" placeholder="Enter Description" rows="6" required></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="al_audio">Choose Audio File</label>
							<input type="file" class="form-control" id="al_audio" name="al_audio" accept=".mp3,audio/*" placeholder="Choose Audio" required>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="UPLOAD">
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

