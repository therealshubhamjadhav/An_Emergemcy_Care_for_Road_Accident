
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ECRA by IACSD</title>
<link rel="stylesheet" href="<spring:url value='/css/nav.css'/>" />
<style>
.Cart-Items {
	margin: auto;
	width: 90%;
	height: 30%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.image-box {
	width: 15%;
	text-align: center;
}

.about {
	height: 100%;
}

.title {
	padding-top: 5px;
	line-height: 10px;
	font-size: 32px;
	font-family: ‘Open Sans’;
	font-weight: 800;
	color: #202020;
}

.subtitle {
	line-height: 10px;
	font-size: 18px;
	font-family: ‘Open Sans’;
	font-weight: 600;
	color: #909090;
}
</style>
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
	<div class="row" style="margin-left: 20%;">
		<div class="col-12">
			<hr>

			<div class="container"
				style="width: 70%; height: 90%; background-color: #ffffff; border-radius: 20px; box-shadow: 0px 25px 40px #1687d933;">

				<br>


				<table>
					<td>
						<div class="card" style="width: 100%; margin-left: 2px;">
							<img class="card-img-top"
								src="data:image/jpeg;base64,${sessionScope.nearestHospitals.imgUtility}"
								style="width: 200px; height: 200px;">
					</td>
					<td>
						<div class="card-body">
							<h4 class="card-title" style="margin: 20px; float: right;">${sessionScope.nearestHospitals.name}</h4>
							<p class="card-text">Contact
								:${sessionScope.nearestHospitals.mobile}/ ${hospital.altMobile}</p>
							<a
								href='<spring:url value="https://maps.google.com/maps?q=${sessionScope.nearestHospitals.hospitalCoordinates.latitude},${sessionScope.nearestHospitals.hospitalCoordinates.longitude}"/>'
								class="btn btn-primary">Get Direction</a>
						</div>

						</div>
					</td>
					<hr>
				</table>

			</div>


		</div>
	</div>


	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>