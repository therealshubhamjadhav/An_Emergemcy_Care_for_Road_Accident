
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="utf-8">
<title>ECRA by IACSD</title>
<link rel="stylesheet" href="<spring:url value='/css/register.css'/>" />
<link rel="stylesheet" href="<spring:url value='/css/nav.css'/>" />
</head>
<body>
	<div
		style="border: 2px solid black; background-color: gray; color: white;">


		<p style="font-size: 28px; float: left; margin-left: 10px;">
			Emergency Care For Road Accidents</p>
		<p style="font-size: 28px; margin-left: 55%;">
			<a class="showbutton active" href='<spring:url value="/"/>'>Home</a>
			<a class="showbutton" href='<spring:url value="/about"/>'>About</a> <a
				class="showbutton" href='<spring:url value="/informaccident"/>'>Report
				Accident</a> <a class="showbutton"
				href='<spring:url value="/feedback"/>'>Feedback</a> <a
				class="showbutton" href='<spring:url value="/signin"/>'>Sign In</a>

			<a class="showbutton" href='<spring:url value="/registration"/>'>Register</a>
		</p>
	</div>
	<form class="box" method="post">
		<h5
			style="color: green; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.message}</h5>
		<h5
			style="color: red; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.error}</h5>
		<div class="box1">
			<h1>Contact Information</h1>
			<input id="name" name="name" placeholder="Full Name" type="text" />
			<input maxlength="10" name="mobile" placeholder="Mobile Number"
				type="text" /> <input name="email" placeholder="Email" type="text" />
			<input name="password" placeholder="Password" type="password" /> <input
				name="cpassword" placeholder="Confirm Password" type="password" />
		</div>
		<div class="box2">
			<h1>Address Information</h1>
			<input name="country" placeholder="Country" type="text" /> <input
				name="state" placeholder="State" type="text" /> <input name="city"
				placeholder="City" type="text" /> <input name="district"
				placeholder="District" type="text" /> <input name="add_ln"
				placeholder="Address" type="text" /> <input name="pin_code"
				placeholder="Pin Code" type="text" />
		</div>

		<div class="buttonspace">
			<input type="submit" value="Register Your Self" onclick=validate()>
		</div>
		<a class="anchor" href='<spring:url value="/"/>'>Back To Sign In</a>
	</form>
	<script>
	function validate(){
		
	var name=document.getElementById('name').value;
	if(isNaN!(name)){
		alert("Please Enter Valid Name");
	}
	}
	</script>

	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>