<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

body {
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

</style>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">

		<div class="row">
			<aside class="col-sm-6 border-right">
				<div class="preview col-md-12">

					<div class="preview-pic tab-content" style="height: 380px">

						<c:forTokens var="token" items="${product.imgNames}" delims=","
							varStatus="status">
							<c:choose>
								<c:when test="${status.count == 1}">
									<div class="tab-pane active" id="pic-${status.count}">
										<img
											src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
									</div>
								</c:when>
								<c:otherwise>
									<div class="tab-pane" id="pic-${status.count}">
										<img
											src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
									</div>
								</c:otherwise>
							</c:choose>
						</c:forTokens>
					</div>
					<ul class="preview-thumbnail nav nav-tabs container-fluid">
						<c:forTokens var="token" items="${product.imgNames}" delims=","
							varStatus="status">
							<c:choose>
								<c:when test="${status.count == 1}">
									<li class="active"><a data-target="#pic-${status.count}"
										data-toggle="tab"> <img
											src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a data-target="#pic-${status.count}"
										data-toggle="tab"> <img
											src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
									</a></li>
								</c:otherwise>
							</c:choose>
						</c:forTokens>
					</ul>

					<!-- slider-product.// -->
				</div>
				<!-- gallery-wrap .end// -->
			</aside>
			<aside class="col-sm-6">
				<article class="card-body-lg">
					<h2 class="title mb-3">${product.productName }</h2>

					<p class="price-detail-wrap">
						<span class="price h3 text-warning"> <span class="currency">INR
								&#8377;</span><span class="num">${product.productPrice}</span></span>
					</p>
					<!-- price-detail-wrap .// -->
					<dl class="item-property">
						<dt>Description</dt>
						<dd>
							<p>${product.productDescription}</p>
						</dd>
					</dl>
					<dl class="param param-feature">
						<dt>Model#</dt>
						<dd>${product.productName}</dd>
					</dl>
					<!-- item-property-hor .// -->
					<dl class="param param-feature">
						<dt>Company</dt>
						<dd>${product.productBrandName}</dd>
					</dl>
					<!-- item-property-hor .// -->
					<dl class="param param-feature">
						<dt>Category</dt>
						<dd>${product.category.categoryName}</dd>
					</dl>
					<!-- item-property-hor .// -->

					<!-- row.// -->
					<hr>
					<div class="container-wrapper">
						<form action="${pageContext.request.contextPath}/addToCart"
							method="post">
							<input type="hidden" name="cartProductId"
								value="${product.productId}"> 
								<input type="hidden"
								name="cartPrice" value="${product.productPrice}">
							<div class="row">
								<div class="col-sm-5">
									<dl class="param param-inline">
										<dt>Quantity:</dt>
										<dt>
											<input type="number" name="cartQuantity" style="width: 80px"
												class="form-control text-center" value="1">
										</dt>
									</dl>
									<!-- item-property .// -->
								</div>
								<!-- col.// -->
							</div>
							<c:forTokens var="token" items="${product.imgNames}" delims=","
								varStatus="status">
								<c:if test="${status.count == 1}">
									<input type="hidden" name="cartImage" value="${token}">
								</c:if>
							</c:forTokens>
							<input type="hidden" name="cartProductName"
								value="${product.productName}">
							<hr>
							<h3>${message}</h3>
							<a href="#" class="btn btn-lg btn-primary text-uppercase">
								Buy now </a>
							<button type="submit" id="submit"
								class="btn btn-lg btn-warning text-uppercase">Add to
								cart</button>
						</form>
					</div>
					
				</article>
				<!-- card-body.// -->
			</aside>
			<!-- col.// -->
		</div>
		<!-- row.// -->
	</div>
	<!-- card.// -->

	<br>
	<br>
	<br>
</body>
<%@include file="footer.jsp"%>
</html>