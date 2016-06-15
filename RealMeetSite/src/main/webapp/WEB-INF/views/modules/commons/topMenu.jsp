<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title></title>

</head>
<body>

	<div id="top_loginModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<jsp:include page="../login.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div>
	<div class="join-top">
		<div class="container" id="topMenu">
			<ul id="topMenuUl-left">
				<li><a class="topButton" id="topButton-logo"
					href="${pageContext.request.contextPath}/">homepage</a></li>
					<li><a class="topButton" href="#"><span class="icon fa-angle-double-down"></span>event</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/event/list" id="list-link" class="skel-layers-ignoreHref"><span class="icon fa-book">event list</span></a></li>
							<li><a href="${pageContext.request.contextPath}/event/reg" id="reg-link" class="skel-layers-ignoreHref"><span class="icon fa-th">event create</span></a></li>
						</ul>
					</li>
					<li><a class="topButton" href="#"><span class="icon fa-angle-double-down"></span>board</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/board/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">free board</span></a></li>
						</ul>
					</li>
			</ul>
			<ul id="topMenuUl-right">
				<c:if test="${empty mid}">
					<li><a class="topButton" href="#" data-toggle="modal"
						data-target="#top_loginModal" type="button">login</a></li>
				</c:if>
				<c:if test="${!empty mid}">
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/logout">logout</a></li>
				</c:if>
				<c:if test="${empty mid}">
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/users/join">join</a></li>
				</c:if>
				<c:if test="${!empty mid}">
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/users/info?id=${mid}">info</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</body>
</html>