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

				<div class="top">	

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/core/images/avatar.jpg" alt="" /></a></span>
							<h1 id="title">index</h1>
							<p>${name}</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="${pageContext.request.contextPath}/event/list" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">이벤트 리스트</span></a></li>
								<li><a href="${pageContext.request.contextPath}/event/reg" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">이벤트 만들기</span></a></li>
								<li><a href="${pageContext.request.contextPath}/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-free">게시판</span></a></li>
							
    						<li><a href="${pageContext.request.contextPath}/customer/customer"><span class="icon fa-user">고객센터</span></a></li>
       							 
									<li><a href="${pageContext.request.contextPath}/customer/Notices" ><span class="icon fa-user">공지사항</span></a></li>
									<li><a href="${pageContext.request.contextPath}/customer/FAQs" ><span class="icon fa-user">FAQ</span></a></li>
									<li><a href="${pageContext.request.contextPath}/customer/QNA" ><span class="icon fa-user">내 문의내역</span></a></li>
									
   							 
								
							</ul>	
							
						</nav>

				</div>

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
								<div class="4u" style="margin-left: 7%;">
									<article class="item" >
										<a href="Notices" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" height="100px"/></a>
										<header>
											<h3>공지사항</h3>
										</header>
									</article>
									
									<article class="item">
										<a href="information" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic03.jpg" alt=""  height="100px"/></a>
										<header>
											<h3>이용안내</h3>
										</header>
									</article>
								</div>
								<div class="4u">
									<article class="item">
										<a href="FAQs" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic04.jpg" alt="" height="100px"/></a>
										<header>
											<h3>FAQ</h3>
										</header>
									</article>
									<article class="item">
										<a href="Call" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic05.jpg" alt="" height="100px"/></a>
										<header>
											<h3>문의하기</h3>
										</header>
									</article>
								</div>
								<div class="4u">
									<article class="item">
										<a href="QNA" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic06.jpg" alt="" height="100px"/></a>
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
