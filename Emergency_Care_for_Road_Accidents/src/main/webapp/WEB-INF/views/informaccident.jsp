
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="utf-8">
<title>ECRA by IACSD</title>
<link rel="stylesheet" href="<spring:url value='/css/index.css'/>" />
<link rel="stylesheet" href="<spring:url value='/css/nav.css'/>" />
</head>
<body>
	<div
		style="border: 2px solid black; background-color: gray; color: white;">


		<p style="font-size: 28px; float: left; margin-left: 10px;">
			Emergency Care For Road Accidents</p>
		<p style="font-size: 28px; margin-left: 55%;">
			<a class="showbutton active" href='<spring:url value="/"/>'>Home</a>
			<a class="showbutton" href='<spring:url value="/about"/>'>About</a> <a
				class="showbutton" href='<spring:url value="/informaccident"/>'>Report
				Accident</a> <a class="showbutton"
				href='<spring:url value="/feedback"/>'>Feedback</a> <a
				class="showbutton" href='<spring:url value="/signin"/>'>Sign In</a>

			<a class="showbutton" href='<spring:url value="/registration"/>'>Register</a>
		</p>
	</div>
	<form class="box" method="post">
		<h1>Report Accident</h1>
		<h5
			style="color: green; background-color: white; margin-right: 50px; margin-left: 50px;">${sessionScope.success}</h5>
		<h5
			style="color: red; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.error}</h5>
		<input type="text" name="name" placeholder="Reporter Name"> <input
			type="text" name="vehicalno" placeholder="Vehicle Number"> <input
			type="text" name="count" placeholder="Passenger Involved">


		<script>
			var x = document.getElementById("demo");

			function getLocation() {
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(showPosition);
				} else {
					x.innerHTML = "Geolocation is not supported by this browser.";
				}
			}

			function showPosition(position) {
				document.getElementById("myText1").value = position.coords.latitude;
				document.getElementById("myText2").value = position.coords.longitude;
			}
		</script>
		<div class="row form-group">
			<h4 style="color: white;">Live Location Of Accident:</h4>
			<p id="demo"></p>
			<label style="color: white;" class="form-control-label col col-lg-1">Latitude</label>
			<input class="form-control col col-lg-2" type="text" name="latitude"
				id="myText1"> <label style="color: white;"
				class="form-control-label col col-lg-1">Longitude</label> <input
				class="form-control col col-lg-2" type="text" name="longitude"
				id="myText2"> &nbsp&nbsp&nbsp <a class="anchor"
				onclick="getLocation()" class="btn btn-outline-primary">Get Live
				Location</a>
		</div>
		<input type="submit" value="Submit">

	</form>

	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>