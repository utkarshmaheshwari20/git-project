<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Cart</title>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
.table>tbody>tr>td, .table>tfoot>tr>td {
	vertical-align: middle;
}

@media screen and (max-width: 600px) {
	table#cart tbody td .form-control {
		width: 20%;
		display: inline !important;
	}
	.actions .btn {
		width: 36%;
		margin: 1.5em 0;
	}
	.actions .btn-info {
		float: left;
	}
	.actions .btn-danger {
		float: right;
	}
	table#cart thead {
		display: none;
	}
	table#cart tbody td {
		display: block;
		padding: .6rem;
		min-width: 320px;
	}
	table#cart tbody tr td:first-child {
		background: #333;
		color: #fff;
	}
	table#cart tbody td:before {
		content: attr(data-th);
		font-weight: bold;
		display: inline-block;
		width: 8rem;
	}
	table#cart tfoot td {
		display: block;
	}
	table#cart tfoot td .btn {
		display: block;
	}
}
</style>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartInfo}" var="cart">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img
										src="${pageContext.servletContext.contextPath }/resources/images/${cart.cartImage}"
										alt="..." class="img-responsive" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cart.cartProductName}</h4>
								</div>
							</div>
						</td>
						<td data-th="Price">${cart.cartPrice}</td>
						<td data-th="Quantity">${cart.cartQuantity}</td>
						<td data-th="Subtotal" class="text-center">${cart.cartQuantity * cart.cartPrice}</td>
						<td class="actions" data-th="">
							
							<a href="${pageContext.request.contextPath}/deletePCart/${cart.cartId}"><button
									class="btn btn-danger btn-sm">
									<i class="fa fa-trash-o"></i>
								</button> </a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<c:set var="total" value="${0}" />
				<c:forEach items="${cartInfo}" var="cart">
					<c:set var="total"
						value="${total + cart.cartQuantity * cart.cartPrice}"></c:set>
				</c:forEach>
				<tr>
					<td><a href="${pageContext.request.contextPath}/home"
						class="btn btn-warning"><i class="fa fa-angle-left"></i>
							Continue Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong><c:out
								value="${total}"></c:out></strong></td>
					<td><a href="${pageContext.request.contextPath}/checkout" class="btn btn-success btn-block">Checkout
							<i class="fa fa-angle-right"></i>
					</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
<%@include file="footer.jsp"%>
</html>