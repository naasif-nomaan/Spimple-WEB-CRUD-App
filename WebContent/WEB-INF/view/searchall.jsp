<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Search Result | CRUD WEB APP</title>

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
			<h3 class="text-center text-primary">Search into Database</h3>

		</div>




		<div class="col-lg-12 well well-sm text-left ">
			<form:form action="searchall" method="POST">
				Search Customer: <input type="textbox" name="theSearchName" />

				<input type="submit" value="Search" class="btn btn-primary btn-sm" />
			</form:form>
			<c:if test="${msg.equals('Please Write Something to search!')}">
				<h5 class="text-danger text-left">
					<strong>${msg}</strong>
				</h5>
			</c:if>
			<c:if
				test="${msg.equals('Please Write Something to search!')==false}">
				<h5 class="text-info text-left">
					Search Result for :<strong class="text-success">${msg}</strong>
				</h5>
			</c:if>
			<h4 class="text-primary text-center">
				<strong>Search Result</strong> <br>
				<br>
			</h4>
			<c:if test="${customers.size()==0}">
				<h5 class="text-warning text-center">
					<strong>Nothing Found!</strong>
				</h5>
			</c:if>
			<table id="table" class="table table-hover">
				<a class="btn btn-primary btn-sml pull-right" type="button"
					href="${pageContext.request.contextPath}/editcustomer">Back to
					Editor Table</a>
				<br>
				<br>
				<tr class="text-primary info">
					<th class="text-center ">First Name</th>
					<th class="text-center">Last Name</th>
					<th class="text-center">Email</th>
					<th class="text-center">Mobile Number</th>
					<th class="text-center">Address</th>
					<th class="text-center">Enabled</th>
					<th class="text-center">Edit or Delete</th>
				</tr>

				<c:forEach var="tempCustomer"  varStatus="status" items="${customers}">
					<tr class="text-center ">
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>${tempCustomer.mobile_no}</td>
						<td>${tempCustomer.address}</td>
						<td>${tempCustomer.enabled}</td>
						<td><c:url var="updateLink" value="/editcustomerby">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url> <c:url var="deleteLink" value="/deleteLink">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url> <a  href="javascript:document.getElementById('${555+tempCustomer.id}').submit()">Edit</a> | <a href="javascript:document.getElementById('${666+tempCustomer.id}').submit()"
							onclick="if (!(confirm('Are you sure you want to delete this Customer?'))) return false">
								Delete</a></td>
					</tr>


                    <form:form  id="${555+tempCustomer.id}" modelAttribute="customer" action="${pageContext.request.contextPath}/editcustomerby" method="POST">
					        
							<form:hidden path="id" value="${tempCustomer.id}"/>
					</form:form>
					
					<form:form   id="${666+tempCustomer.id}" modelAttribute="customer" action="${pageContext.request.contextPath}/deleteLink" method="POST">
					        
							<form:hidden path="id" value="${tempCustomer.id}"/>
					</form:form>
					
				</c:forEach>



			</table>



		</div>

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