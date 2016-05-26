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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<div id="header">

				<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>

				</div>

			</div>

		<!-- Main -->
			<div id="main">

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>고객센터</h2>
							</header>

							
							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="Notices" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" width="150px" height="232px"/></a>
										<header>
											<h3>공지사항</h3>
										</header>
									</article>
									
									<article class="item">
										<a href="information" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic03.jpg" alt="" width="150px" height="232px"/></a>
										<header>
											<h3>이용안내</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="FAQs" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic04.jpg" alt="" width="150px" height="232px"/></a>
										<header>
											<h3>FAQ</h3>
										</header>
									</article>
									<article class="item">
										<a href="Call" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic05.jpg" alt="" width="150px" height="232px"/></a>
										<header>
											<h3>문의하기</h3>
										</header>
									</article>
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href="QNA" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic06.jpg" alt="" width="150px" height="232px"/></a>
										<header>
											<h3>내 문의내역</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Ssangyong. All rights reserved.</li><li>Design: 팀명</a></li>
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
