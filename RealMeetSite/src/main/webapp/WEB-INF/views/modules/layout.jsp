<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Prologue by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=true"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/gmap/gmaps.js"></script>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>

<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>

<!-- holder.js link -->
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<!-- tiles를 이용한 부분 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css<tiles:getAsString name="css"/>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/upload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js<tiles:getAsString name="js"/>"></script>
</head>
<body>
	<!-- Header -->
	<div id="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	<!-- Main -->
	<div id="main">
		<tiles:insertAttribute name="topMenu"></tiles:insertAttribute>
		<!-- Intro -->
		<tiles:insertAttribute name="intro"></tiles:insertAttribute>

		<!-- Content -->
		<section id="portfolio" class="two">
			<c:if test="${page=='index'}">
				<tiles:insertAttribute name="carousel"></tiles:insertAttribute>
			</c:if>
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</section>
	</div>

	<!-- Footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
