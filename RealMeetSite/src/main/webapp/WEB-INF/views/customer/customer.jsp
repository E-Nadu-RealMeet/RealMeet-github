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
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resources/core/js/customer.js"></script>
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
		
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
	
	
	
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
		
		
		
		<!-- Main -->
			<div id="main">
			<jsp:include page="../modules/commons/topMenu.jsp"></jsp:include>
		<section id="top" class="one dark cover">
<%-- 		<img src="${pageContext.request.contextPath}/resources/core/images/thumb_cs_call.jpg" width=""> --%>
				<header>
					<h2>고객센터</h2>
				</header>
		</section>
	<section>

				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container" id="container">



							

							
							<div class="row">
								<div class="5u" style="margin-left: 6%; margin-bottom: 7%; margin-top: 7%">
									<article class="item" >
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NoticesModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" width="200px" height="100px"/>
										<header>
											<h2 >공지사항</h2>
										</header></button>
									</article>
									<article class="item">
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#QNAModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic06.jpg" alt="" width="200px" height="100px"/>
										<header>
											<h2>내 문의내역</h2>
										</header></button>
									</article>
								</div>
								<div class="5u" style="margin-top: 7%" >
									<article class="item">
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#FAQModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic04.jpg" alt="" width="200px" height="100px"/>
										<header>
											<h2>FAQ</h2>
										</header></button>
									</article>
									<article class="item">
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#callModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic05.jpg" alt="" width="200px" height="100px"/>
									
										<header>
											<h2>문의하기</h2>
										</header>
										</button>
									</article>
								</div>
							</div>
							<a href="information" >
										<header>
											<h3>이용안내</h3>
										</header></a>
						</div>
						
						
						<article class="item">
										
									</article>
						
						
					</section>

				</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Ssangyong. All rights reserved.</li><li>Design: 팀명</li>
					</ul>

			</div>
			
	<!-- Modal content-->
	
	
      
      
      
     <div class="modal fade" role="dialog" id="FAQsDetailModal">
      <div class="modal-dialog">
      <div class="modal-content"> 
							<div class="modal"></div>
  <div class="modal-content">
  							<span class="close">×</span>
							<header>
								<h2>공지사항</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${FAQsDetail.title}</th>
				</tr>


				
					<tr>
					<td>${FAQsDetail.content}</td>
					</tr>
			

			</table>

			<a href="../Notices"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="뒤로" /></a>
			</div>
      </div>
      </div>
      </div> 
      
	
	<div class="modal fade" role="dialog" id="QNAModal">
      <div class="modal-dialog">
      <div class="modal-content"> 
							<header>
								<h2 align="center">내 문의내역</h2>
							</header>


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>


				<c:forEach var="QNA" items="${QNA}">
					<tr>
						<td>${QNA.qidx}</td>
						<td><a href="QNADetail/${QNA.qidx}">${QNA.title}</a></td>
						<td>${QNA.regdate}</td>
					</tr>
				</c:forEach>

			</table>
			

				<table>
			<tr>
			<td><form method="post" action="QNA">
				<div class="6u" align="center"><input style="margin-left: 50%; padding: 0.5em 1.0em 0.5em 1.0em;" type="text" name="title" placeholder="제목" />
				<input style="margin-left:50%; padding: 0.25em 1.0em 0.25em 1.0em;" type="submit" value="검색" /></div>
				</form></td>
			<td><a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a></td>
			</tr>
			</table>
      </div>
      </div>
      </div>
	
	
	
	
	<div class="modal fade" role="dialog" id="FAQModal">
      <div class="modal-dialog">
      <div class="modal-content"> 
							<header>
								<h2 align="center">FAQ</h2>
							</header>
							
  
  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>


				<c:forEach var="FAQs" items="${FAQs}">
					<tr>
						<td>${FAQs.fidx}</td>
						<td><a href="FAQsDetail/${FAQs.fidx}">${FAQs.title}</a></td>
						<td>${FAQs.regdate}</td>
					</tr>
				</c:forEach>

			</table>
				<table>
			<tr>
			<td><form method="post" action="FAQ">
				<div class="6u" align="center"><input style="margin-left: 50%; padding: 0.5em 1.0em 0.5em 1.0em;" type="text" name="title" placeholder="제목" />
				<input style="margin-left:50%; padding: 0.25em 1.0em 0.25em 1.0em;" type="submit" value="검색" /></div>
				</form></td>
			<td><a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a></td>
			</tr>
			</table>
      </div>
      </div>
      </div>
	
      <div class="modal fade" role="dialog" id="callModal">
      <div class="modal-dialog">
      <div class="modal-content"> 
							<header>
								<h2 align="center">문의하기</h2>
							</header>

<!-- 문의하기 기본 뷰 -->
							<form method="post" action="insertQNA">
								<div class="row">
									<div class="11u" style="margin-left: 1%"><input type="text" name="title" placeholder="제목" /></div>
									<div class="11u$" style="margin-left: 1%">
										<textarea name="content" placeholder="내용"></textarea>
									</div>
									<div class="12u$" style="">
									<table>
									<tr>
										<td><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: 50%" type="submit" value="문의" /></td>
										<td><a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.25em 1.0em 0.25em 1.0em;" type="submit" value="뒤로" /></a></td>
										</tr>
										</table>
									</div>
								</div>
							</form>
				
      </div>
      </div>
      </div>
    
      
   
		<!-- Scripts -->
<%-- 			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>




<script>
</script>

	</body>
</html>
