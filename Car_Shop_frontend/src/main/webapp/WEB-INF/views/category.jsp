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
			<form:form method="POST"
				action="${pageContext.request.contextPath}/admin/category/addCategory" modelAttribute="command">
				<div class="form-group">
					<form:hidden path="categoryId" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="categoryName">Category: </form:label>
					<form:input path="categoryName" class="form-control" />
				</div>
				<input type="submit" class="btn btn-primary" value="Add Category" />
			</form:form>
		</div>
	</div>
	<div>
	<h3 style="color:MediumSeaGreen; text-indent: 1em;">${success}</h3>
	</div>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Category Id</th>
					<th>Category Type</th>
				</tr>
			</thead>
			<c:forEach items="${clist}" var="category">
				<tr>
					<td>${category.categoryId}</td>
					<td>${category.categoryName}</td>
					<td>
						<c:url value="/admin/category/editcategory/${category.categoryId}" var="edit"></c:url>
						<a href="${edit}"><span class="glyphicon glyphicon-pencil"></span></a> 
						<c:url value="/admin/category/removecategory/${category.categoryId}" var="remove"></c:url> 
						<a href="${remove}"><span class="glyphicon glyphicon-remove"></span></a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<br>

</body>
<%@ include file="footer.jsp"%>
</html>