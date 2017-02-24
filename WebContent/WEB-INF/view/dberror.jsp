<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Database Error</title>
</head>
<body>
<h3>Unexpected database error!!</h3>
<a href="${pageContext.request.contextPath}/">Go back to Homepage</a>
</body>
</html>