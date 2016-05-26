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

	<!-- Header -->
	<div id="header">


		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>


	</div>

	<!-- Main -->
	<div id="main"">
		<div class="top-wrapper clear"
			style="max-width: 1000px; margin: 0px auto;">
			<div id="content">
				<br> <br>
				<h2 align="center">자유 게시판</h2>

				<div class="panel panel-default">

					<div class="row">
						<div class="panel-heading">
							<h5>제목</h5>
						</div>
						<div class="panel-body">
							${aa.getTitle()}
						</div>
					</div>
					<div class="panel-heading">
						<h5>작성일</h5>
					</div>
					<div class="panel-body">
						${aa.getRegdate()}
						
					</div>

					<div class="panel-heading">
						<h5>작성자</h5>
					</div>
					<div class="panel-body">
						${aa.getWriter()} 
						
					</div>

					<div class="panel-heading">
						<h5>조회수</h5>
					</div>
					<div class="panel-body">29</div>
				</div> 
				<div class="article-content">
					${aa.getContent()}
				</div>
			</div>


			<p class="article-comment margin-small" align="center">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/freeBoard">목록</a> 
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/freeUpdate/${aa.getNidx()}">수정</a> 
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/freeDel/${aa.getNidx()}">삭제</a>
			</p>
			<div class="margin-small" style="border-top: 1px solid #dfdfdf;">
				<br>
				<dl class="article-detail-row">
					<dt class="article-detail-title">다음글</dt>
					<dd class="article-detail-data">다음 글이 없습니다.</dd>
				</dl>
				<dl class="article-detail-row">
					<dt class="article-detail-title">이전글</dt>
					<dd class="article-detail-data">이전 글이 없습니다.</dd>
				</dl>
			</div>
		</div>

	</div>


	<!-- Footer -->
	<div id="footer">
		<!-- Copyright -->
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
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
