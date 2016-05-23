<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/docs.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/eventlist.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/bootstrap.min.css" />

		
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<!-- Header -->
			<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
			

		<!-- Main -->
			<div id="main">

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>이벤트 리스트</h2>
							</header>
							
							<div style= "width: 100%; padding: 10px; margin-bottom: 10px; margin-top: 10px">
								<button class="btn btn-lg btn-success" type=button>날짜별</button>
								<button class="btn btn-lg" type=button>이름별</button>
								<button class="btn btn-lg btn-success" type=button>지역별</button>
							</div>
							
							<div class="btn-group" role="group" aria-label="Basic example" style="">
								<button type="button" class="btn btn-default btn-xs" aria-label="Left Align"><span class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></span></button>
						        <button type="button" class="btn btn-default btn-xs" aria-label="Center Align"><span class="glyphicon glyphicon-sort-by-alphabet-alt" aria-hidden="true"></span></button>
						        <button type="button" class="btn btn-default btn-xs" aria-label="Center Align"><span class="glyphicon glyphicon-sort-by-order" aria-hidden="true"></span></button>
						        <button type="button" class="btn btn-default btn-xs" aria-label="Center Align"><span class="glyphicon glyphicon-sort-by-order-alt" aria-hidden="true"></span></button>
						        <button type="button" class="btn btn-default btn-xs" aria-label="Right Align"><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span></button>
						    </div>
							<br>
							
							
							
							
							<c:forEach var="item" items="${list}">
							
							<!-- 한 이벤트에 대한 셀 -->
							<div class="bs-example">
								<div style="overflow: auto;">
									<div class="col-md-3">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="Responsive image" class="img-rounded img-responsive">
									</div>
									<div class="col-md-6">
										<dl class="dl-horizontal">
										  <dt>Name</dt>
										  <dd>${item.get("EVENTNAME")}</dd>
										</dl>
										<hr>
										<dl class="dl-horizontal">
										  <dt><h6>Description</h6></dt>
										  <dd>${item.get("DESCRIPTION")}</dd> 
										</dl>
									</div>
									<div class="col-md-3">
										<div class="bs-example">
											<div class="col-md-4">
												<img src="${pageContext.request.contextPath}/resources/core/images/pic.jpg" alt="Responsive image" class="img-rounded img-responsive">
												</div>
												<div class="col-md-8">
													<h6> Nick : ${item.get("NICKNAME")} 님</h6>
													<h6> ID : ${item.get("ID")}</h6>
											</div>
											<div style="text-align: left">
												<div>RAITNG : ${item.get("RATING") }</div>
												<div>INTEREST : ${item.get("INTEREST") }</div>
												<div>PHONE : ${item.get("PHONE") }</div>
											</div>
										</div>
									</div>
								</div>
								<div id=detail>
								<div class="col-md-5">a</div>
								<div class="col-md-2">
								<a href="${item.get('EIDX')} ">
										<button type="button" class="btn btn-default btn-xs" style="right: 3px; bottom: 1px;">
										<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
										</button> 
										</a></div>
								<div class="col-md-5">c</div>
								</div>
							</div>
							</c:forEach>
							<!-- 이벤트 셀 종료 -->
						</div>
						
						
					</section>
			</div>
			
			<div>
			
			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>

	</body>
</html>
