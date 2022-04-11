
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Accident Management</a></li>

			<li class="breadcrumb-item active">Reported Accidents</li>
			<a class="btn btn-primary rightside"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a>
			</li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Reported Accidents</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>


		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr. No.</th>
							<th scope="col">Reporter Name</th>
							<th scope="col">Vehicle Number</th>
							<th scope="col">Passenger Involved</th>
							<th scope="col">Assigned Police Station</th>

						</tr>
					</thead>
					<tbody>
						<%
						int sr_no = 0;
						%>
						<c:forEach var="station" items="${sessionScope.accidentList}">
							<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								<td>${station.username}</td>
								<td>${station.vehicalNo}</td>
								<td>${station.passengerCount}</td>
								<td>${station.nearestPoliceStation.name}</td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>