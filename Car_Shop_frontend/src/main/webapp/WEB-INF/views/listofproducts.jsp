<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Page</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Product Id</th>
					<th>Car Name</th>
					<th>Brand Name</th>
					<th>On Road Price</th>
					<th>Category</th>
					<th>Supplier</th>
					<th width="15%">Image</th>
					<th width="20%">Description</th>
				</tr>
			</thead>
			<c:forEach items="${plist}" var="product">
				<tr>
					<td>${product.productId }</td>
					<td>${product.productName }</td>
					<td>${product.productBrandName }</td>
					<td>${product.productPrice }</td>
					<td>${product.category.categoryName }</td>
					<td>${product.supplier.supplierName }</td>
					<td><c:forTokens var="token" items="${product.imgNames}" delims=",">
							<c:out value="${token}" />
						<img class="img-thumbnail" style="width:40%" src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
							
							<br>
						</c:forTokens></td>

					<td>${product.productDescription }</td>
					<c:url value="/admin/products/viewproduct/${product.productId}"
						var="view"></c:url>
					<td><a href="${view}"><span
							class="glyphicon glyphicon-info-sign"></span></a> <c:url
							value="/admin/products/removeproduct/${product.productId}" var="remove"></c:url>
						<a href="${remove}"><span class="glyphicon glyphicon-remove"></span></a>
						<c:url value="/admin/products/editproduct/${product.productId}"
							var="edit"></c:url> <a href="${edit}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>
		</table>
		<a type="button" class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/admin/products/addproductform">Add
			Product</a>
	</div>
	<br>
	<br>
</body>
<%@ include file="footer.jsp"%>
</html>