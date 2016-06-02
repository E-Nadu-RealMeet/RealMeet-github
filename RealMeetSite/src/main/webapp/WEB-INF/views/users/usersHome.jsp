<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>내 정보</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css"> --%>


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
		<div></div>
		<div class="container">
			<c:out value="하하하"></c:out>
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
