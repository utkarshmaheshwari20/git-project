<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN PAGE</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">

	<h1>Welcome to admin page</h1>
	<div class="row">
	<li><a type="button" class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/admin/products">Click here to view all products</a><br><br></li>
	<li><a type="button" class="btn btn-danger btn-lg" href="${pageContext.request.contextPath}/admin/category">Click here to view category section</a><br><br></li>
	<li><a type="button" class="btn btn-warning btn-lg" href="${pageContext.request.contextPath}/admin/supplier">Click here to view supplier section</a><br><br></li>
</div>
</div>
</body>
<%@ include file="footer.jsp"%>
</html>