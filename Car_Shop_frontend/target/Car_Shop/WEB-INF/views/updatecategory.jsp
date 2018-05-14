<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-wrapper">
		<div class="container-fluid">
			<form:form modelAttribute="ucat"
				action="${pageContext.request.contextPath}/admin/category/updateCategory" method="post">
				<div class="form-group">
					<form:hidden path="categoryId" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="categoryName">New Category Name: </form:label>
					<form:input path="categoryName" class="form-control" />
				</div>
				<input type="submit" class="btn btn-primary" value="Update Category" />
			</form:form>
		</div>
	</div>

	<br>
	<br>
</body>
<%@ include file="footer.jsp"%>
</html>