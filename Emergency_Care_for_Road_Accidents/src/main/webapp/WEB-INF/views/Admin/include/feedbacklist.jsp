
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">User Feedback</a></li>
			
			<a class="btn btn-primary rightside"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Feedback List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>
		<div class="container mt-3"></div>

		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr. No.</th>
							<th scope="col">Name</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Email</th>
							<th scope="col">Feedback</th>

						</tr>
					</thead>
					<tbody>
						<%
						int sr_no = 0;
						%>
						<c:forEach var="hospital" items="${sessionScope.feeedbackList}">
							<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								<td>${hospital.name}</td>
								<td>${hospital.mobile}</td>
								<td>${hospital.email}</td>
								<td>${hospital.comment}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>