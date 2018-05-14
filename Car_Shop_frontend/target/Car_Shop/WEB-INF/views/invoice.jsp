<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INVOICE</title>
<style type="text/css">
.invoice-title h2, .invoice-title h3 {
	display: inline-block;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.table>thead>tr>.no-line {
	border-bottom: none;
}

.table>tbody>tr>.thick-line {
	border-top: 2px solid;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="invoice-title">
					<h2>Invoice</h2>
					<h3 class="pull-right">Order # ${order.orderId}</h3>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-6">
						<address>
							<strong>Billed To:</strong><br> ${order.user.name}<br>
							<c:forTokens var="token" items="${order.user.address}" delims=",">
    					${token}<br>
							</c:forTokens>
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<address>
							<strong>Billed To:</strong><br> ${order.user.name}<br>
							<c:forTokens var="token" items="${order.user.address}" delims=",">
    					${token}<br>
							</c:forTokens>
						</address>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<address>
							<strong>Payment Method:</strong><br> Visa-
							${order.payment.cardNumber}<br> ${order.user.emailId}
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<address>
							<strong>Order Date:</strong><br>
							<%
								Date dNow = new Date();
								SimpleDateFormat ft = new SimpleDateFormat("dd-MMM-yyyy");
								out.print(ft.format(dNow));
							%><br> <br>
						</address>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>Order summary</strong>
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-condensed">
								<thead>
									<tr>
										<td><strong>Product</strong></td>
										<td class="text-center"><strong>Price</strong></td>
										<td class="text-center"><strong>Quantity</strong></td>
										<td class="text-right"><strong>Totals</strong></td>
									</tr>
								</thead>
								<c:set var="total" value="${0}" />
									<c:forEach items="${cart}" var="cart">
										<c:set var="total"
											value="${total + cart.cartQuantity * cart.cartPrice}"></c:set>
									</c:forEach>
								<tbody>
									<c:forEach items="${cart}" var="cart">
										<tr>
											<td>${cart.cartProductName}</td>
											<td class="text-center">&#8377 ${cart.cartPrice}</td>
											<td class="text-center">${cart.cartQuantity}</td>
											<td class="text-right">&#8377 ${cart.cartQuantity * cart.cartPrice}</td>
										</tr>
									</c:forEach>
									
									<tr>
										<td class="thick-line"></td>
										<td class="thick-line"></td>
										<td class="thick-line text-center"><strong>Total</strong></td>
										<td class="thick-line text-right">&#8377 ${total}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/ackAction" class="btn btn-success btn-block">Continue
							<i class="fa fa-angle-right"></i></a>
	</div>
	<br>
	<br>
</body>
<%@ include file="footer.jsp"%>
</html>