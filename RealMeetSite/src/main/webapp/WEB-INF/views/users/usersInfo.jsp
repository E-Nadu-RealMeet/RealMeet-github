<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Users Info</title>
<meta charset="utf-8" />
<!-- 	<meta name="generator" content="Bootply" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 	<meta name="description" content="Bootstrap Bootstrap user profile show page example snippet for Bootstrap." /> -->
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> --%>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersInfo.css" /> -->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

</head>
<body>

	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>

	<div id="main" style="background-color: #f5fafa;">
		<div class="join-top" style="margin-bottom: 2em;">
			<jsp:include page="../modules/commons/topMenu.jsp"></jsp:include>
		</div>
		<div style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; ">
			<div class="row">
				<div class="col-md-9" style="width:95%; margin: 0 auto;">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 lead">
									User profile
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 text-center">
									<img class="img-circle avatar avatar-original"
										style="-webkit-user-select: none; display: block; margin: auto;"
										src="http://robohash.org/sitsequiquia.png?size=120x120">
								</div>
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-12">
											<h1 class="only-bottom-margin">${users.getId() }</h1>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<span class="text-muted">별명:</span> ${users.getNickname() }<br>
											<span class="text-muted">연락처:</span> ${users.getPhone() }<br>
											<span class="text-muted">등급:</span> ${users.getRating() }<br>
											<span class="text-muted">관심 카테고리:</span>
											${users.getInterest() }<br> <br> <small
												class="text-muted">Created: 01.01.2015</small>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<hr>
									<button class="btn btn-default pull-right" style="color: #333 !important;"
										onClick="location.href='../users/edit?id=${users.getId() }'">
										<i class="glyphicon glyphicon-pencil"></i> 회원정보수정
									</button>
									<%-- <button class="btn btn-default pull-right" onClick="location.href='../users/check?id=${users.getId() }'">
										<i class="glyphicon glyphicon-pencil" ></i> 회원탈퇴
									</button> --%>
									<button type="button" class="btn btn-default pull-right"
										data-toggle="modal" data-target="#myModal" style="margin-right: 1%; color: #333 !important;" >탈퇴</button>

									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header"></div>
													<jsp:include page="usersCheck.jsp?id=${users.getId() }" flush="false"></jsp:include>
											</div>	
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	<script	src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script	src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>

</body>
</html>
