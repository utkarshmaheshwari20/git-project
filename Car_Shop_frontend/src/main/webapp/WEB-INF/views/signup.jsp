<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/registration-form-with-bootstarp.css">
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>Sign Up Page</h1>
			</div>
			<form:form class="form-horizontal" method="post"
				action="${pageContext.request.contextPath}/addUser">
				<form:hidden path="userId"></form:hidden>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name: </label>
					<div class="col-sm-6">
						<form:input path="name" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="age" class="col-sm-2 control-label">Age: </label>
					<div class="col-sm-6">
						<form:input path="age" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="" class="col-sm-2 control-label">Gender:</label>
					<div class="col-sm-6">
						<form:radiobutton class="radio-inline" path="gender" value="MALE"
							label="Male" />
						<form:radiobutton class="radio-inline" path="gender"
							value="FEMALE" label="Female" />

					</div>
				</div>

				<div class="form-group">
					<label for="address" class="col-sm-2 control-label">Address:</label>
					<div class="col-sm-6">
						<form:input path="address" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">EmailId:</label>
					<div class="col-sm-6">
						<form:input type="email" path="emailId" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="passwd" class="col-sm-2 control-label">Password:</label>
					<div class="col-sm-6">
						<form:password path="password" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary" id="register">Create
							My Account</button>
					</div>
				</div>

			</form:form>
		</div>
	</div>

</body>
<%@ include file = "footer.jsp" %>
</html>