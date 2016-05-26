<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Users Info</title>
		<meta charset="utf-8" />
<!-- 	<meta name="generator" content="Bootply" /> -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 	<meta name="description" content="Bootstrap Bootstrap user profile show page example snippet for Bootstrap." /> -->
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersInfo.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->	
	</head>
	<body>
	
		<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="${pageContext.request.contextPath}/resources/core/images/avatar.jpg" alt="" /></span>
							<h1 id="title">index</h1>
							<p>${name}</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Intro</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Portfolio</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">About Me</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Contact</span></a></li>
							</ul>
						</nav>

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

	<div id="main">
		<div class="container" style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto;">
			<div class="row">
				<div class="col-md-9">
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
											<span class="text-muted">관심 카테고리:</span> ${users.getInterest() }<br> <br>
											<small class="text-muted">Created: 01.01.2015</small>
										</div>
										<!-- <div class="col-md-6">
											<div class="activity-mini">
												<i class="glyphicon glyphicon-comment text-muted"></i> 500
											</div>
											<div class="activity-mini">
												<i class="glyphicon glyphicon-thumbs-up text-muted"></i>
												1500
											</div>
										</div> -->
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<hr>
									<button class="btn btn-default pull-right" onClick="location.href='../users/edit?id=${users.getId() }'">
										<i class="glyphicon glyphicon-pencil"></i> 회원정보수정
									</button>
									<button class="btn btn-default pull-right" >
										<i class="glyphicon glyphicon-pencil"></i> 회원탈퇴
									</button>
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

	</body>
</html>
