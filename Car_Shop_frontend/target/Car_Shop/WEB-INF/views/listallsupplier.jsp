<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-wrapper">
		<div class="container-fluid">
			<h2>Supplier Details</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Supplier Id</th>
						<th>Name</th>
						<th>Contact Number</th>
						<th>Address</th>
					</tr>
				</thead>
				<c:forEach items="${slist}" var="supplier">
					<tr>
						<td>${supplier.supplierId}</td>
						<td>${supplier.supplierName}</td>
						<td>${supplier.supplierNo}</td>
						<td>${supplier.supplierAdd}</td>

						<td><c:url
								value="/admin/supplier/editsupplier/${supplier.supplierId}" var="edit"></c:url>
							<a href="${edit}"><span class="glyphicon glyphicon-pencil"></span></a>
							<c:url value="/admin/supplier/removesupplier/${supplier.supplierId}"
								var="remove"></c:url> <a href="${remove}"><span
								class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
			<center><a type="button" class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/admin/supplier">Click here to add Supplier</a></center>
		</div>
	</div>
<br>
<br>

</body>
<%@ include file="footer.jsp"%>
</html>