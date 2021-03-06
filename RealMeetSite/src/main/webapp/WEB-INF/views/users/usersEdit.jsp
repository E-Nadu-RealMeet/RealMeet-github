<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<script type="text/javascript">
$(document).ready(function() {
	

	var interest = "${users.getInterest()}";
	var splitInterest = interest.split(',');
	
 	for(var i=0; i<splitInterest.length; i++){
		switch(splitInterest[i]){
			case "인연":
				$("input:checkbox[id='relation']").prop("checked", true);
				break;
			case "게임":
				$("input:checkbox[id='game']").prop("checked", true);
				break;
			case "모임":
				$("input:checkbox[id='meeting']").prop("checked", true);
				break;
			case "여행":
				$("input:checkbox[id='travel']").prop("checked", true);
				break;
			case "맛집":
				$("input:checkbox[id='restaurant']").prop("checked", true);
				break;
			case "강연":
				$("input:checkbox[id='lecture']").prop("checked", true);
				break;
			case "지식":
				$("input:checkbox[id='knowledge']").prop("checked", true);
				break;
		}
	}
});
</script>

<style type="text/css">
.col-lg-10 ul {
	list-style-type: none;
}

.col-lg-10 li {
	float: left;
	padding: 0px 10px 10px 10px;
}
</style>
</head>


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
				<input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" name="pwd"
					maxlength="30" style="width: 80%; margin-top: 1%;">
			</div>
		</div>
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label" style="font-size: 20px;">패스워드 확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwordCheck" name="pwd" data-rule-required="true" maxlength="30"
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
					value=${users.getPhone() } style="width: 80%; margin-top: 1%;">
			</div>
		</div>
		<div class="form-group" id="divEmail">
			<label for="inputEmail" class="col-lg-2 control-label" style="font-size: 20px;">이메일</label>
			<div class="col-lg-10">
				<input type="email" class="form-control" id="email" data-rule-required="true" name="email"
					style="width: 80%; margin-top: 1%;" value=${users.getEmail() }>
			</div>
		</div>

		<div class="form-group" id="divInterest">
			<label for="inputInterest" class="col-lg-2 control-label" style="font-size: 20px;">흥미 카테고리</label>
			<div class="col-lg-10" style="font-size: 15px; padding: 6px 12px;">
				<ul>
					<li><input type="checkbox" id="relation" name="interest" value="인연"> 인연<br></li>
					<li><input type="checkbox" id="game" name="interest" value="게임"> 게임<br></li>
					<li><input type="checkbox" id="meeting" name="interest" value="모임"> 모임<br></li>
					<li><input type="checkbox" id="travel" name="interest" value="여행"> 여행<br></li>
					<li><input type="checkbox" id="restaurant" name="interest" value="맛집"> 맛집<br></li>
					<li><input type="checkbox" id="lecture" name="interest" value="강연"> 강연<br></li>
					<li><input type="checkbox" id="knowledge" name="interest" value="지식"> 지식<br></li>
				</ul>

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
