<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div
	style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; text-align: center;">

	<form class="form-horizontal" role="form" method="post" action="join"
		style="margin: 0 auto; text-align: center;"
		onsubmit="return formCheck()">
		<!-- action="javascript:alert( 'success!' );" -->

		<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label"
				style="font-size: 20px;">아이디</label>
			<div class="col-lg-10" style="float: left;">
				<input type="text" class="form-control onlyAlphabetAndNumber"
					id="id" data-rule-required="true" name="id"
					placeholder="4~20자이내의 소문자,숫자만 입력 가능합니다." maxlength="20"
					style="width: 80%; margin-top: 1%;">
				<button type="button" class="btn btn-default pull-right"
					onclick="idCheck();"
					style="margin-right: 20%; color: #333 !important; margin-top: 1%;">중복확인</button>
			</div>

		</div>
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label"
				style="font-size: 20px;">패스워드</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="password"
					name="excludeHangul" data-rule-required="true" name="pwd"
					maxlength="30" style="width: 80%; margin-top: 1%;">
			</div>
		</div>
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label"
				style="font-size: 20px;">패스워드 확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwordCheck"
					data-rule-required="true" name="pwd" maxlength="30"
					style="width: 80%; margin-top: 1%;">
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label"
				style="font-size: 20px;">별명</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="nickname"
					data-rule-required="true" name="nickname" maxlength="15"
					style="width: 80%; margin-top: 1%;">
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
		<div class="form-group" id="divEmail">
			<label for="inputEmail" class="col-lg-2 control-label"
				style="font-size: 20px;">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control" id="email"
					data-rule-required="true" name="email"
					style="width: 80%; margin-top: 1%;">
				<button type="button" class="btn btn-default pull-right"
					onclick="emailsend();"
					style="margin-right: 20%; color: #333 !important; margin-top: 1%;">이메일
					인증</button>
			</div>
		</div>
		<div class="form-group" id="divInterest">
			<label for="inputInterest" class="col-lg-2 control-label"
				style="font-size: 20px;">흥미 카테고리</label>
			<div class="col-lg-10" style="font-size: 15px; padding: 6px 12px;">
				<ul>
					<li><input type="checkbox" id="relation" name="interest"
						value="인연"> 인연<br></li>
					<li><input type="checkbox" id="game" name="interest"
						value="게임"> 게임<br></li>
					<li><input type="checkbox" id="meeting" name="interest"
						value="모임"> 모임<br></li>
					<li><input type="checkbox" id="travel" name="interest"
						value="여행"> 여행<br></li>
					<li><input type="checkbox" id="restaurant" name="interest"
						value="맛집"> 맛집<br></li>
					<li><input type="checkbox" id="lecture" name="interest"
						value="강연"> 강연<br></li>
					<li><input type="checkbox" id="knowledge" name="interest"
						value="지식"> 지식<br></li>
				</ul>

			</div>
		</div>
		<input type="hidden" name="certnum" id="certnum" value="">
		<input type="hidden" name="rating" id="rating" value="10" /> <input
			type="hidden" name="cert" id="cert" value="1" />
		<div class="form-group" style="margin-top: 10px">
			<div class="col-lg-offset-2 col-lg-10">

				<button type="submit" name="submit" id="submit"
					class="btn btn-default pull-right"
					style="margin-right: 20%; color: #333 !important;">회원 가입</button>
			</div>
		</div>
	</form>
	<div class="form-group" id="pop-layer">
		<div class="pop-container">
			<h5>인증번호 7자리를 입력하세요</h5>
			<form method="post" name="authenform" onSubmit="return emailCheck();">
				
				<input type="text" name="authnum"><br /> <br />
				<input type="submit" class="btn btn-info" value="인증">
			</form>
			<div class="btn-r">
				<a href="#" class="cbtn">닫기</a>
			</div>
		</div>
	</div>
</div>
