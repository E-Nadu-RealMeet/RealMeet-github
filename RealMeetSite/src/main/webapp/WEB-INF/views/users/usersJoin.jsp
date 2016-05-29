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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersJoin.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->	
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

var count = 0;

function idCheck(){
	
	if ($("#id").val() == '' || $("#id").val() == null) {
		alert("아이디를 입력하세요");
		return false;
	}
	var text = $("#id").val();
	var regexp = /[0-9a-zA-Z]/;

	for (var i = 0; i < text.length; i++) {
		if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
			alert("한글이나 특수문자는 입력불가능 합니다.");
			return false;
		}
	}
	$.ajax({
		type:"POST",
		dataType : 'text',
		url : "idcheck",
		data : {
			"id" : $('#id').val()
		},		
		success : function(data) {
			if ($.trim(data) == "YES") {
				count = 1;
				alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.");
			} else {
				alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
				return false;
			}
		},
	});
}


function formCheck() {
	var member_id = document.getElementById('id');
	var member_nickname = document.getElementById('nickname');
	var password = document.getElementById('password');
	var password_check = document.getElementById('passwordCheck');
	var member_phoneNumber = document.getElementById('phoneNumber');

	if (member_id.value == '' || member_id.value == null) {
		alert('ID를 입력하세요');
		focus.member_id;
		return false;
	}
	if (member_id.value.length < 4 || member_id.value.length > 20) {
		alert('ID는 4~20자내로 입력해주세요.');
		focus.member_id;
		return false;
	}
	
	if (password.value == '' || password.value == null) {
		alert('비밀번호를 입력하세요');
		focus.password;
		return false;
	}

	if (password_check.value == '' || password_check.value == null) {
		alert('비밀번호확인란을 입력하세요');
		focus.password_check;
		return false;
	}
	
	if (password.value != password_check.value) {
		alert("비밀번호와 비밀번호 확인란이 다릅니다.");
		focus.passowrd;
		return false;
	}
	
	if (member_nickname.value == '' || member_nickname.value == null) {
		alert('별명을 입력하세요');
		focus.member_nickname;
		return false;
	}
	
	if (member_phoneNumber.value == '' || member_phoneNumber.value == null) {
		alert('휴대폰번호를 입력하세요');
		focus.member_phoneNumber;
		return false;
	}

	if (member_phoneNumber.value.length <= 9 || member_phoneNumber.value.length >= 12) {
		alert("휴대폰번호를 제대로 입력해주세요");
		focus.member_phoneNumber;
		return false;
	}

	if (isNaN(member_phoneNumber.value)) {
		alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
		focus.member_phoneNumber;
		return false;
	}

	if (count == 0) {
		alert("아이디 중복확인을 눌러주세요");
		return false;
	}
	return true;
}	
	
</script>

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
		<div class="join-top">
			<ul>
				<li><a href="${pageContext.request.contextPath}/">홈</a></li>
				<li><a href="#">로그인</a></li>
			</ul>
		</div>
		<div></div>
		<div class="container" style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; position: ">

			<form class="form-horizontal" role="form" method="post" action="join" onsubmit="return formCheck()">	<!-- action="javascript:alert( 'success!' );" -->

				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label" style="font-size: 20px;" >아이디</label>
					<div class="col-lg-10" >
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="id" data-rule-required="true" name="id"
							placeholder="4~20자이내의 소문자,숫자만 입력 가능합니다." maxlength="20"
							style="width: 80%; margin-top:1%;">		
					</div>
					<div>
						<input type="button" class="button" value="중복확인" onclick="idCheck();" style="width:10%; font-size:13px; font-weight:bold; text-align:center;">
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
				<input type="hidden" name="rating" id="rating" value="10" />
				<input type="hidden" name="interest" id="interest" value="sports" />
				<div class="form-group" style="margin-top: 10px">
					<div class="col-lg-offset-2 col-lg-10">
						
						<button type="submit" name="submit" id="submit" class="btn btn-default">회원 가입</button>
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
