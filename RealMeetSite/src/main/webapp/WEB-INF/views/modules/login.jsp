<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:choose>
<c:when test="${sessionScope.error=='loginError'}">
	<div class="login-sum" style="display:block;">
	<div id="login-div" onclick="event.cancelBubble=true">
		<a class="icon fa-times-circle-o"
				style="float: right; font-size: 1.5em; color: #bf0b0b;"
				onclick="closeLoginForm();"></a>
		<span id="error-login">로그인에 실패하셨습니다. 아이디와 비밀번호를 확인해주세요</span>
</c:when>
<c:when test="${empty sessionScope.error}">
	<div class="login-sum" style="display: none;">
	<div id="login-div" onclick="event.cancelBubble=true">
		<a class="icon fa-times-circle-o"
				style="float: right; font-size: 1.5em; color: #bf0b0b;"
				onclick="closeLoginForm();"></a>
		<span id="error-login"> </span>
</c:when>
<c:when test="${sessionScope.error=='notLoginError'}">
	<div class="login-sum" style="display:block;">
	<div id="login-div" onclick="event.cancelBubble=true">
		<a class="icon fa-times-circle-o"
			style="float: right; font-size: 1.5em; color: #bf0b0b;"
			onclick="closeLoginForm();"></a>
		<span id="error-login">로그인이 필요합니다 로그인 해주세요</span>
</c:when>
</c:choose>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div>
				<c:if test="${!empty cookieMid}">
					<input type="text" size="20" name="mid" value="${cookieMid }"
						placeholder="아이디를 입력해주세요">
					<br>
					<input type="password" size="20" name="pwd" value=""
						placeholder="비밀번호를 입력해주세요">
					<br>
					<label for="saveId" id="saveId-label">아이디 저장</label>
					<input type="checkbox" name="checkBoxMid" id="saveId"
						checked="checked">
				</c:if>
				<c:if test="${empty cookieMid}">
					<input type="text" size="20" name="mid" value=""
						placeholder="아이디를 입력해주세요">
					<br>
					<input type="password" size="20" name="pwd" value=""
						placeholder="비밀번호를 입력해주세요">
					<br>
					<label for="saveId" id="saveId-label">아이디 저장</label>
					<input type="checkbox" id="saveId" name="checkBoxMid">

				</c:if>
			</div>

			<button style="float: right;margin-left: 1em;"
				onclick="function(){window.location.href='${pageContext.request.contextPath}/users/join'}">회원가입</button>
			<button style="float: right;margin-left: 1em;" type="submit">로그인</button>
		</form>
	</div>
</div>