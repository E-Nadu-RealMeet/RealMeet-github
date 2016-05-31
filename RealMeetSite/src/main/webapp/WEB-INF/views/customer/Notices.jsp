<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" /> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/customer.css" /> 
		<script src="${pageContext.request.contextPath}/resources/core/js/customer.js" type="text/javascript"></script>
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

<div class="modal"></div>
  <div class="modal-content">
							
							<span class="close">×</span>
							<header>
								<h2>공지사항</h2>
							</header>
							

  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>


				<c:forEach var="Notices" items="${Notices}">
					<tr>
						<td>${Notices.nidx}</td>
						<td><a href="NoticesDetail/${Notices.nidx}">${Notices.title}</a></td>
						<td>${Notices.regdate}</td>
					</tr>
				</c:forEach>

			</table>

			<form method="post" action="Notices">
				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div>
				</form>
			<a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="뒤로" /></a>
		
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