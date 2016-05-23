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
	<div id="main">
		<div class="top-wrapper clear">
				<div id="content">
				<br>
				<br>
					<h2 align="center">공지사항</h2>
				
					<div id="notice-article-detail" class="article-detail margin-large" >						
						<dl class="article-detail-row">
							<dt class="article-detail-title" style="margin-left: 10%">
								제목
							</dt>
							<dd class="article-detail-data" >
								${n.title}
							</dd>
						</dl>
						<dl class="article-detail-row">
							<dt class="article-detail-title" style="margin-left: 10%">
								작성일
							</dt>
							<dd class="article-detail-data">
								${n.regdate} 
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title" style="margin-left: 10%">
								작성자
							</dt>
							<dd class="article-detail-data half-data" >
								${n.writer} 
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title" style="margin-left: 10%">
								조회수
							</dt>
							<dd class="article-detail-data half-data">
								${n.hit} 
							</dd>
						</dl>
						<div class="article-content" >
								${n.content}
						</div>
					</div>
					
					
					<p class="article-comment margin-small" align="center">
						<a class="btn-list button" href="notice.do?pages=${param.pages}">목록</a>
						<%-- <%if(mid!=null&&mid.equals(n.getWriter())){ %>		 --%>				
						<a class="btn-edit button" href="noticeEdit.do?seq=${n.seq}&pages=${param.pages}">수정</a>
						<%-- <%} %> --%>
						<a class="btn-del button" href="noticeDelProc.do?seq=${n.seq}&pages=${param.pages}">삭제</a>
					</p>
					<div class="margin-small" style="border-top: 1px solid #dfdfdf;">
					<br>
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								▲ 다음글
							</dt>
							<dd class="article-detail-data">
								다음 글이 없습니다.
							</dd>
						</dl>
						<dl class="article-detail-row">
							<dt class="article-detail-title">
								▼ 이전글
							</dt>
							<dd class="article-detail-data">
								제 12회 창업스쿨
							</dd>
						</dl>
					</div>					
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
