
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Police Stations Management</a></li>
			
			<li class="breadcrumb-item active">Available Police Stations</li>
			<a class="btn btn-primary rightside"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Police Station List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>
		<div class="container mt-3">
			<a href='<spring:url value="/Admin/addnewpolicestation"/>'
				class="btn btn-primary">Add new</a>
		</div>

		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr. No.</th>
							<th scope="col">Name</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						int sr_no = 0;
						%>
						<c:forEach var="station" items="${sessionScope.stationList}">
							<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								<td>${station.name}</td>
								<td>${station.mobileNo}/${station.altMobileNo}</td>
								<td>${station.policeStationAddress.streetLine},${station.policeStationAddress.city}</td>
								<td>${station.status}</td>
								<td><a
									href='<spring:url value="/Admin/station_status?sid=${station.id}"/>'><button
											type="button" class="btn btn-primary">
											<i class="far fa-eye"></i>
										</button></a> <a
									href='<spring:url value="/Admin/station_delete?sid=${station.id}"/>'><button
											type="button" class="btn btn-danger">
											<i class="far fa-trash-alt"></i>
										</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>