
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>

		</ol>
		<div class="row">
			<div class="col-xl-3 col-sm-6 mb-3">
				<div class="card text-white bg-primary o-hidden h-100">
					<div class="card-body">
						<div class="card-body-icon">
							<i class="fa fa-fw fa-comments"></i>
						</div>
						<div class="mr-5">My Profile</div>
					</div>
					<a class="card-footer text-white clearfix small z-1"
						href='<spring:url value="/Hospital/hospitalprofile"/>'> <span
						class="float-left">Edit</span> <span class="float-right"> <i
							class="fa fa-angle-right"></i>
					</span>
					</a>
				</div>
			</div>




		</div>
	</div>
</div>
