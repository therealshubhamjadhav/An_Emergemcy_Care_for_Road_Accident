<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<spring:url value='/css/nav.css'/>" />
</head>
<body>

	<div
		style="border: 2px solid black; background-color: gray; color: white;">


		<p style="font-size: 28px; float: left; margin-left: 10px;">
			Emergency Care For Road Accidents</p>
		<p style="font-size: 28px; margin-left: 55%;">
			<a class="showbutton" href='<spring:url value="/"/>'>Home</a> <a
				class="showbutton active" href='<spring:url value="/about"/>'>About</a>
			<a class="showbutton" href='<spring:url value="/informaccident"/>'>Report
				Accident</a> <a class="showbutton"
				href='<spring:url value="/feedback"/>'>Feedback</a> <a
				class="showbutton" href='<spring:url value="/signin"/>'>Sign In</a>

			<a class="showbutton" href='<spring:url value="/registration"/>'>Register</a>
		</p>
	</div>



	</div>
	<div class="container-fluid">
		<div class="jumbotron">
			<center>
				<h1>
					<b style="color: red;">Vision</b>
				</h1>
			</center>
			<h3 class="col">
				<b>Our vision at IACSD is to harness the power of smartphones to
					help accident victims in case of an emergency. We believe we can
					leverage the information and technology available to us, along with
					a shared goal of making our roads safer, to create a world where no
					victim is left unattended after an accident.</b>
			</h3>

		</div>
	</div>

	<div class="container-fluid">
		<div class="jumbotron">
			<center>
				<h1>
					<b style="color: red;">Mission</b>
				</h1>
			</center>
			<h3 class="col">
				<b> Our mission at IACSD is to make sure that nobody has to go
					through the trauma of being involved in an accident alone. We want
					to ensure that every victim gets the medical attention they need as
					quickly as possible so they can get back on their feet and return
					to their normal lives. With our product, Emergency Care for Road
					Accidents, we are working towards creating a safer world for
					everyone by providing on-demand medical assistance that can be
					accessed by accident victims at the simple press of a button.</b>
			</h3>

		</div>
	</div>

	<div class="container">
		<h1 style="text-align: center;">
			<b> Project Devevloper Information</b>
		</h1>
		<div class="row">
			<div class="col">
				<div class="card">
					<img class="imagesize"
						src='<spring:url value="/image/shubham.jpeg"/>' />
					<h2>Shubham Jadhav</h2>
					<h5>Developer</h5>
				</div>
			</div>

			<div class="col">
				<div class="card">
					<img class="imagesize" src='<spring:url value="/image/ajay.jpeg"/>' />
					<h2>Ajay Pawar</h2>
					<h5>Developer</h5>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>