<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">User Management</a></li>
			<li class="breadcrumb-item active">Add New User</li>
			<a class="btn btn-primary rightside"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>User Registration</h2>
		</div>

		<h3
			style="color: green; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
		<div class="container mt-3">
			<div class="container" style="margin-top: 50px;">
				<form method="post">
					<fieldset>
						<div class="row">
							<div class="col-lg-4 panel">
								<h2>Contact Information</h2>
							</div>
							<div class="col-lg-4 panel panel-heading"
								style="display: none; color: red" id="contact_error"></div>
						</div>
						<div class="row form-group">
							<div class="col-md-4">
								<label class="col control-label text-center" for="first_name">
									First Name </label>
								<div class="input-group">
									<i class="glyphicon glyphicon-user"></i> <input id="first_name"
										name="first_name" placeholder=""
										class="form-control text-center" type="text" />
								</div>
							</div>

							<div class="col-md-4">
								<label class="col control-label text-center" for="middle_name">
									Middle Name </label>
								<div class="input-group">
									<i class="glyphicon glyphicon-user"></i> <input
										id="middle_name" name="middle_name" placeholder=""
										class="form-control text-center" type="text" />
								</div>
							</div>

							<div class="col-md-4">
								<label class="col control-label text-center" for="last_name">
									Last Name </label>
								<div class="input-group">
									<i class="glyphicon glyphicon-user"></i> <input id="last_name"
										name="last_name" placeholder=""
										class="form-control text-center" type="text" />
								</div>
							</div>
						</div>
			</div>
			<hr>
			<div class="row form-group">

				<div class="col-lg-4">
					<label class="col control-label text-center" for="mobile">
						Mobile Number </label>
					<div class="input-group">
						<input id="mobile" maxlength="10" name="mobile"
							placeholder="xxxxxxxxxxxx" class="form-control text-center"
							type="text" />
					</div>
				</div>

				<div class="col-lg-4">
					<label class="col control-label text-center" for="mobile">
						Email </label>
					<div class="input-group">
						<input id="email" name="email" placeholder="example@gmail.com"
							class="form-control text-center" type="email" />
					</div>
				</div>
			</div>
			<hr>

			<hr>
			<div class="row">
				<div class="col-lg-12 panel ">
					<h2>Address Information</h2>
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-4">
					<label class="col control-label text-center" for="city">City</label>
					<div class="input-group">
						<input id="city" name="city" placeholder=""
							class="form-control text-center" type="text" />
					</div>
				</div>

				<div class="col-md-4">
					<label class="col control-label text-center" for="state">State</label>
					<div class="input-group">
						<i class="glyphicon glyphicon-list"></i> <input id="state"
							name="state" placeholder="" class="form-control text-center"
							type="text" />
					</div>
				</div>

				<div class="col-md-4">
					<label class="col control-label text-center" for="district">District</label>
					<div class="input-group">
						<i class="glyphicon glyphicon-list"></i> <input id="district"
							name="district" placeholder="" class="form-control text-center"
							type="text" />
					</div>
				</div>
			</div>
			<hr>
			<div class="row form-group">
				<div class="col-lg">
					<label class="col control-label text-center" for="add_ln">Complete
						Address </label> <input id="add_ln" name="add_ln"
						placeholder="street address" class="form-control text-center"
						type="text" />
				</div>
			</div>
			<hr>

			<div class="row form-group">
				<div class="col-lg-2">
					<label class="col control-label text-center" for="pin_code">Pin
						Code</label> <input id="pin_code" name="pin_code" placeholder=""
						class="form-control text-center" type="text" />
				</div>

				<div class="col-lg-5">
					<label class="col control-label text-center" for="country">Country</label>
					<div class="input-group">
						<i class="glyphicon glyphicon-pencil"></i> <input id="country"
							name="country" placeholder="" class="form-control text-center"
							type="text" />
					</div>
				</div>
			</div>


			<hr>
			<div class="form-group row">
				<div class="col-md-8 text-center">
					<input type="submit" id="save" value="Register" name="save"
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
