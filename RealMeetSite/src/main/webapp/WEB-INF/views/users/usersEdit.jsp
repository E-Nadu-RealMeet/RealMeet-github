<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<div class="container"
	style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto; text-align: center;">

	<form class="form-horizontal" role="form" method="post" action="edit" style="margin: 0 auto; text-align: center;"
		onsubmit="return formCheck()">

		<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label" style="font-size: 20px;">아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true" name="id" value=${users.getId() }
					maxlength="20" style="width: 80%; margin-top: 1%;; margin-top: 1%;" readonly="readonly">
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
				<input type="password" class="form-control" id="passwordCheck" name="pwd" data-rule-required="true" placeholder="패스워드 확인" maxlength="30"
					style="width: 80%; margin-top: 1%;">
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label" style="font-size: 20px;">별명</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="nickname" data-rule-required="true" name="nickname" maxlength="15"
					style="width: 80%; margin-top: 1%;" value=${users.getNickname() }>
			</div>
		</div>

		<div class="form-group" id="divPhoneNumber">
			<label for="inputPhoneNumber" class="col-lg-2 control-label" style="font-size: 20px;">휴대폰 번호</label>
			<div class="col-lg-10">
				<input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" name="phone" maxlength="11"
					value=${users.getPhone() } style="width: 80%; margin-top: 1%; border: solid 2px rgba(0, 0, 0, 0.15); border-radius: 0.35em;">
			</div>
		</div>

		<div class="form-group" id="divNickname">
			<label for="inputNickname" class="col-lg-2 control-label" style="font-size: 20px;">관심카테고리</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="interest" data-rule-required="true" name="interest" style="width: 80%; margin-top: 1%;"
					value=${users.getInterest() }>
			</div>
		</div>

		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" name="submit" id="submit" class="btn btn-default pull-right" style="margin-right: 20%; color: #333 !important;">회원정보
					수정</button>
			</div>
		</div>
	</form>
</div>

