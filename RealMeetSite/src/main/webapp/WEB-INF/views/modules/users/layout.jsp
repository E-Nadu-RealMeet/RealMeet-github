<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/${page }.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

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
		<section id="portfolio" class="two">
		<!-- Content -->
			<tiles:insertAttribute name="users_content"></tiles:insertAttribute>
		</section>
		</div>

		<!-- Footer -->
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>

		<!-- Scripts -->
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
</body>

</html>