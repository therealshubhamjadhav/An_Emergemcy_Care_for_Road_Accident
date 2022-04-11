
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">My Dashboard</li>
		</ol>
		<div class="row">
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-primary o-hidden h-100">
					<div class="card-body">
						<div class="card-body-icon">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
						 <div class="mr-5">Available Users </div> 
					</div>

					<a class="card-footer text-white clearfix small z-1"
						href='<spring:url value="/Admin/availableuser"/>'> <span
						class="float-left">View Details</span> <span class="float-right">
							<i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-warning o-hidden h-100">
					<div class="card-body">
						<div class="card-body-icon">
							<i class="fa fa-heartbeat" aria-hidden="true"></i>
						</div>
						<div class="mr-5">Available Hospitals </div>
					</div>
					<a class="card-footer text-white clearfix small z-1"
						href='<spring:url value="/Admin/availablehospitals"/>'> <span
						class="float-left">View Details</span> <span class="float-right">
							<i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-success o-hidden h-100">
					<div class="card-body">
						<div class="card-body-icon">
							<i class="fa fa-university" aria-hidden="true"></i>
						</div>
						<div class="mr-5">Available Police Stations </div>
					</div>
					<a class="card-footer text-white clearfix small z-1"
						href='<spring:url value="/Admin/availablestations"/>'> <span
						class="float-left">View Details</span> <span class="float-right">
							<i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-danger o-hidden h-100">
					<div class="card-body">
						<div class="card-body-icon">
							<i class="fa fa-truck" aria-hidden="true"></i>
						</div>
					 <div class="mr-5">Accident History </div>
					</div>
					<a class="card-footer text-white clearfix small z-1"
						href='<spring:url value="/Admin/accidentHistory"/>'> <span
						class="float-left">View Details</span> <span class="float-right">
							<i class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
