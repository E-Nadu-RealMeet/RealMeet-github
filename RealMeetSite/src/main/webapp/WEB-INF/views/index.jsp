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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/index.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		 <script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/core/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/core/js/jssor.slider.mini.js"></script>
	</head>
	<body>
		<!-- Header -->
	<div id="header">
		<jsp:include page="modules/commons/leftBar.jsp"></jsp:include>
	</div>
	<!-- Main -->
			<div id="main">
			
				<div class="join-top">
					<ul style="margin:0">
						<li><a href="#">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/users/join">회원가입</a></li>
					</ul>
				</div>

						
				<!-- Intro -->
					<section id="top" class="one dark cover">
					
					
						<div class="container">
							<jsp:include page="modules/commons/slideBanner.jsp"></jsp:include>
							<!-- <header>
								<h2 class="alt">Hi! I'm <strong>Prologue</strong>, a <a href="http://html5up.net/license">free</a> responsive<br />
								site template designed by <a href="http://html5up.net">HTML5 UP</a>.</h2>
								<p>Ligula scelerisque justo sem accumsan diam quis<br />
								vitae natoque dictum sollicitudin elementum.</p>
							</header>

							<footer>
								<a href="#portfolio" class="button scrolly">Magna Aliquam</a>
							</footer>
 -->

							<header>
								<h2 class="alt">Homepage MainView</h2>
								<p> Homepage Describe</p>
							</header>

						</div>
					</section>

				<!-- Portfolio -->					
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>Homepage Detail</h2>
							</header>

							<p>이 홈페이지는 1인시대, 모든 활동을 혼자하는 시대적 풍토때문에 단체 활동에 제약이 생기고 그로 인해 사회적 후생이 감소한다.
							점심시간에 함께 식사를 하는것, 여럿이 함께 하는 스포츠 활동 등 단체활동들을 각 연령별, 지역별 모임활동을 주최함으로써 
							지역사회에 활력을 불어넣고자 한다.</p>

							

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>Category</h2>
							</header>


							<table border=1>
								<tr>
									<td>카테고리필터</td>
								</tr>
								<tr>
									<td>
										<input type=checkbox name=category value="lunch">식사 &nbsp;
										<input type=checkbox name=category value="sports">운동 &nbsp;
										<input type=checkbox name=category value="communication">일상대화 &nbsp;
										<input type=checkbox name=category value="cultural">문화생활 &nbsp;
										<input type=checkbox name=category value="meetin">만남 &nbsp;
										<input type=checkbox name=category value="volunteer">자원봉사 &nbsp;
										<input type=checkbox name=category value="study">스터디 &nbsp;
									</td>
								</tr>
							</table>
							
							<c:forEach var="item" items="${list}">
							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" /></a>
									</article>
								</div>
								<span style="width: 64%; height: 230px; text-align:left; border-left: solid; border-left-color: white;">
								<div style="font-weight: bold;">이벤트 명 : ${item.getEventname()}<br></div>
								설명 : ${item.getDescription() }<br>
								<br>
								<a href="${item.getEsidx()}">더보기</a>
								</span>
								<span style="float: right; width: 14%; height: 230px; font-size: 15px; text-align:center; border-left: solid; border-left-color: white;">
									<img src="${pageContext.request.contextPath}/resources/core/images/pic.jpg" style="width: 40px; height: 40px; margin-right: 5px"/>
									<br>개최자 : ${item.getHolder() }
									<br>평점 : 10
									<br>
									<a href="">더보기</a>
								</span>
							</div>
							</c:forEach>

						</div>
					</section>
			</div>
			
			<div></div>

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
