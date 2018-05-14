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
			<form:form modelAttribute="usup"
				action="${pageContext.request.contextPath}/admin/supplier/updateSupplier" method="post">
				<div class="form-group">
					<form:hidden path="supplierId" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="supplierName">New Supplier Name: </form:label>
					<form:input path="supplierName" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="supplierNo">Contact Number: </form:label>
					<form:input path="supplierNo" class="form-control" />
				</div><div class="form-group">
					<form:label path="supplierAdd">Address: </form:label>
					<form:input path="supplierAdd" class="form-control" />
				</div>
				<input type="submit" class="btn btn-primary" value="Update Supplier" />
			</form:form>
		</div>
	</div>

	<br>
	<br>
</body>
<%@ include file="footer.jsp"%>
</html>