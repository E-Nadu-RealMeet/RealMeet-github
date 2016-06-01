<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/login.css" />
<script src="${pageContext.request.contextPath}/resources/core/js/login.js" type="text/javascript"></script>
<style>
#accordion {
    list-style: none;
    padding: 0 0 0 0;
/*     width: 170px; */
}
#accordion div {
    display: block;
/*     background-color: #FF9927; */
    font-weight: bold;
    margin: 1px;
    cursor: pointer;
    padding: 5 5 5 7px;
    list-style: circle;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
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
/*     background-color: #fff; */
    padding: 0 0 0 7px;
}
#accordion a {
    text-decoration: none;
}
#accordion a:hover {
    text-decoration: underline;
}
</style>



</head>
<body>
<!-- Header -->  
			<div id="header">

				<div class="top">	

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/core/images/avatar.jpg" alt="" /></a></span>
							<h1 id="title">${mid}</h1>
							<p>환영합니다.</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<c:if test="${empty mid}">
								<li><a href="${pageContext.request.contextPath}/login" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home"> 로그인</span ></a></li>
								
								</c:if>
								<c:if test="${!empty mid}">
								<li><a href="${pageContext.request.contextPath}/logout" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home"> 로그아웃</span ></a></li>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/event/list" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">이벤트 리스트</span></a></li>
								<li><a href="${pageContext.request.contextPath}/event/reg" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">이벤트 만들기</span></a></li>
								<li><a href="${pageContext.request.contextPath}/freeBoard" id="" class="skel-layers-ignoreHref"><span class="icon fa-free">게시판</span></a></li>
							</ul>
							<ul id="accordion">
    						<li><div><a href="${pageContext.request.contextPath}/customer/customer"><span class="icon fa-user">고객센터</span></a></div>
       							 <ul>
									<li><a href="${pageContext.request.contextPath}/customer/Notices" ><span class="icon fa-user">공지사항</span></a></li>
									<li><a href="${pageContext.request.contextPath}/customer/FAQs" ><span class="icon fa-user">FAQ</span></a></li>
									<li><a href="${pageContext.request.contextPath}/customer/QNA" ><span class="icon fa-user">내 문의내역</span></a></li>
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
			
			<div class="modal"></div>
<div class="modal-content">
     <form action="login" method ="post">
     <ul >
           <li>
               <label> 아이디&nbsp;&nbsp; <input type = "text" size ="20" name="mid" value= ""></label >
           </li>
           <li>
               <label> 비밀번호 <input type = "text" size="20" name="pwd" value= ""></label >
           </li>
     </ul >
           <input type= "submit" value ="로그인" />
     </form >
   </div>
<script>
$("#accordion > li > div").click(function(){
	 
    if(false == $(this).next().is(':visible')) {
        $('#accordion ul').slideUp(300);
    }
    $(this).next().slideToggle(300);
});


</script>
</body>
</html>