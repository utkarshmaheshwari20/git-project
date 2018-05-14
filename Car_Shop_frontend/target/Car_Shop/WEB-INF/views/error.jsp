<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>403 error</title>
<link href="https://fonts.googleapis.com/css?family=Ropa+Sans" rel="stylesheet">
<style>
body{
    font-family: 'Ropa Sans', sans-serif;
    margin-top: 30px;
    background-color: #F0CA00;
    background-color: #F3661C;
    text-align: center;
    color: #fff;
}
.error-heading{
    margin: 50px auto;
    width: 250px;
    border: 5px solid #fff;
    font-size: 126px;
    line-height: 126px;
    border-radius: 30px;
    text-shadow: 6px 6px 5px #000;
}
.error-heading img{
    width: 100%;
}
.error-main h1{
    font-size: 72px;
    margin: 0px;
    color: #F3661C;
    text-shadow: 0px 0px 5px #fff;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>

	<div class="error-main">
		<h1>Oops!</h1>
		<div class="error-heading">403</div>
		<p>You do not have permission to access the document or program
			that you requested.</p>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>