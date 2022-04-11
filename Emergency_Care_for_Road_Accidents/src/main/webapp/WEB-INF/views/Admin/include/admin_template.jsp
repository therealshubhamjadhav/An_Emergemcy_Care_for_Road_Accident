<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Dashboard</title>
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

<link rel="stylesheet" href="<spring:url value='/css/admin_style.css'/>"
	type="text/css" />
<script>
	$("#sidenavToggler")
			.click(
					function(e) {
						e.preventDefault();
						$("body").toggleClass("sidenav-toggled");
						$(".navbar-sidenav .nav-link-collapse").addClass(
								"collapsed");
						$(
								".navbar-sidenav .sidenav-second-level, .navbar-sidenav .sidenav-third-level")
								.removeClass("show");
					});
</script>
<script type="text/javascript"
	src="<spring:url value='/js/admin_dashboard.js'/>"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="<spring:url value='/Admin/dashboard'/>"><img
			class="brand" src='<spring:url value="/image/logo.png"/>' height=40px></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link"
					href="<spring:url value='/Admin/Dashboard'/>"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="user"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#user" data-parent="#exampleAccordion">
						<i class="fa fa-fw fa-sitemap"></i> <span class="nav-link-text">User
							Management</span>
				</a>
					<ul class="sidenav-second-level collapse" id="user">
						<li><a href="<spring:url value='/Admin/addnewuser'/>"> <i
								class="fa fa-fw fa-link"></i> Add New Users
						</a></li>
						<li><a href="<spring:url value='/Admin/availableuser'/>">
								<i class="fa fa-fw fa-link"></i> Available Users
						</a></li>

					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="hospital"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#hospital" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">Hospital
							Management</span>
				</a>
					<ul class="sidenav-second-level collapse" id="hospital">
						<li><a href="<spring:url value='/Admin/addnewhospital'/>">
								<i class="fa fa-fw fa-link"></i> Add New Hospital
						</a></li>

						<li><a href="<spring:url value='/Admin/availablehospitals'/>">
								<i class="fa fa-fw fa-link"></i> Available Hospitals
						</a></li>

					</ul></li>

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="police"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#police"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Police Station Management</span>
				</a>
					<ul class="sidenav-second-level collapse" id="police">
						<li><a
							href="<spring:url value='/Admin/addnewpolicestation'/>"> <i
								class="fa fa-fw fa-link"></i> Add Police Station
						</a></li>

						<li><a href="<spring:url value='/Admin/availablestations'/>">
								<i class="fa fa-fw fa-link"></i> Available Police Station
						</a></li>

					</ul></li>

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="accident"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#accident" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">Accident
							Management</span>
				</a>
					<ul class="sidenav-second-level collapse" id="accident">


						<li><a href="<spring:url value='/Admin/accidentHistory'/>">
								<i class="fa fa-fw fa-link"></i> Reported Accidents
						</a></li>

					</ul>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link"
					href="<spring:url value='/Admin/feedback'/>"> <i
						class="fa fa-fw fa-link"></i> <span class="nav-link-text">User
							Feedback</span>
				</a></li>
				</li>
			</ul>

			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<h2 class="header"> (ADMIN) ${sessionScope.userDetails.name}&nbsp</h2>
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>Logout
				</a></li>
			</ul>
		</div>
	</nav>