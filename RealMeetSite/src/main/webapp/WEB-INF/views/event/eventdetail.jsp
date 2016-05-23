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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/eventdetail.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/events.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<!-- Header -->
			<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
		<!-- Main -->
			<div id="main">
			
			
				<div class="container">
					<div class="blog-header">
								<!-- 
							        <h1 class="blog-title">The Bootstrap Blog</h1>
							        <p class="lead blog-description">The official example template of creating a blog with Bootstrap.</p> -->
					</div>
					
					
					 <div class="blog-post">
					 
					 	<ul class="nav nav-tabs" role="tablist">
					        <li role="presentation" class="active"><a href="#">기본내용</a></li>
					        <li role="presentation"><a href="#">사진들</a></li>
					        <li role="presentation"><a href="#">리뷰</a></li>
					        
					        <li class="dropdown">
				                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">설정 <span class="caret"></span></a>
				                <ul class="dropdown-menu" role="menu">
				                  <li><a href="#">변경</a></li>
				                  <li><a href="#">제어</a></li>
				                  <li><a href="#">Something else here</a></li>
				                  <li class="divider"></li>
				                  <li class="dropdown-header">Nav header</li>
				                  <li><a href="#">Separated link</a></li>
				                  <li><a href="#">One more separated link</a></li>
				             	</ul>	
	              			</li>	
					     </ul>
					 	<br>
					 	
					 	<!-- 이벤트 제목란 -->
			            <h2 class="blog-post-title">${detail.get("EVENTNAME") }</h2>
			            <!-- 이벤트 날짜란 -->
			            <p class="blog-post-meta">${detail.get("DATE") } by <a href="#">Mark</a></p>
						<hr>	
						<!-- 이벤트 상세내용 -->
						<blockquote>
						  <h3>서브 제목</h3>
			              <p>이벤트 상세내용 이벤트 상세내용 이벤트 상세내용 이벤트 상세내용 이벤트 상세내용 이벤트 상세내용 이벤트 상세내용 </p>
			            </blockquote>
			            <hr>
			            <p>This blog post shows a few different types of content that's supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>
			            <pre>
			            	<code><h2>리뷰 제목</h2><hr>
			            		<p>내용내용내용</p>
			            	</code>
			            </pre>
			            
			            <div class="row">
					      <!-- "col-sm-6" = 가용범위 1/2 크기 div -->
					      <div class="col-sm-6">
					      <div class="panel panel-primary">
					            <div class="panel-heading">
					              <h3 class="panel-title">Review title</h3>
					            </div>
					            <div class="panel-body">
					              Review content
					            </div>
					          </div>
					       </div>
					        <div class="col-sm-6">
					      <div class="panel panel-primary">
					            <div class="panel-heading">
					              <h3 class="panel-title">Review title</h3>
					            </div>
					            <div class="panel-body">
					              Review content
					            </div>
					          </div>
					       </div>
					    </div>
					    <div class="row">
					    <div class="col-sm-3">
					          <div class="panel panel-default">
					            <div class="panel-heading">
					              <h3 class="panel-title">Review title</h3>
					            </div>
					            <div class="panel-body">
					              Review content
					            </div>
					          </div>
					      </div><!-- /.col-sm-4 -->
						</div>        
			            <hr>
					</div><!-- /.blog-post -->
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
			
			
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		    <script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>


	</body>
</html>
