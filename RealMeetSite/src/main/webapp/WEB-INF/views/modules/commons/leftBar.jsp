<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</style>

<style>
#accordion {
    list-style: none;
/*     padding: 0 0 0 0; */
/*     width: 170px; */
}
#accordion div {
    display: block;
/*     background-color: #FF9927; */
/*     font-weight: bold; */
/*     margin: 1px; */
/*     cursor: pointer; */
/*     padding: 5 5 5 7px; */
/*     list-style: circle; */
/*     -moz-border-radius: 10px; */
/*     -webkit-border-radius: 10px; */
/*     border-radius: 10px; */
}
#accordion ul {
    list-style: none;
    padding: 0 0 0 0;
}
#accordion ul{
    display: none;
}
#accordion ul li {
    font-weight: normal;
    cursor: auto;
    font-size: 16px;
/*     background-color: #fff; */
/*     padding: 0 0 0 7px; */
}
#accordion a {
    text-decoration: none;
}
#accordion a:hover {
    text-decoration: underline;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/jquery-1.11.3.min.js"></script>

</head>
<body>
<!-- Header -->
			<div id="header">

				<div class="top">	

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/core/images/avatar.jpg" alt="" /></a></span>
							<h1 id="title">
							<c:if test="${not empty mid}">
								<c:out value="${mid}님"/>
							</c:if>
							<c:if test="${empty mid}">
								<c:out value="안녕하세요"/>
							</c:if>
							</h1>
							<p>환영합니다</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
							<li><a href="${pageContext.request.contextPath}/" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">홈페이지로</span></a></li>
							<c:if test="${empty mid}">
								<li><a href="${pageContext.request.contextPath}/login" data-toggle="modal" data-target="#loginModal" type="button" class="skel-layers-ignoreHref"><span class="icon fa-unlock">로그인</span></a></li>
							</c:if>
							<c:if test="${!empty mid}">
								<li><a href="${pageContext.request.contextPath}/logout" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-lock">로그아웃</span></a></li>
							</c:if>
							<c:if test="${!empty mid}">
								<li><a href="${pageContext.request.contextPath}/users/info?id=${mid}" id="top-link" class="skel-layers-ignoreHref"><span class="fa fa-user-plus">회원정보보기</span></a></li>
							</c:if>
							<li><a href="${pageContext.request.contextPath}/event/list" id="list-link" class="skel-layers-ignoreHref"><span class="icon fa-book">이벤트 리스트</span></a></li>
							<li><a href="${pageContext.request.contextPath}/event/reg" id="reg-link" class="skel-layers-ignoreHref"><span class="icon fa-th">이벤트 만들기</span></a></li>

							<li><a href="${pageContext.request.contextPath}/board/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">게시판</span></a></li>
							<li><a href="${pageContext.request.contextPath}/customer/customer" id="" class="skel-layers-ignoreHref"><span class="icon fa-users">고객센터</span></a></li>

							
							</ul>
							<ul id="accordion">
							<li><div><a href="#" id="" class="skel-layers-ignoreHref"><span class="icon fa-users">고객센터</span></a></div>
							<ul>
          						  <li><a href="${pageContext.request.contextPath}/customer/Notices" id="" class="skel-layers-ignoreHref">공지사항</a></li>
           						 <li><a href="${pageContext.request.contextPath}/customer/FAQs" id="" class="skel-layers-ignoreHref">FAQ</a></li>
            					<li><a href="${pageContext.request.contextPath}/customer/QNA" id="" class="skel-layers-ignoreHref">내 문의내역</a></li>
            					<li><a href="${pageContext.request.contextPath}/customer/Call" id="" class="skel-layers-ignoreHref">문의하기</a></li>
            					<li><a href="${pageContext.request.contextPath}/customer/information" id="" class="skel-layers-ignoreHref">이용안내</a></li>
       						 </ul>
       						 </li>

							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>

				</div>

			</div>
			
			
<!-- 	<div class="modal" tabindex="-1" role="dialog" id="callmodal"> -->
<!--       <div class="modal-dialog modal-sm"> -->
<!--       <div class="modal-content"> -->
<%--        <jsp:include page="../modules/login.jsp"></jsp:include> --%>
<!--       </div> -->
<!--       </div> -->
<!--       </div> -->
			
			
<script>
$("#accordion > li > div").click(function(){
	 
    if(false == $(this).next().is(':visible')) {
        $('#accordion ul').slideUp(300);
    }
    $(this).next().slideToggle(300);
});


   
        $("#loginmodal").modal();
 

</script>
</body>
</html>