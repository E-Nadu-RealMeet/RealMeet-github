<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/eventList.js?ver=1" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/docs.min.css" />
		<script>
		
		</script>

		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<!-- Header -->
			<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
			

		<!-- Main -->
			<div id="main">
				<!-- Intro -->
				<jsp:include page="../modules/commons/intro.jsp">
					<jsp:param value="이벤트 리스트" name="introValue"/>
				</jsp:include>
				
				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container" id="container">

							<div style= "max-width: 1000px; padding: 10px; margin: 10px auto;">
								<div>
									<div class="dropdown">
										<button class="btn btn-default dropdwon-toggle" type="button" id="dr1" data-toggle="dropdown" aria-expanded="true">
										DropDown
										<span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="dr1" style="margin: 0 auto;">
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
										 </ul>
									</div>
								</div>
							
								<button class="btn btn-lg btn-success" type=button>날짜별</button>
								<button class="btn btn-lg" type=button>이름별</button>
								<button class="btn btn-lg btn-success" type=button>지역별</button>
							</div>
						</div>
					</section>
				</div>

					<!-- 이벤트 셀 종료 -->
					


		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<%-- <script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script> --%>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>

			
		

			
	</body>
</html>
