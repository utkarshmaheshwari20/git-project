<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD CAR FORM</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-wrapper">


		<form class="form-horizontal"
			action="${pageContext.request.contextPath}/admin/products/updateProduct"
			enctype="multipart/form-data" method="post">
			<fieldset>
				<div class="container-fluid">
					<!-- Form Name -->
					<h3>Update Product Details</h3>

					<!-- Text input-->
					<div class="form-group">

						<input type="hidden" name="productId" value="${p.productId}"
							class="form-control input-md">

					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="product_name">CAR
							NAME</label>
						<div class="col-md-4">
							<input id="productName" name="productName"
								value="${p.productName}" placeholder="eg. veyron"
								class="form-control input-md" required="" type="text">

						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="product_name">BRAND
							NAME</label>
						<div class="col-md-4">
							<input id="productBrandName" name="productBrandName"
								value="${p.productBrandName}" placeholder="eg. bugatti"
								class="form-control input-md" required="" type="text">

						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="product_categorie">PRODUCT
							CATEGORY</label>
						<div class="col-md-4">
							<select name="categoryId" class="form-control">
								<option value="NONE">---SELECT---</option>
								<c:forEach items="${catopt}" var="op">
									<option value="${op.categoryId}">${op.categoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label">PRODUCT SUPPLIER</label>
						<div class="col-md-4">
							<select name="supplierId" class="form-control">
								<option value="NONE">---SELECT---</option>
								<c:forEach items="${supopt}" var="op">
									<option value="${op.supplierId}">${op.supplierName}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="on_road_price">On
							Road Price</label>
						<div class="col-md-4">
							<input id="productPrice" name="productPrice"
								value="${p.productPrice }" placeholder=" ON ROAD PRICE"
								class="form-control input-md" required="" type="text">

						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="image">Add Images</label>
						<div class="col-md-4">
							<input id="imgName" name="images" 
								class="form-control input-md" type="file" multiple="multiple"/>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="product_description">DESCRIPTION</label>
						<div class="col-md-4">
							<textarea class="form-control" id="productDescription"
								name="productDescription">${p.productDescription}</textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12">
							<center>
								<button type="submit" id="submit" class="btn btn-success">Update
									Product</button>
							</center>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>