<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Create Customer | CRUD WEB APP</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">


</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><h4>CRUD WEB APP</h4></a>
				</div>




			</div>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">


				</ul>
				<br> <br> <br>
				<ul class="nav navbar-nav">
					<li ><a
						href="${pageContext.request.contextPath}/"> <strong>Home</strong></a></li>
					<li><sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="${pageContext.request.contextPath}/customermanagement">
								<Strong>Customer Manager</Strong>
							</a>
						</sec:authorize></li>
					<li><a href="${pageContext.request.contextPath}/about"> <Strong>About</Strong>
					</a></li>

					<!-- login -->
					<li><sec:authorize access="!isAuthenticated()">
							<a class="log" href="${pageContext.request.contextPath}/login">
								<Strong>Login</Strong>
							</a>
						</sec:authorize></li>


					<!-- logout -->
					<li><sec:authorize access="isAuthenticated()">
							<a class="logt"
								href="javascript:document.getElementById('logout').submit()"><Strong>Logout</Strong></a>
						</sec:authorize></li>

					<c:url value="/logout" var="logoutUrl" />
					<form id="logout" action="${logoutUrl}" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

				</ul>

			</div>
		</div>
		</nav>

	</div>




	<!-- Custom Code Starts Here -->
	<div class="container">
		<div class="page-header"></div>
		<div class="well well-lg">
			<h3 class="text-center text-primary">Create a New Customer</h3>

		</div>


		<div class="col-lg-2"></div>

		<div class="col-lg-8 well well-sm text-left ">
			<h4 class="text-primary text-center">
				<strong>Customer Registration </strong> <br>
				<br>
			</h4>
			<form:form class="form" onsubmit="return validateForm()"
				action="${pageContext.request.contextPath}/create" id="create"
				modelAttribute="customer" method="POST">

				<form:hidden path="id" />
				<dt class="text-primary">First Name:</dt>
				<form:input path="firstName"  cssClass="form-control"/>
				
				<form:errors path="firstName" cssClass="text-danger" >
				</form:errors>
			<br/>
				
				<dt class="text-primary">Last Name:</dt>
				<form:input path="lastName"  cssClass="form-control" />
				<form:errors path="lastName" cssClass="text-danger"></form:errors>
				<br/>
				<dt class="text-primary">Email:</dt>
				<form:input path="email"  cssClass="form-control"/>
				<form:errors path="email" cssClass="text-danger"></form:errors>
				<p class="text-danger">${mes}</p>
				<br/>
				<dt class="text-primary">Address:</dt>
				<form:textarea path="address" rows="5" cssClass="form-control" />
					<form:errors path="address" cssClass="text-danger"></form:errors>
				<br/>
				<dt class="text-primary">Mobile Number:</dt>
				<form:input path="mobile_no" cssClass="form-control" />
				<form:errors path="mobile_no" cssClass="text-danger"></form:errors>
				<br>
				<dt class="text-primary">Active or Inactive: <form:select path="enabled" cssClass="text-warning">
					<option value="false">False</option>
					<option value="true">True</option>
				</form:select></dt>
				

				<br>
				<br>
				
				  
				<input type="submit" value="Register" class="btn btn-primary pull-center" /> 
			</form:form>





		</div>
		<div class="col-sm-2"></div>
	</div>
	<!-- Custom Code Ends Here -->






	<hr class="featurette-divider">
	<!-- START THE FEATURETTES -->



	<!-- /END THE FEATURETTES -->


	<!-- FOOTER -->
	<footer>
	<p class="pull-right">
		<a href="#">Back to top</a>
	</p>
	<p>
		&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a
			href="#">Terms</a>
	</p>
	</footer>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/vendor/jquery.min.js"><\/script>')</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script>
		$("tr:even").css("background-color", "#DFE8DC");
		
		 function validateForm() {

			
			
		}


	
		
	</script>
	
</body>
</html>