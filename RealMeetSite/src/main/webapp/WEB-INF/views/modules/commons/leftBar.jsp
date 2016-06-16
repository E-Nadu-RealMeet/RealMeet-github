<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							</h1>
							<p>환영합니다</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
							<li><a href="${pageContext.request.contextPath}/" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">홈페이지로</span></a></li>
							<c:if test="${empty mid}">
							</c:if>
							<c:if test="${!empty mid}">
								<li><a href="${pageContext.request.contextPath}/users/info?id=${mid}" id="top-link" class="skel-layers-ignoreHref"><span class="fa fa-user-plus">회원정보보기</span></a></li>
							</c:if>
							<li><a href="${pageContext.request.contextPath}/event/list" id="list-link" class="skel-layers-ignoreHref"><span class="icon fa-book">이벤트 리스트</span></a></li>
							<li><a href="${pageContext.request.contextPath}/event/reg" id="reg-link" class="skel-layers-ignoreHref"><span class="icon fa-th">이벤트 만들기</span></a></li>

							<li><a href="${pageContext.request.contextPath}/board/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-list">게시판</span></a></li>
							<li><a href="${pageContext.request.contextPath}/customer/customer" id="" class="skel-layers-ignoreHref"><span class="icon fa-users">고객센터</span></a></li>

							

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