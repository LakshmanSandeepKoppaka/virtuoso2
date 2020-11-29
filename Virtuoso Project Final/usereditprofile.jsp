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
			document.getElementById("dob").setAttribute('max', nextDay);
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
					<div class="navbar-nav">
						<li class="nav-item border rounded-circle mx-2 search-icon" style="cursor: pointer;">
							<i class="fas fa-home p-2" onclick="location.href='userhome.jsp'" title="Home"></i>
						</li>
					</div>
				</nav>
			</div>
		</header>
		<!-- Header End -->
		
		<!-- Main Start -->
		<main>
			<div class="container" style="padding: 30px;">
				<h4>PROFILE UPDATE</h4>
				<%@include file="dbconnection.jsp"%>
				<%@page import="java.sql.PreparedStatement"%>
				<%@page import="java.sql.ResultSet"%>
				<%
				String u_id = request.getParameter("id");
				PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE id = '" + u_id + "' LIMIT 1");
				ResultSet rs = ps.executeQuery();
				if(rs.next()) { %>
				<form action="crudoperations.jsp" method="post">
					<input type="hidden" name="role" value="user_edit_profile">
					<input type="hidden" name="uid" value="<%=u_id%>">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="name">Name</label>
							<input type="text" class="form-control" id="name" name="name" value="<%=rs.getString("name")%>" placeholder="Enter Name" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="email">Email ID</label>
							<input type="email" class="form-control" id="email" name="email" value="<%=rs.getString("email")%>" placeholder="Enter Email ID" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="mobile">Mobile Number</label>
							<input type="number" class="form-control" id="mobile" name="mobile" value="<%=rs.getString("mobile")%>" placeholder="Enter Mobile Number" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="dob">Date of Birth</label>
							<input type="date" class="form-control" id="dob" name="dob" value="<%=rs.getString("dob")%>" placeholder="Enter DOB" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="gender">Gender</label>
							<% if(rs.getString("gender").equals("Male")) { %>
							<select class="form-control" id="gender" name="gender" required>
								<option value="Male" selected>Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
							<% } else if(rs.getString("gender").equals("Female")) { %>
							<select class="form-control" id="gender" name="gender" required>
								<option value="Male">Male</option>
								<option value="Female" selected>Female</option>
								<option value="Other">Other</option>
							</select>
							<% } else if(rs.getString("gender").equals("Other")) { %>
							<select class="form-control" id="gender" name="gender" required>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other" selected>Other</option>
							</select>
							<% } else { %>
							<select class="form-control" id="gender" name="gender" required>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
							<% } %>
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

