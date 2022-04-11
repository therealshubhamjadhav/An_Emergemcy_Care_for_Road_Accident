
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">User Management</a></li>
			
			<li class="breadcrumb-item active">Available Users</li>
			<a class="btn btn-primary rightside"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>User List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>
		<div class="container mt-3">
			<a href='<spring:url value="/Admin/addnewuser"/>'
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
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						int sr_no = 0;
						%>

						<c:forEach var="user" items="${sessionScope.userList}">
							<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								<td>${user.name}</td>
								<td>${user.mobileNo}</td>
								<td>${user.email}</td>
								<td><a
									href='<spring:url value="/Admin/user_delete?uid=${user.id}"/>'><button
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