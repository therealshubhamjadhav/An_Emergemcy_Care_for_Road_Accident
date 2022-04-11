
<%@page import="com.app.pojo.User"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Layout</a></li>
			<li class="breadcrumb-item ">My Profile</li>
			<li class="breadcrumb-item active">Update Profile Image</li>
			<a class="btn btn-primary right"
				href='<spring:url value="/User/dashboard"/>'>Back</a>
			</li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>My Profile Image</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
		<div class="container mt-3">
			<form method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="form-group col-lg-6">

						<label>New Image:</label> <input class="form-control col-lg-6"
							type="file" id="myFile" name="image"> <br>
						<input type="submit" class="btn btn-primary" value="Add New" />
					</div>
				</div>
			</form>
		</div>
		<script>
			$(".custom-file-input").on(
					"change",
					function() {
						var fileName = $(this).val().split("\\").pop();
						$(this).siblings(".custom-file-label").addClass(
								"selected").html(fileName);
					});
		</script>
		<div class="row">
			<div class="col-12">

								<h2>Current Profile Image</h2>
								<%
								User u= (User)session.getAttribute("userDetails");
								if(u.getImage() != null){
									%>
									<img src="data:image/jpeg;base64,${sessionScope.userDetails.imgUtility}"
									height=400px width=400px />
									<%
								}
								%>
			
			</div>
		</div>
	</div>
</div>