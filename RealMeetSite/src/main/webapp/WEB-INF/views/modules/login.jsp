<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

<style>

</style>

<div>
	<form action="${pageContext.request.contextPath}/login" method="post" style="width: 200%">
		<ul>
		<c:if test="${cookieMid != null}">
			<li><label> 아이디&nbsp;&nbsp; <input type="text" size="20" name="mid" value="${cookieMid }"></label></li>
			<li><label><input type="checkbox" name="checkBoxMid" checked="checked">아이디 저장</label></li>
			</c:if>
			<c:if test="${cookieMid == null || cookiemid == ''}">
			<li><label> 아이디&nbsp;&nbsp; <input type="text" size="20" name="mid" value=""></label></li>
			<li><label><input type="checkbox" name="checkBoxMid">아이디 저장</label></li>
			</c:if>
			<li><label> 비밀번호 <input type="password" size="20" name="pwd" value=""></label></li>
		</ul>
		<input type="submit" value="로그인" />
	</form>
</div>
