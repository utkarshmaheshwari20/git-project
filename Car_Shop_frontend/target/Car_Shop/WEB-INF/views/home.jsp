<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CarShop</title>
</head>

<body>

	<div id="myCarousel" class="carousel slide margin-t70"
		data-interval="false">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="${pageContext.servletContext.contextPath}/resources/images/veyron-1.jpg" class="img-responsive">
				<div class="container">
					<div class="caraous-title">
						<div class="col-md-12">
							<div class="col-md-6">
								<span>VEYRON</span>
								<h1>
									Choose Your<br> Dream Car with us
								</h1>
								<h3>Our Promise to Complete Happiness & Satisfaction</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.servletContext.contextPath }/resources/images/aventador-1.jpg"
					class="img-responsive">
				<div class="container">
					<div class="caraous-title">
						<div class="col-md-12">
							<div class="col-md-6">
								<span>AVENTADOR</span>
								<h1>
									Choose Your<br> Dream Car with us
								</h1>
								<h3>Our Promise to Complete Happiness & Satisfaction</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.servletContext.contextPath }/resources/images/dzire-1.jpg"
					class="img-responsive">
				<div class="container">
					<div class="caraous-title">
						<div class="col-md-12">
							<div class="col-md-6">
								<span>DZIRE</span>
								<h1>
									Choose Your<br> Dream Car with us
								</h1>
								<h3>Our Promise to Complete Happiness & Satisfaction</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</div>
	<div class="tabs-area area-padding">
		<div class="container">
			<div class="row">
				<div class="site-heading ">
					<h2>Car Shorted By Category</h2>
					<p>Get Your Dream Car Is Here</p>
					<div class="divider"></div>
				</div>
			</div>
			<div class="row">
				<ul class="nav nav-tabs">
					<c:forEach items="${clist}" var="c" begin="0" end="0">
						<li class="active"><a data-toggle="tab"
							href="#${c.categoryId}">${c.categoryName }</a></li>
					</c:forEach>
					<c:forEach items="${clist}" var="c" begin="1" end="10">
						<li><a data-toggle="tab" href="#${c.categoryId}">${c.categoryName }</a></li>
					</c:forEach>
				</ul>
				<div class="tab-content">
					<c:forEach items="${clist}" var="c" begin="0" end="0">
						<div id="${c.categoryId}" class="tab-pane fade in active">
							<div class="row">
								<c:forEach items="${c.products}" var="p">
									<div class="col-md-3 text-center">
										<div class="used-cars-box">
											<div class="used-cars-img">
												<c:forTokens var="token" items="${p.imgNames}" delims=","
													begin="0" end="0">
													<img class="img-responsivel" style="width: 100%; height: 150px"
														src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
												</c:forTokens>
											</div>
											<div class="used-cars-title">
												<h3>${p.productName}</h3>
												<h4>Rs.${p.productPrice} Lakh</h4>
											</div>
											<a type="button" class="btn site-btn"
												href="${pageContext.request.contextPath}/productdetails/${p.productId}">Get
												On Road Price</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
					<c:forEach items="${clist}" var="c" begin="1" end="10">
					<div id="${c.categoryId}" class="tab-pane fade">
							<div class="row">
								<c:forEach items="${c.products}" var="p">
									<div class="col-md-3 text-center">
										<div class="used-cars-box">
											<div class="used-cars-img">
												<c:forTokens var="token" items="${p.imgNames}" delims=","
													begin="0" end="0">
													<img class="img-responsivel" style="width: 100%; height: 150px"
														src="${pageContext.servletContext.contextPath }/resources/images/${token}" />
												</c:forTokens>
											</div>
											<div class="used-cars-title">
												<h3>${p.productName}</h3>
												<h4>Rs.${p.productPrice} Lakh</h4>
											</div>
											<a type="button" class="btn site-btn"
												href="${pageContext.request.contextPath}/productdetails/${p.productId}">Get
												On Road Price</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
</body>
<%@ include file="footer.jsp" %>
</html>