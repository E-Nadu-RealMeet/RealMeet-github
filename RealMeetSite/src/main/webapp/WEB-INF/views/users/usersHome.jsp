<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<div class="container" style="margin-bottom: 10px; text-align: center;">
	<c:out value="회원정보"></c:out>
	<hr style="border: solid 1px #ddd; margin: 0 0 1em 0;">
	<jsp:include page="../users/usersInfo.jsp"></jsp:include>
</div>
<div style="margin: 0 auto;">
	<div class="event_make"
		style="float: left; width: 47%; text-align: center; border: 0.5px solid #cccccc; margin: 1%; padding: 0 0.5em 0 0.5em;">
		<c:out value="내가 만든 이벤트 리스트"></c:out>
		<hr style="border: solid 1px #ddd; margin: 0 auto;">
	</div>
	<div class="event_join"
		style="float: right; width: 47%; text-align: center; border: 0.5px solid #cccccc; margin: 1%; padding: 0 0.5em 0 0.5em;">
		<c:out value="내가 참여한 이벤트 리스트"></c:out>
		<hr style="border: solid 1px #ddd; margin: 0 auto;">
	</div>
</div>