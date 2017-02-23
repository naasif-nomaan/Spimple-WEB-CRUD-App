<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Customer Management | CRUD WEB APP</title>

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
				<br>
				<br>
				<br>
				<ul class="nav navbar-nav">
					<li ><a
						href="${pageContext.request.contextPath}/"> <strong>Home</strong></a></li>
					<li class="active" ><c:if
							test="${pageContext.request.userPrincipal.name != null}">
							<a href="${pageContext.request.contextPath}/customermanagement">
								<Strong>Customer Manager</Strong>
							</a>
						</c:if></li>
					<li><a href="${pageContext.request.contextPath}/about"> <Strong>About</Strong>
					</a></li>

					<!-- login -->
                   <li><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a class="log" href="${pageContext.request.contextPath}/login">
								<Strong>Login</Strong>
							</a>
						</c:if></li>


					<!-- logout -->
					<li><c:if
							test="${pageContext.request.userPrincipal.name != null}">
							<a class="logt"
								href="javascript:document.getElementById('logout').submit()"><Strong>Logout</Strong></a>
						</c:if></li>
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
			<h3 class="text-center text-primary">Customer Management</h3>

		</div>
		

		<div class="col-lg-3"></div>

		<div class="col-lg-6 well well-sm text-left ">
			<a type="button" href="${pageContext.request.contextPath}/createcustomer" class="btn btn-primary btn-lg btn-block">Create New Customer</a>
			
              <a type="button" href="${pageContext.request.contextPath}/editcustomer" class="btn btn-primary btn-lg btn-block">Edit Customer</a>	
					
				
		</div>
		<div class="col-sm-3"></div>
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
	</script>
	
</body>
</html>