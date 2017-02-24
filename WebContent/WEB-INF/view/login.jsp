<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Login Page</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">



</head>
<body onload='document.f.username.focus();'>
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
					<li><a href="${pageContext.request.contextPath}/"> <strong>Home</strong></a></li>
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

	<div class="container">
		<div class="page-header"></div>
		<div class="well well-sm">
			<h3 class="text-center text-primary">Login Page</h3>

		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4 text-left ">


			<form onsubmit="return validateForm()" name='f'
				action='${pageContext.request.contextPath}/login' method='POST'>
				<c:if test="${param.error!=null}">
					<p class="text-danger">Invalid username and password!! Try
						again.</p>
				</c:if>
				<div class="form-group">
					<h4>
						<strong class="text-primary">Email or Username : </strong>
					</h4>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input type='text'
							name='username' value='' class="form-control">

					</div>
					<h4>
						<strong class="text-primary">Password : </strong>
					</h4>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input type='password'
							name='password' class="form-control" />

					</div>
					<br>
					
					<div class="input-group">
						  <strong class="text-primary"><input type="checkbox" name="remember-me" checked="checked" />Remember Me</strong>
                       
					</div>
					<div class="input-group pull-right">

						<input name="submit" class="btn btn-primary" type="submit"
							value="Login" /> <input name="_csrf" type="hidden"
							value="${_csrf.token}" />

					</div>

				</div>





			</form>
		</div>
		<div class="col-sm-3"></div>
	</div>
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
	<script>window.jQuery || document.write('<script src="js/vendor/jquery.min.js"></script>
	</script>
	<script>
 function validateForm() {
    var x =  document.getElementById("login-email").value;
	var p =  document.getElementById("login-password").value;
	
	
	 var ap = p.lastIndexOf(" ");

	 var cp="false";
	 var ce="false";
	
	if(ap>=0){
	
	document.getElementById("passwordvalidation").setAttribute("class", "text-danger");
	 document.getElementById("passwordvalidation").innerHTML ="Space shouldn't be here ";
	  cp="false"
	 
	}else{
	     if(p.length<5){
	document.getElementById("passwordvalidation").setAttribute("class", "text-danger");
	 document.getElementById("passwordvalidation").innerHTML ="Password must be at least 5 character";
	 cp="false"
	 
	}
     if(p.length>=5){
	
	document.getElementById("passwordvalidation").setAttribute("class", "text-danger");
	 document.getElementById("passwordvalidation").innerHTML ="";
	 cp="true";
	
	}
	if(p==""){
	
	document.getElementById("passwordvalidation").setAttribute("class", "text-danger");
	 document.getElementById("passwordvalidation").innerHTML =" Password Shouldn't be empty";
	  cp="false"
	}
	}
	
	if(x==""){
	
	document.getElementById("emailvalidation1").setAttribute("class", "text-danger");
	 document.getElementById("emailvalidation1").innerHTML ="Email shouldn't be empty";
	  ce="false"
	}else{
	    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	
	document.getElementById("emailvalidation1").setAttribute("class", "text-danger");
       document.getElementById("emailvalidation1").innerHTML ="Required a valid email";
        ce="false"
    }else{
	
	document.getElementById("emailvalidation1").setAttribute("class", "text-success");
	 document.getElementById("emailvalidation1").innerHTML ="";
	 
        ce="true"
	}
	}
	
	if(cp=="true" && ce=="true"){
	 return true;
	}else{
	return false;
	}
	
	
	
}


</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->