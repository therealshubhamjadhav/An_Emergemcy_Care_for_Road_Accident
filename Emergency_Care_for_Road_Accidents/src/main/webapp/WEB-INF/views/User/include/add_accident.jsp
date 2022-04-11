<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Accidents</a></li>
			<li class="breadcrumb-item active">Report Accident</li>
			<a class="btn btn-primary right"
				href='<spring:url value="/User/dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Report Accident</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.error}</h3>
		<div class="container mt-3">
			<div class="container" style="margin-top: 50px;">
				<form method="post">
					<fieldset>
							<div class="row form-group">
								<label class="form-control-label col col-lg-3" for="driver"> <h4>Driver Name :</h4></label>
									<input id="driver" name="driver" class="form-control col col-lg-4" type="text" value="${sessionScope.userDetails.name}"/>
							</div>
						<div class="row form-group">
							<label class="col col-lg-3 form-group" for="vehical"> <h4>Select Vehicle:</h4></label> 
							<select name="vid" class="col col-lg-4 form-control">
							<option value="mgm">----- Select Vehicle -----</option>
								<c:forEach items="${vehicalList}" var="vehical">
									<option value="${vehical.vehicleNo}">${vehical.vehicleNo}-
										${vehical.name} - ${vehical.type}</option>
								</c:forEach>
							</select>
						</div>
						<script>
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
								
						<div class="row form-group">
								<h4>Accident Live Location :</h4>
							<p id="demo"></p>
							<label class="form-control-label col col-lg-1">Latitude</label> 
								<input class="form-control col col-lg-2" type="text" name="latitude" id="myText1" >
							<label class="form-control-label col col-lg-1">Longitude</label>
								<input class="form-control col col-lg-2"  type="text" name="longitude" id="myText2" > 
							<a onclick="getLocation()" class="btn btn-outline-primary">Get Live Location</a>
						</div>
						
						<div class="row form-group">
								<label class="form-control-label col col-lg-3" for="count"> <h4>Passenger Involved:</h4></label>
									<input id="count" maxlength="3" name="count" class="form-control col col-lg-2" type="text" />
							</div>

							
			<hr>
			<div class="form-group row">
				<div class="col-md-8 text-center">
					<input type="submit" id="Inform" value="Inform" name="Inform"
						class="btn btn-large btn-success">
						

					<button class="btn btn-large btn-danger" type="reset">Cancel</button>
				</div>
			</div>
			</fieldset>
			</form>
		</div>


	</div>
</div>
</div>
