<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/core/css/freeBoard/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body>

	<!-- Main -->
			<div class="container">
				<br> <br>
				<h2 align="center">공지사항</h2>
				<form action="${pageContext.request.contextPath}/board/freeUpdate/${aa.getBidx()}" method="post">
					<div id="notice-article-detail" class="article-detail margin-large">
						<dl class="article-detail-row">
							<dt class="article-detail-title">제목</dt>
							<dd class="article-detail-data">
								<input type="text" name="title">
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">작성자</dt>
							<dd class="article-detail-data half-data">
								${aa.getWriter()}
							</dd>
						</dl>
						<div class="article-content">
							<textarea rows="10" cols="100" name="content"></textarea>
						</div>
					</div>


					<p class="article-comment margin-small" align="center">
						<a class="btn btn-primary" href="../board/freeBoard">목록</a> 
						<button class="btn btn-primary" type="submit">등록</button>

					</p>
				</form>
			</div>


	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>

</body>
</html>
