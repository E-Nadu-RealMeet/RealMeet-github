<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

<style>

</style>

<div>
	<form action="${pageContext.request.contextPath}/login" method="post">
		
		<c:if test="${cookieMid != null}">
			<input type="text" size="20" name="mid" value="${cookieMid }" placeholder="아이디를 입력해주세요">
			<label for="saveId" id="saveId-label">아이디 저장</label><input type="checkbox" name="checkBoxMid" id="saveId" checked="checked">
			</c:if>
			<c:if test="${cookieMid == null || cookiemid == ''}">
			<input type="text" size="20" name="mid" value="" placeholder="아이디를 입력해주세요">
			<label for="saveId" id="saveId-label">아이디 저장</label><input type="checkbox" id="saveId" name="checkBoxMid">
			</c:if>
			<input type="password" size="20" name="pwd" value="" placeholder="비밀번호를 입력해주세요">
		
		<input type="submit" value="로그인" />
	</form>
</div>
