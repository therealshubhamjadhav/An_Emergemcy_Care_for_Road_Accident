<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"	crossorigin="anonymous">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<spring:url value='/css/nav.css'/>" />
	</head>
<body>

	<div
		style="border: 2px solid black; background-color: gray; color: white;">
		<p style="font-size: 28px; float: left; margin-left: 10px;">Emergency Care For Road Accidents</p>
		<p style="font-size: 28px; margin-left: 55%;">
			<a class="showbutton active" href='<spring:url value="/"/>'>Home</a>
			<a class="showbutton" href='<spring:url value="/about"/>'>About</a> 
			<a class="showbutton" href='<spring:url value="/informaccident"/>'>Report Accident</a> 
			<a class="showbutton" href='<spring:url value="/feedback"/>'>Feedback</a> 
			<a	class="showbutton" href='<spring:url value="/signin"/>'>Sign In</a>
			<a class="showbutton" href='<spring:url value="/registration"/>'>Register</a>
		</p>
	</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src='<spring:url value="/image/R.jpg"/>' alt="Los Angeles"
					style="width: 100%;">
			</div>

			<div class="item">
				<img src='<spring:url value="/image/P.jpg"/>' alt="Chicago"
					style="width: 100%;">
			</div>

			<div class="item">
				<img src='<spring:url value="/image/s.jpg"/>' alt="New york"
					style="width: 100%;">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>



	</div>
	<div class="container-fluid">
		<div class="jumbotron">
			<h3 class="col">
				<b>Are you looking for a hospital that provides the best
					emergency care for road accidents? Here you will get all the
					leading inpatient and outpatient hospitals with the most advanced
					medical equipment.</b>
			</h3>

		</div>
	</div>



	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>