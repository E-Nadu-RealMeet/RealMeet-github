<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title></title>

<style type="text/css">

.modal-open {
	overflow: hidden
}

.modal {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1050;
	display: none;
	overflow: hidden;
	-webkit-overflow-scrolling: touch;
	outline: 0
}

.modal.fade .modal-dialog {
	-webkit-transition: -webkit-transform .3s ease-out;
	-o-transition: -o-transform .3s ease-out;
	transition: transform .3s ease-out;
	-webkit-transform: translate(0, -25%);
	-ms-transform: translate(0, -25%);
	-o-transform: translate(0, -25%);
	transform: translate(0, -25%)
}

.modal.in .modal-dialog {
	-webkit-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	-o-transform: translate(0, 0);
	transform: translate(0, 0)
}

.modal-open .modal {
	overflow-x: hidden;
	overflow-y: auto
}

.modal-dialog {
	position: relative;
	width: auto;
	margin: 10px
}

.modal-content {
	position: relative;
	background-color: #fff;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: 6px;
	outline: 0;
	-webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	box-shadow: 0 3px 9px rgba(0, 0, 0, .5)
}

.modal-backdrop {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1040;
	background-color: #000
}

.modal-backdrop.fade {
	filter: alpha(opacity = 0);
	opacity: 0
}

.modal-backdrop.in {
	filter: alpha(opacity = 50);
	opacity: .5
}

.modal-header {
	padding: 15px;
	border-bottom: 1px solid #e5e5e5
}

.modal-header .close {
	margin-top: -2px
}

.modal-title {
	margin: 0;
	line-height: 1.42857143
}

.modal-body {
	position: relative;
	padding: 15px
}

.modal-footer {
	padding: 15px;
	text-align: right;
	border-top: 1px solid #e5e5e5
}

.modal-footer .btn+.btn {
	margin-bottom: 0;
	margin-left: 5px
}

.modal-footer .btn-group .btn+.btn {
	margin-left: -1px
}

.modal-footer .btn-block+.btn-block {
	margin-left: 0
}

.modal-scrollbar-measure {
	position: absolute;
	top: -9999px;
	width: 50px;
	height: 50px;
	overflow: scroll
}

@media ( min-width :768px) {
	.modal-dialog {
		width: 600px;
		margin: 30px auto
	}
	.modal-content {
		-webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
		box-shadow: 0 5px 15px rgba(0, 0, 0, .5)
	}
	.modal-sm {
		width: 300px
	}
}

@media ( min-width :992px) {
	.modal-lg {
		width: 900px
	}
}

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
.topButton{
	font-size: 1.1em;
}
.topButton:HOVER{
	color:white;
}
</style>


</head>
<body style="padding: 0px; margin: 0px; font-family: Arial, sans-serif">
	<div id="top_loginModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <jsp:include page="../login.jsp" flush="false"></jsp:include>
            </div>
        </div>
    </div>
	<div class="join-top">
		<ul style="margin: 0 auto;position: fixed;background-color: rgba(0, 0, 0, 0.2);width: 100%;text-align: right;right: 0;z-index: 11;top: 0;font-size: 1.2em;">
			<li><a class="topButton" href="${pageContext.request.contextPath}/">홈</a></li>

			<c:if test="${empty mid}">
				<li><a class="topButton" href="#" data-toggle="modal" data-target="#top_loginModal" type="button">로그인</a></li>
			</c:if>
			<c:if test="${!empty mid}">
				<li><a class="topButton" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			</c:if>
			<c:if test="${empty mid}">
				<li><a class="topButton" href="${pageContext.request.contextPath}/users/join">회원가입</a></li>
			</c:if>
			<c:if test="${!empty mid}">
				<li><a class="topButton" href="${pageContext.request.contextPath}/users/info?id=${mid}">회원정보보기</a></li>
			</c:if>
			
		</ul>
	</div>
	

</body>
</html>