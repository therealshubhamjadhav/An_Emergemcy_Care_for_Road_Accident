
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emergency Care</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="<spring:url value='/ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'/>"></script>
<link rel="stylesheet" href="<spring:url value='/css/usercss.css'/>"
	type="text/css" />
<script type="text/javascript" src="<spring:url value='/js/Geo.js'/>"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box">
				<div class="col-lg-12 login-key">
					<i class="fa fa-key" aria-hidden="true"></i>
				</div>
				<div class="col-lg-12 login-title">Setup Hospital Profile</div>
				<h5
					style="color: red; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.error}</h5>
				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label class="form-control-label">Profile Image:</label> <input
									type="file" id="myFile" name="image" class="form-control">
							</div>
							<div class="form-group">
								<label class="form-control-label">New Password</label> <input 
									type="text" name="npassword" id="npasssword"
									class="form-control" />
							</div>
							<p id="error"></p>
							<div class="form-group">
								<label class="form-control-label">Confirm Password</label> <input
									type="password" name="cpassword" id="cpassword"
									class="form-control" />
							</div>
							<div class="row form-group">
							<p id="demo"></p>
						  	<label class="form-control-label col col-lg-2">Latitude</label> 
								<input class="form-control col col-lg-3" type="text" name="latitude" id="myText1" >
								
								 	<label class="form-control-label col col-lg-2">Longitude</label>
								<input class="form-control col col-lg-3"  type="text" name="longitude" id="myText2" >
								
								</div>
								</div>
								<script>
								var x=document.getElementById("error");
								function validateUserForm(){
									var npassword=document.getElementById("npasssword").value;
									var cpassword=document.getElementById("cpassword").value;
									if(npassword != cpassword){
										  alert ("Password Not Matched");  
									}
								}
									var x = document.getElementById("demo");

									function getLocation() {
										if (navigator.geolocation) {
											navigator.geolocation
													.getCurrentPosition(showPosition);
										} else {
											x.innerHTML = "Geolocation is not supported by this browser.";
										}
									}

									function showPosition(position) {
										// document.getElementById("myText1").setAttribute('value', position.coords.latitude);
										document.getElementById("myText1").value = position.coords.latitude;
										document.getElementById("myText2").value = position.coords.longitude;
									}
								</script>
								<div class="col-lg-6 login-btm login-button">
								<a onclick="getLocation()" class="btn btn-outline-primary">Get Live Location</a></div>
								<div class="col-lg-6 login-btm login-button">
									<button onclick="validateUserForm()" type="submit"
										class="btn btn-outline-primary">Update Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-3 col-md-2"></div>
			</div>
		</div>
	
</body>
</html>



