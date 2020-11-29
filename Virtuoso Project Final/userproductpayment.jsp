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
		function validateForm() {
			var pattern = /^\d{2}$/;
			var result = false;
			var acc_number = document.getElementById("acc_number").value;
			var cvv = document.getElementById("cvv").value;
			var exp_date = document.getElementById("exp_date").value;
			var dateSplit = exp_date.split('/');
			if(acc_number.length < 8 || acc_number <= 0) {
				swal("", "Incorrect Account Number (Contains atleast 8 digits)", "warning");
				return false;
			} else if(cvv.length != 3 || cvv <= 0) {
				swal("", "Incorrect CVV", "warning");
				return false;
			} else if(exp_date.length < 5) {
				swal("", "Please enter a valid date in MM/YY format.", "warning");
				return false;
			} else if(exp_date.length == 5) {
				if(dValue[0] < 1 || dValue[0] > 12) {
					result = true;
				}
				if(!pattern.test(dValue[0]) || !pattern.test(dValue[1])) {
					result = true;
				}
				if(dValue[2]) {
					result = true;
				}
				if(result) {
					swal("", "Please enter a valid date in MM/YY format.", "warning");
					return false;
				}
			} else {
				return true;
			}
		}
	</script>
	
	<%
		String productList = request.getParameter("product_list");
		productList = productList.substring(0, productList.length() - 1); 
		String whereCondition = " WHERE ";
		String productArray[] = productList.split(",");
		for(int i = 0; i < productArray.length; i++) {
			whereCondition += "id = '" + productArray[i] + "' OR ";
		}
		whereCondition = whereCondition.substring(0, whereCondition.length() - 3);
		
		String priceList = request.getParameter("price_list");
		priceList = priceList.substring(0, priceList.length() - 1); 
		int totalPrice = 0;
		String priceArray[] = priceList.split(",");
		for(int i = 0; i < priceArray.length; i++) {
			totalPrice += Integer.parseInt(priceArray[i]);
		}
	%>
	
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
						<li class="nav-item border rounded-circle mx-2 home-icon" style="cursor: pointer;">
							<i class="fas fa-home p-2" onclick="location.href='userhome.jsp'" title="Home"></i>
						</li>
						<li class="nav-item border rounded-circle mx-2 back-icon" style="cursor: pointer;">
							<i class="fas fa-arrow-alt-circle-left p-2" onclick="location.href='usercart.jsp'" title="Back"></i>
						</li>
					</div>
				</nav>
			</div>
		</header>
		<!-- Header End -->
		
		<!-- Main Start -->
		<main>
			<div class="container" style="padding: 30px;">
				<h4>PAYMENT</h4>
				<form action="crudoperations.jsp" method="post" onsubmit="return validateForm()">
					<input type="hidden" name="role" value="user_product_purchase">
					<input type="hidden" name="pr_query" value="<%=whereCondition%>">
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="shipping_address">Shipping Address</label>
							<textarea class="form-control" id="shipping_address" name="shipping_address" placeholder="Enter Shipping Address" required></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="total_amount">Total Amount</label>
							<input type="number" class="form-control" id="total_amount" name="total_amount" value="<%=totalPrice%>" placeholder="Total Amount" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="card_type">Select Card</label>
							<select class="form-control" id="card_type" name="card_type" required>
								<option value="Debit Card">Debit Card</option>
								<option value="Credit Card">Credit Card</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="acc_holder_name">Account Holder Name</label>
							<input type="text" class="form-control" id="acc_holder_name" name="acc_holder_name" placeholder="Enter Account Holder Name" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="acc_number">Account Number</label>
							<input type="number" class="form-control" id="acc_number" name="acc_number" placeholder="Enter Account Number" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="cvv">CVV</label>
							<input type="number" class="form-control" id="cvv" name="cvv" placeholder="Enter CVV" required>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label for="exp_date">Expiry Date</label>
							<input type="text" class="form-control" id="exp_date" name="exp_date" placeholder="Enter Expiry Date (MM/YY)" required>
						</div>
					</div>
					<input type="submit" class="btn btn-primary" value="PAY BILL">
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

