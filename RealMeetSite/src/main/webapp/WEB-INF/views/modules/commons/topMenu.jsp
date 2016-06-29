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

	<%-- <div id="top_loginModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<jsp:include page="../login.jsp" flush="false"></jsp:include>
			</div>
		</div>
	</div> --%>
	<div class="join-top">
		<div class="container" id="topMenu" style="box-shadow: 1px 1px 1px 1px gainsboro;">
			<ul id="topMenuUl-left">
				<li><a class="topButton" id="topButton-logo"
					href="${pageContext.request.contextPath}/"><span class="icon fa-child"></span>DADLEMOYEO</a></li>
					<li><a class="topButton" href="#"><span class="icon fa-angle-double-down"></span>EVENT</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/event/list" id="list-link" class="skel-layers-ignoreHref"><span class="icon fa-book">EVENT LIST</span></a></li>
							<li><a href="${pageContext.request.contextPath}/event/reg" id="reg-link" class="skel-layers-ignoreHref"><span class="icon fa-th">EVENT CREATE</span></a></li>
						</ul>
					</li>
					<li><a class="topButton" href="#"><span class="icon fa-angle-double-down"></span>BOARD</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/board/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">FREE BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/rshipBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">RELATIONSHIP BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/gameBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">GAME BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/travelBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">TRVEL BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/lectureBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">LECTURE BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/foodBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">FOOD BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/knowledgeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">KNOWLEDGE BOARD</span></a></li>
							<li><a href="${pageContext.request.contextPath}/board/meetingBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">MEETING BOARD</span></a></li>
						</ul>
					</li>
			</ul>
			<ul id="topMenuUl-right">
				<c:if test="${empty mid}">
					<li><a class="topButton" href="#"
						type="button" onclick="openLoginForm();"><span class="icon fa-unlock"></span>LOGIN</a></li>
				</c:if>
				<c:if test="${!empty mid}">
					<li>[<span style="font-weight: bold; font-size: 120%;"><c:out value="${mid}"/></span>]님 안녕하세요</li>
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/logout"><span class="icon fa-lock"></span>LOGOUT</a></li>
				</c:if>
				<c:if test="${empty mid}">
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/users/join"><span class="icon fa-user-plus"></span>JOIN</a></li>
				</c:if>
				<c:if test="${!empty mid}">
					<li><a class="topButton"
						href="${pageContext.request.contextPath}/users/home"><span class="fa fa-user-plus"></span>INFO</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/customer/customer" class="skel-layers-ignoreHref"><span class="icon fa-users"></span>고객센터</a></li>
			</ul>
		</div>
	</div>
</body>
</html>