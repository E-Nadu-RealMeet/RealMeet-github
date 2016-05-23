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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css" >
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/usersJoin.css" />
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
							<!--

								Prologue's nav expects links in one of two formats:

								1. Hash link (scrolls to a different section within the page)

								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>

							-->
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
		<div class="join-top">
			<ul>
				<li><a href="${pageContext.request.contextPath}/">홈</a></li>
				<li><a href="#">로그인</a></li>
			</ul>
		</div>
		<div></div>
		<div class="container" style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto;">

			<form class="form-horizontal" role="form" method="post" action="join">	<!-- action="javascript:alert( 'success!' );" -->

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label" style="font-size: 20px;" >아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="id" data-rule-required="true" name="id";
							placeholder="20자이내의 영문자,숫자만 입력 가능합니다." maxlength="20"
							style="width: 80%; margin-top:1%;">
					</div>
				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label" style="font-size: 20px;">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="password"
							name="excludeHangul" data-rule-required="true" name="pwd" placeholder="패스워드"
							maxlength="30" style="width: 80%; margin-top:1%;">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label" style="font-size: 20px;">패스워드
						확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="passwordCheck"
							data-rule-required="true" name="pwd" placeholder="패스워드 확인" maxlength="30"
							style="width: 80%; margin-top:1%;">
					</div>
				</div>
				<!-- <div class="form-group" id="divName">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" class="form-control onlyHangul" id="name"
							data-rule-required="true" placeholder="한글만 입력 가능합니다."
							maxlength="15">
					</div>
				</div> -->

				<div class="form-group" id="divNickname">
					<label for="inputNickname" class="col-lg-2 control-label" style="font-size: 20px;">별명</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="nickname"
							data-rule-required="true" name="nickname" placeholder="별명" maxlength="15"
							style="width: 80%; margin-top:1%;">
					</div>
				</div>

				<!-- <div class="form-group" id="divEmail">
					<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="email" class="form-control" id="email"
							data-rule-required="true" placeholder="이메일" maxlength="40">
					</div>
				</div> -->
				
				
				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-lg-2 control-label" style="font-size: 20px;">휴대폰
						번호</label>
					<div class="col-lg-10">
						<input type="tel" class="form-control onlyNumber" id="phoneNumber"
							data-rule-required="true" name="phone" placeholder="-를 제외하고 숫자만 입력하세요."
							maxlength="11" style="width: 80%; margin-top:1%;">
					</div>
				</div>
				<!-- <div class="form-group">
					<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
					<div class="col-lg-10">
						<select class="form-control" id="gender">
							<option value="M">남</option>
							<option value="F">여</option>
						</select>
					</div>
				</div> -->

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="hidden" name="rating" id="rating" value="10" />
						<input type="hidden" name="interest" id="interest" value="sports" />
						<button type="submit" class="btn btn-default">회원 가입</button>
					</div>
				</div>
			</form>
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
