
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="utf-8">
<title>ECRA by IACSD</title>
<link rel="stylesheet" href="<spring:url value='/css/index.css'/>" />
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
	<form class="box" action="login" method="post">
		<h1>SIGN IN</h1>
		<h5
			style="color: green; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.message}</h5>
		<h5
			style="color: red; background-color: white; margin-right: 50px; margin-left: 50px;">${requestScope.error}</h5>
		<input type="text" name="email" placeholder="Email"> <input
			type="password" name="password" placeholder="Password"> <input
			type="submit" value="Sign In"> <a class="anchor"
			href='<spring:url value="/registration"/>'>Register New User</a><br>

	</form>


	<div class="footer">
		<p>All Rights Reserved for @2022 IACSD PUNE</p>
	</div>
</body>
</html>
