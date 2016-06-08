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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
		
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<!-- Header -->
			<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
		<!-- Main -->
	<div id="main">


		<div class="container">
			<form action="reg.do" method="post" id="regForm">
					<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
						<h2>정보 수정</h2>
						<br>
					</div>
					<h3>카테고리 : </h3>
					<input type="text" name="category" id="category" class="regEdit" >
					<h3>이벤트명 : </h3>
					<input type="text" name="eventname" class="regEdit" >
					<h3>간단한 설명 : </h3>
					<input type="text" name="abs" class="regEdit" >
					<h3>업로드한 파일 : </h3>
					<input type="text" name="imgsrc" id="imgsrc" class="regEdit" />
					<h3>자세한 설명 : </h3>
					<textarea id="description" class="regEdit" disabled="disabled"></textarea>
					<h3>이벤트 개최 날짜 : </h3>
					<input type="datetime-local" class=regEdit />
					<h3>이벤트 개최 장소 : </h3>
					<input type="text" name="addr" id="addr" class="regEdit" >
					<br>
					<input type="hidden" name="date" id="date2" >
					<input type="hidden" id="description" class="regEdit" disabled="disabled">
					<button type="submit" id="selectEnd" class='editButton'>이벤트 수정</button>
					<button type="button" class="editButton-back">뒤로가기</button>
				</form>
			
			
			
			
				</div>
			<!-- /.blog-post -->
		</div>
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
			<script src="${pageContext.request.contextPath}/resources/core/js/eventApply.js" type="text/javascript"></script>
			
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		    <script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>


	</body>
</html>
				