<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Profile</a></li>
			<li class="breadcrumb-item active">My Profile</li>
			<li class="breadcrumb-item active">My Vehicle Information</li>
			<a class="btn btn-primary right"
				href='<spring:url value="/User/dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>My Vehicle Information</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
		<div class="container mt-3">
			<div class="container" style="margin-top: 50px;">
				<form method="post" enctype="multipart/form-data">
					<div class="row form-group">
						<div class="col-md-4">
							<label class="col control-label text-center" for="vehical_no">
								Vehicle Number </label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <input id="vehical_no"
									name="vehical_no" class="form-control text-center" type="text" />
							</div>
						</div>
						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_type">
								Vehicle Type </label>
							<div class="input-group">
								<select class="form-control inputstl" type="text" name="vehical_type">
									<option value="bike">Bike</option>
									<option value="Scooter">Scooter</option>
									<option value="auto">Auto</option>
									<option value="car">Car</option>
									<option value="bus">Bus</option>
									<option value="truck">Truck</option>
								</select>
							</div>
						</div>

						<div class="col-lg-4">
							<label class="col control-label text-center"
								for="vehical_company"> Vehicle Company </label>
							<div class="input-group">
								<input id="vehical_company" class="form-control text-center"
									type="text" name="vehical_company" />
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-4">
							<label class="col control-label text-center"
								for="vehical_capacity"> Passenger Capacity </label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <input
									id="vehical_capacity" name="vehical_capacity"
									class="form-control text-center" type="text" />
							</div>
						</div>
						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_fuel">
								Fuel Type </label>
							<div class="input-group">
								<select class="form-control inputstl" type="text" name="vehical_fuel">
									<option value="car">Petrol</option>
									<option value="diesel">Diesel</option>
									<option value="cng">CNG</option>
								</select>
							</div>
						</div>

						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_image">
								Vehicle Image </label>
							<div class="input-group">
								<input type="file" class="form-control" id="vehical_image"
									name="vehical_image" />
							</div>
						</div>
					</div>
			</div>
			<hr>
			<div class="form-group row">
				<div class="col-md-12 text-center">
					<Button class="btn btn-large btn-success">Save</Button>
				</div>
			</div>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Sr. No.</th>
					<th scope="col">Vehicle Image</th>
					<th scope="col">Vehicle Number</th>
					<th scope="col">Vehicle Type</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					int sr_no = 0;
				%>
				<c:forEach var="vehical" items="${sessionScope.vehicalsList}">

					<tr>
						<th scope="row">${sr_no=sr_no+1}</th>
						<td><img src="data:image/jpeg;base64,${vehical.imgUtility}" height=100px width=100px/></td>
						<td>${vehical.vehicleNo}</td>
						<td>${vehical.type}</td>
						<td> <a
									href='<spring:url value="/User/vehical_delete?sid=${vehical.id}"/>'><button
											type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button></a></td>
					</tr>
					</c:forEach>
			</tbody>
		</table>

	</div>
</div>

