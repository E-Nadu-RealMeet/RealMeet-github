<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/eventlist.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventListDetail/docs.min.css" />


		
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
		<!-- Header -->
			<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
			

		<!-- Main -->
			<div id="main">

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>이벤트 리스트</h2>
							</header>
							
							<div style= "max-width: 1000px; padding: 10px; margin: 10px auto;">
								<button class="btn btn-lg btn-success" type=button>날짜별</button>
								<button class="btn btn-lg" type=button>이름별</button>
								<button class="btn btn-lg btn-success" type=button>지역별</button>
							</div>
							
							
							
							<!--  버튼형 시작 -->
							<c:if test="${list!=null}">
							<c:forEach begin="1" var="i" end="${list.size()}">
								<div class="bs-example" style="overflow: hidden; margin-bottom: 10px">
									<div style="">
										<div class="col-md-3">
											<img
												src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg"
												alt="Responsive image" class="img-rounded img-responsive">
										</div>
										<div class="col-md-9">
											<div class="dl-horizontal" style="height: 40px; overflow: hidden; text-align: left;">
												Name : ${list.get(i).get("EVENTNAME")}
											</div>
											<hr>
											<div class="dl-horizontal" style="height: 40px; overflow: hidden; text-overflow: ellipsis; text-align: left; white-space: nowrap; ">
												설명 : ${list.get(i).get("DESCRIPTION")}
											</div>
											<hr>
										</div>
										
									</div>
									<div id=detail>
										<div class="col-md-12">
											<button type="button" class="btn btn-primary btn-lg"
												data-toggle="modal" data-target="#detail${i}">더보기</button>
										</div>
									</div>
				
								</div>
				
								<!-- 상세정보 오버랩 창 내용 -->
								<div class="modal fade" id="detail${i}" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">상세 내용</h4>
											</div>
											<div class="modal-body" style="overflow: auto">
												<div class="col-md-12" style="text-align: left">Description	: ${list.get(i).get("DESCRIPTION")}</div>
												<hr>
												<div class="col-md-2">
													<img
														src="${pageContext.request.contextPath}/resources/core/images/pic.jpg"
														alt="Responsive image" class="img-rounded img-responsive"
														style="width: 100px; height: 100px">
												</div>
												<div class="col-md-10">
													<div style="text-align: left; font-size: 0.8em;">
														<div>Nick : ${list.get(i).get("NICKNAME")} 님</div>
														<div>ID : ${list.get(i).get("ID")}</div>
				
														<div>RAITNG : ${list.get(i).get("RATING") }</div>
														<div>INTEREST : ${list.get(i).get("INTEREST") }</div>
														<div>PHONE : ${list.get(i).get("PHONE") }</div>
													</div>
												</div>
												
				
				
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
												<a href = '${pageContext.request.contextPath}/event/${list.get(i).get("ESIDX")}'><button type="button" class="btn btn-primary">상세 페이지 이동</button></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							</c:if>
				<!--  버튼형 종료 -->
							</div>
						</section>
				</div>

					<!-- 이벤트 셀 종료 -->
					
			
			


		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<%-- <script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script> --%>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
			
	</body>
</html>
