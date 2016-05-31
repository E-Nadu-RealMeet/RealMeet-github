<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
							<h1 id="title">index</h1>
							<p>${name}</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
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