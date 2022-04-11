
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.Cart-Items {
	margin: auto;
	width: 90%;
	height: 30%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.image-box {
	width: 15%;
	text-align: center;
}

.about {
	height: 100%;
}

.title {
	padding-top: 5px;
	line-height: 10px;
	font-size: 32px;
	font-family: ‘Open Sans’;
	font-weight: 800;
	color: #202020;
}

.subtitle {
	line-height: 10px;
	font-size: 18px;
	font-family: ‘Open Sans’;
	font-weight: 600;
	color: #909090;
}
</style>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Accidents</a></li>

			<li class="breadcrumb-item active">Find Hospital</li>

			<a class="btn btn-primary right"
				href='<spring:url value="/User/dashboard"/>'>Back</a>
			</li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Nearest Hospital List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${sessionScope.success}</h3>

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
				<hr>

				<div class="container"
					style="width: 70%; height: 90%; background-color: #ffffff; border-radius: 20px; box-shadow: 0px 25px 40px #1687d933;">

					<br>
					<table>
					<td>
						<div class="card" style="width: 100%; margin-left: 2px;">
							<img class="card-img-top"
								src="data:image/jpeg;base64,${sessionScope.nearestHospitals.imgUtility}"
								style="width: 200px; height: 200px;">
					</td>
					<td>
						<div class="card-body">
							<h4 class="card-title" style="margin: 20px; float: right;">${sessionScope.nearestHospitals.name}</h4>
							<p class="card-text">Contact
								:${sessionScope.nearestHospitals.mobile}/ ${hospital.altMobile}</p>
							<a
								href='<spring:url value="https://maps.google.com/maps?q=${sessionScope.nearestHospitals.hospitalCoordinates.latitude},${sessionScope.nearestHospitals.hospitalCoordinates.longitude}"/>'
								class="btn btn-primary">Get Direction</a>
						</div>

						</div>
					</td>
					<hr>
				</table>
				</div>

			</div>
		</div>
	</div>
</div>