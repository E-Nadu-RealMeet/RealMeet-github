<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE HTML>

<html>
<head>
<title>내 정보</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css">


<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersEdit.css" />-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>

	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>

	<div id="main">
		<div style="margin-bottom: 20px; text-align: center;"> 
			<c:out value="상단바"></c:out>
		</div>
		<div class="container" style="margin-bottom: 10px; text-align: center;">
			<c:out value="회원정보"></c:out>
			<hr style="border: solid 1px #ddd; margin: 0 0 1em 0;">
		</div>
		<div style="margin: 0 auto;">
			<div class="event_make" style="float: left; width:47%; text-align: center; border: 0.5px solid #cccccc; margin:1%; padding: 0 0.5em 0 0.5em;">
				<c:out value="내가 만든 이벤트 리스트"></c:out>
				<hr style="border: solid 1px #ddd; margin: 0 auto;">
			</div>
			<div class="event_join" style="float: right; width:47%; text-align: center; border: 0.5px solid #cccccc; margin:1%; padding: 0 0.5em 0 0.5em;">
				<c:out value="내가 참여한 이벤트 리스트"></c:out>
				<hr style="border: solid 1px #ddd; margin: 0 auto;">
			</div>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="../modules/commons/footer.jsp"></c:import>

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
<!DOCTYPE HTML>

<html>
<head>
<title>내 정보</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<%-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> --%>


<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/users/usersEdit.css" />-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
</head>

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