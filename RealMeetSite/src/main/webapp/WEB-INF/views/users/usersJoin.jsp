<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

<style type="text/css">
.col-lg-10 ul {
	list-style-type: none;
}

.col-lg-10 li {
	float: left;
	padding: 0px 10px 10px 10px;
}
</style>
<div
	style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; text-align: center;">

	<form class="form-horizontal" role="form" method="post" action="join" style="margin: 0 auto; text-align: center;"
		onsubmit="return formCheck()">
		<!-- action="javascript:alert( 'success!' );" -->

		<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label" style="font-size: 20px;">아이디</label>
			<div class="col-lg-10" style="float: left;">
				<input type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" name="id"
					placeholder="4~20자이내의 소문자,숫자만 입력 가능합니다." maxlength="20" style="width: 80%; margin-top: 1%;">
				<button type="button" class="btn btn-default pull-right" onclick="idCheck();"
					style="margin-right: 20%; color: #333 !important; margin-top: 1%;">중복확인</button>
			</div>


		</div>
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label" style="font-size: 20px;">패스워드</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" name="pwd" placeholder="패스워드"
					maxlength="30" style="width: 80%; margin-top: 1%;">
			</div>
		</div>
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label" style="font-size: 20px;">패스워드 확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwordCheck" data-rule-required="true" name="pwd" placeholder="패스워드 확인" maxlength="30"
					style="width: 80%; margin-top: 1%;">
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label" style="font-size: 20px;">별명</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="nickname" data-rule-required="true" name="nickname" placeholder="별명" maxlength="15"
					style="width: 80%; margin-top: 1%;">
			</div>
		</div>

		<div class="form-group" id="divPhoneNumber">
			<label for="inputPhoneNumber" class="col-lg-2 control-label" style="font-size: 20px;">휴대폰 번호</label>
			<div class="col-lg-10">
				<input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" name="phone"
					placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11"
					style="width: 80%; margin-top: 1%; border: solid 2px rgba(0, 0, 0, 0.15); border-radius: 0.35em;">
			</div>
		</div>
		<div class="form-group" id="divInterest">
			<label for="inputInterest" class="col-lg-2 control-label" style="font-size: 20px;">흥미 카테고리</label>
			<div class="col-lg-10" style="font-size: 15px; padding: 6px 12px;">
				<ul>
					<li><input type="checkbox" id="sport" name="interest" value="식사"> 식사<br></li>
					<li><input type="checkbox" id="game" name="interest" value="운동"> 운동<br></li>
					<li><input type="checkbox" id="talk" name="interest" value="일상대화"> 일상대화<br></li>
					<li><input type="checkbox" id="cul" name="interest" value="문화생활"> 문화생활<br></li>
					<li><input type="checkbox" id="meet" name="interest" value="만남"> 만남<br></li>
					<li><input type="checkbox" id="vol" name="interest" value="자원봉사"> 자원봉사<br></li>
					<li><input type="checkbox" id="study" name="interest" value="스터디"> 스터디<br></li>
				</ul>

			</div>
		</div>

		<input type="hidden" name="rating" id="rating" value="10" />
		<div class="form-group" style="margin-top: 10px">
			<div class="col-lg-offset-2 col-lg-10">

				<button type="submit" name="submit" id="submit" class="btn btn-default pull-right" style="margin-right: 20%; color: #333 !important;">회원
					가입</button>
			</div>
		</div>
	</form>
</div>
