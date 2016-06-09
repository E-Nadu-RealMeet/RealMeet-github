<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> -->
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersJoin.css" /> -->
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
	if (text.length < 4 || text.length > 20) {
		alert('ID는 4~20자내로 입력해주세요.');
		return false;
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
	
	var interest = new Array();
	$("input[name=interest]:checked").each(function(){
		
		interest.push($(this).val());
	})

	if (member_id.value == '' || member_id.value == null) {
		alert('ID를 입력하세요');
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
	
	if(interest.length < 1){
		alert('최소 한개이상의 흥미 카테고리를 선택하여야 합니다.');
		return false;
	}

	if (count == 0) {
		alert("아이디 중복확인을 눌러주세요");
		return false;
	}

	
	//흥미 카테고리데이터 보내기
	$.ajax({
		url:'join',
		type:'GET',
		data: interest,
		success:function(data){
		}
	});
	
	return true;
}	

/* $(document).ready(function(){
	$("#submit").on("click", function(){
		if($(".chkclasss :checked").size()<1){
			alert("최소 한개 이상의 카테고리를 체크하여야 합니다.");
			return;
		}else{
			var param="";
			$(".chkclass :checked").each(function(){
				if(param == "" || param == null){
					
				}else{
				
				}
			});
		}		
	});
}); */
	
</script>
<style type="text/css">

.col-lg-10 ul{
	list-style-type: none;
}
.col-lg-10 li{
	float: left;
	padding: 0px 10px 10px 10px;
}
</style>
</head>
<body>

	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>

	<div id="main">
		<div class="join-top" style="margin-bottom: 2em;">
			<jsp:include page="../modules/commons/topMenu.jsp"></jsp:include>
		</div>
		<div></div>
		<div style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; text-align:center; ">

			<form class="form-horizontal" role="form" method="post" action="join" style="margin: 0 auto; text-align:center;"
				onsubmit="return formCheck()">
				<!-- action="javascript:alert( 'success!' );" -->

				<div class="form-group" id="divId" >
					<label for="inputId" class="col-lg-2 control-label"	style="font-size: 20px; ">아이디</label>
					<div class="col-lg-10" style="float: left;">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="id" data-rule-required="true" name="id"
							placeholder="4~20자이내의 소문자,숫자만 입력 가능합니다." maxlength="20"
							style="width: 80%; margin-top: 1%;">
						<button type="button" class="btn btn-default pull-right"
							onclick="idCheck();" style="margin-right: 20%; color: #333 !important; margin-top: 1%;">중복확인
						</button>
					</div>


				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label"
						style="font-size: 20px;">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="password"
							name="excludeHangul" data-rule-required="true" name="pwd"
							placeholder="패스워드" maxlength="30"
							style="width: 80%; margin-top: 1%;">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label"
						style="font-size: 20px;">패스워드 확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="passwordCheck"
							data-rule-required="true" name="pwd" placeholder="패스워드 확인"
							maxlength="30" style="width: 80%; margin-top: 1%;">
					</div>
				</div>

				<div class="form-group" id="divNickname">
					<label for="inputNickname" class="col-lg-2 control-label"
						style="font-size: 20px;">별명</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="nickname"
							data-rule-required="true" name="nickname" placeholder="별명"
							maxlength="15" style="width: 80%; margin-top: 1%;">
					</div>
				</div>

				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-lg-2 control-label"
						style="font-size: 20px;">휴대폰 번호</label>
					<div class="col-lg-10">
						<input type="tel" class="form-control onlyNumber" id="phoneNumber"
							data-rule-required="true" name="phone"
							placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11"
							style="width: 80%; margin-top: 1%; border: solid 2px rgba(0, 0, 0, 0.15); border-radius: 0.35em;">
					</div>
				</div>
			<div class="form-group" id="divInterest">
					<label for="inputInterest" class="col-lg-2 control-label" style="font-size: 20px;">흥미 카테고리</label>
					<div class="col-lg-10" style="font-size: 15px; padding: 6px 12px;">
						<ul>
							<li>
								<input type="checkbox" id="sport" name="interest" value="식사" > 식사<br>
							</li>
							<li>
								<input type="checkbox" id="game" name="interest" value="운동"> 운동<br>
							</li>
							<li>
								<input type="checkbox" id="talk" name="interest" value="일상대화"> 일상대화<br>
							</li>
							<li>
								<input type="checkbox" id="cul" name="interest" value="문화생활"> 문화생활<br>
							</li>
							<li>
								<input type="checkbox" id="meet" name="interest" value="만남"> 만남<br>	
							</li>
							<li>
								<input type="checkbox" id="vol" name="interest" value="자원봉사"> 자원봉사<br>
							</li>
							<li>
								<input type="checkbox" id="study" name="interest" value="스터디"> 스터디<br>
							</li>
						</ul>

					</div>
				</div>

				<input type="hidden" name="rating" id="rating" value="10" />
				<!-- <input type="hidden" name="interest" id="interest" value="sports" /> -->
				<div class="form-group" style="margin-top: 10px">
					<div class="col-lg-offset-2 col-lg-10">

						<button type="submit" name="submit" id="submit"	class="btn btn-default pull-right" style="margin-right: 20%; color: #333 !important;">회원 가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Footer -->
<!-- 	<div id="footer">

		Copyright
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div> -->

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
 --%>
 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<<<<<<< HEAD
<%-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> --%>
=======
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> -->
>>>>>>> be51c0d7b5446ffd666901d00e3c86a895628af2
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersJoin.css" /> -->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">

.col-lg-10 ul{
	list-style-type: none;
}
.col-lg-10 li{
	float: left;
	padding: 0px 10px 10px 10px;
}
</style>
</head>
<div style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; text-align:center; ">

			<form class="form-horizontal" role="form" method="post" action="join" style="margin: 0 auto; text-align:center;"
				onsubmit="return formCheck()">
				<!-- action="javascript:alert( 'success!' );" -->

				<div class="form-group" id="divId" >
					<label for="inputId" class="col-lg-2 control-label"	style="font-size: 20px; ">아이디</label>
					<div class="col-lg-10" style="float: left;">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="id" data-rule-required="true" name="id"
							placeholder="4~20자이내의 소문자,숫자만 입력 가능합니다." maxlength="20"
							style="width: 80%; margin-top: 1%;">
						<button type="button" class="btn btn-default pull-right"
							onclick="idCheck();" style="margin-right: 20%; color: #333 !important; margin-top: 1%;">중복확인
						</button>
					</div>


				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label"
						style="font-size: 20px;">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="password"
							name="excludeHangul" data-rule-required="true" name="pwd"
							placeholder="패스워드" maxlength="30"
							style="width: 80%; margin-top: 1%;">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label"
						style="font-size: 20px;">패스워드 확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="passwordCheck"
							data-rule-required="true" name="pwd" placeholder="패스워드 확인"
							maxlength="30" style="width: 80%; margin-top: 1%;">
					</div>
				</div>

				<div class="form-group" id="divNickname">
					<label for="inputNickname" class="col-lg-2 control-label"
						style="font-size: 20px;">별명</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="nickname"
							data-rule-required="true" name="nickname" placeholder="별명"
							maxlength="15" style="width: 80%; margin-top: 1%;">
					</div>
				</div>

				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-lg-2 control-label"
						style="font-size: 20px;">휴대폰 번호</label>
					<div class="col-lg-10">
						<input type="tel" class="form-control onlyNumber" id="phoneNumber"
							data-rule-required="true" name="phone"
							placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11"
							style="width: 80%; margin-top: 1%; border: solid 2px rgba(0, 0, 0, 0.15); border-radius: 0.35em;">
					</div>
				</div>
			<div class="form-group" id="divInterest">
					<label for="inputInterest" class="col-lg-2 control-label" style="font-size: 20px;">흥미 카테고리</label>
					<div class="col-lg-10" style="font-size: 15px; padding: 6px 12px;">
						<ul>
							<li>
								<input type="checkbox" id="sport" name="interest" value="식사" > 식사<br>
							</li>
							<li>
								<input type="checkbox" id="game" name="interest" value="운동"> 운동<br>
							</li>
							<li>
								<input type="checkbox" id="talk" name="interest" value="일상대화"> 일상대화<br>
							</li>
							<li>
								<input type="checkbox" id="cul" name="interest" value="문화생활"> 문화생활<br>
							</li>
							<li>
								<input type="checkbox" id="meet" name="interest" value="만남"> 만남<br>	
							</li>
							<li>
								<input type="checkbox" id="vol" name="interest" value="자원봉사"> 자원봉사<br>
							</li>
							<li>
								<input type="checkbox" id="study" name="interest" value="스터디"> 스터디<br>
							</li>
						</ul>

					</div>
				</div>

				<input type="hidden" name="rating" id="rating" value="10" />
				<!-- <input type="hidden" name="interest" id="interest" value="sports" /> -->
				<div class="form-group" style="margin-top: 10px">
					<div class="col-lg-offset-2 col-lg-10">

						<button type="submit" name="submit" id="submit"	class="btn btn-default pull-right" style="margin-right: 20%; color: #333 !important;">회원 가입</button>
					</div>
				</div>
			</form>
		</div>
 