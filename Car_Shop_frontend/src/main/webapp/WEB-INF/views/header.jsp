<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<link
	href="${pageContext.servletContext.contextPath}/resources/css/header.css"
	rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script src="<c:url value="/resources/js/header.js" />"></script>


</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/home"><b>CarShop</b></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">


			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a
					href="${pageContext.request.contextPath}/home">Buy A Car</a></li>
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name!= null}">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Welcome,	${user.name}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/userDetails/${user.userId}">My Account</a></li>
								<li><a href="${pageContext.request.contextPath}/myCart">My Cart</a></li>
							</ul></li>

						<c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
							<li><a href="${pageContext.request.contextPath}/admin">Admin
									Page</a></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/signup">Sign
								Up</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Sign In <b class="caret"></b></a>
							<ul class="dropdown-menu"
								style="padding: 15px; min-width: 250px;">
								<li>
									<div class="row">
										<div class="col-md-12">
											<form
												action='<c:url value="/j_spring_security_check" ></c:url>'
												class="form-signin" method="post" accept-charset="UTF-8"
												id="login-nav">
												<div class="form-group">
													<label class="sr-only" for="exampleInputEmail2">Email
														address</label> <input type="email" class="form-control"
														id="exampleInputEmail2" name="username" class="login_box"
														placeholder="email" required>
												</div>
												<div class="form-group">
													<label class="sr-only" for="exampleInputPassword2">Password</label>
													<input type="password" class="form-control"
														id="exampleInputPassword2" name="password"
														placeholder="password" required>
												</div>
												<div class="checkbox">
													<label> <input type="checkbox"> Remember me
													</label>
												</div>
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<div class="form-group">
													<button type="submit" class="btn btn-success btn-block">Log
														In</button>
												</div>
											</form>
										</div>
									</div>
								</li>
							</ul></li>

					</c:otherwise>
				</c:choose>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">More <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="aboutus">About Us</a></li>
						<li><a href="contactus">Contact Us</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>

</body>
</html>