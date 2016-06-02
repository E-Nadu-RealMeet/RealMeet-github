<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<style type="text/css">
.join-top {
	text-align: right;
	color: #275973;
	line-height: 44px;
	font-size: 15px;
	background: rgba(0, 0, 0, 0.1);
	text-transform: uppercase;
	position: relative;
	box-shadow: 3px 0px 5px rgba(0, 0, 0, 0.2);
}

.join-top h1 {
	margin: 0 auto;
	width: 100%;
	font-weight: bold;
	font-family: 'Open Sans Condensed', 'Arial Narrow', Arial, sans-serif;
	text-transform: uppercase;
	font-size: 36px;
	text-shadow: 2px 2px 0px #F2F2F2, 1px 2px 0px #B1B1B2;
}

.join-top ul li {
	display: inline;
	margin-right: 20px;
}
</style>

</head>
<body
	style="padding: 0px; margin: 0px; font-family: Arial, sans-serif">
	<div class="join-top">
		<ul style="margin: 0 auto;">
			<li><a href="${pageContext.request.contextPath}/">홈</a></li>
			<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/users/join">회원가입</a></li>
		</ul>
	</div>
</body>
</html>