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
			<div class="blog-header">
				<!-- 
							        <h1 class="blog-title">The Bootstrap Blog</h1>
							        <p class="lead blog-description">The official example template of creating a blog with Bootstrap.</p> -->
			</div>

			<div class="blog-post">

				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation"><a href="#detail" id="detail-tab"
							role="tab" data-toggle="tab" aria-controls="detail">Detail</a></li>
						<li role="presentation"><a href="#pictures" role="tab"
							id="pictures-tab" data-toggle="tab" aria-controls="pictures">Pictures</a></li>
						<li role="presentation"><a href="#review" role="tab"
							id="review-tab" data-toggle="tab" aria-controls="reivew">Reviews</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="detail"
							aria-labelledby="detail-tab" aria-expanded="true">
							<!-- 이벤트 제목란 -->
							<h2 class="blog-post-title">${detail.get("EVENTNAME") }</h2>
							<!-- 이벤트 날짜란 -->
							<p class="blog-post-meta">${detail.get("DATE") }
								by <a href="#">${detail.get("HOLDER") }</a>
							</p>
							<hr>
							<!-- 이벤트 상세내용 -->
							<blockquote>
								<p>${detail.get("DESCRIPTION") }</p>
							</blockquote>
							<hr>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="pictures"
							aria-labelledby="pictures-tab" aria-expanded="false">
							<p>
							<div class="row" >사진 넣을공간</div>
							</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="review"
							aria-labelledby="review-tab" aria-expanded="false">
							<div class="row">
								<c:if test="reviews != null">
								<c:forEach begin="0" end="${reviews.size()-1 }" var="i">
									<!-- "col-sm-6" = 가용범위 1/2 크기 div -->
									<div class="col-sm-6">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">${reviews.get(i).getTitle() }</h3>
											</div>
											<div class="panel-body">${reviews.get(i).getContent() }
											</div>
										</div>
									</div>
								</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<hr>


				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#apply">참여 하기</button>
				<div class="modal fade" id="apply" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">

					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">참여 하기</h4>
							</div>
							<div class="modal-body" style="overflow: auto">
								<div class="col-md-12" style="text-align: left"></div>

							</div>
							<div class="modal-footer">
								<button type="button" id="apply1" class="btn btn-primary">참여 하기</button>
								<button type="button" id="close" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								
							</div>
						</div>
					</div>
				</div>









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
			<script src="${pageContext.request.contextPath}/resources/core/js/eventDetail.js" type="text/javascript"></script>
			
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		    <script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>


	</body>
</html>
