
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Accidents</a></li>
			
			<li class="breadcrumb-item active">Reported Accident</li>
			<a class="btn btn-primary right" href='<spring:url value="/PoliceStation/dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Accident List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
		<div class="container mt-3">
			
		</div>
		
		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr. No.</th>
							<th scope="col">Reporter Name</th>
							<th scope="col">Vehicle Details</th>
							<th scope="col">Passenger Involved</th>
							
							<th scope="col">Live location</th>
						</tr>
					</thead>
					<tbody>
					<% int sr_no=0; %>
						<c:forEach var="accident" items="${sessionScope.accidentList}">
						<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								
								<td>${accident.username}</td>
								<td>${accident.vehicalNo}</td>
								<td>${accident.passengerCount}</td>
								
							<td>
						
							<a  
									href='<spring:url value="https://maps.google.com/maps?q=${accident.coordinates.latitude},${accident.coordinates.longitude}"/>'><button
										type="button" class="btn btn-primary"> 
 											<i class="fa fa-map-marker" aria-hidden="true"></i>
										</button></a> </td> 
 							</tr> 
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>