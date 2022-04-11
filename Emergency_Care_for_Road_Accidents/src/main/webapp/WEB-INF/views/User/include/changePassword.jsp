<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Profile</a></li>
			<li class="breadcrumb-item active">Change Password</li>
			<li class="breadcrumb-item"><a class="btn btn-primary rightside"
				href='<spring:url value="/User/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>My Profile</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
		<div class="container mt-3">
			<div class="container" style="margin-top: 50px;">
				<div class="row">
					<div class="col-lg-4 panel">
						<h2>Password Update</h2>
					</div>
					<div class="col-lg-4 panel panel-heading"
						style="display: none; color: red" id="contact_error"></div>
				</div>
				<form method="post">
					<div class="row form-group">
						<div class="col-md-4">
							<label class="col control-label text-center"
								for="current_password"> Current Password </label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <input id="cpassword"
									placeholder="Enter Current Password" name="cpassword"
									class="form-control text-center" type="text" />
							</div>
						</div>

						<div class="col-md-4">
							<label class="col control-label text-center" for="new_password">
								New Password </label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <input id="npassword"
									placeholder="Enter New Password" name="npassword"
									class="form-control text-center" type="text" />
							</div>
						</div>

						<div class="col-lg-4">
							<label class="col control-label text-center"
								for="confirm_password"> Confirm Password </label>
							<div class="input-group">
								<input id="conpassword" name="conpassword"
									placeholder="Confirm Password" class="form-control text-center"
									type="text" />
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-12 text-center">
							<input type="submit" id="save" value="Save" name="save"
								class="btn btn-large btn-success">
							<button class="btn btn-large btn-danger" type="reset">Cancel</button>
						</div>
					</div>
			</div>
			</form>
		</div>
	</div>
</div>