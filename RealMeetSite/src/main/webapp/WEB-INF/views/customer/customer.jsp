<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<script src="${pageContext.request.contextPath}/resources/core/js/customer.js" type="text/javascript"></script>


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
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#FAQsModal">
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
												
						</section>
					

<div class="modal fade" id="NoticesModal" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
								<h2>공지사항</h2>
							</header>
							

  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>


				<c:forEach var="Notices" items="${Notices}">
					<tr>
						<td>${Notices.nidx}</td>
						<td><a href="NoticesDetail/${Notices.nidx}" data-toggle="modal" data-target="#NoticesDetailModal" style="color: #81918E;">${Notices.title}</a></td>
						<td>${Notices.regdate}</td>
					</tr>
				</c:forEach>

			</table>

<%-- 			<form method="get" action="Notices/${title}"> --%>
<!-- 				<div class="4u" align="center" ><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /> -->
<!-- 				<input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" data-dismiss="modal" data-toggle="modal" data-target="#NoticesModal" value="검색" /></div> -->
<!-- 				</form> -->
				<button data-dismiss="modal">닫기</button>



</div>   
</div>
</div>

<div id="FAQsModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
								<h2>FAQ</h2>
							</header>
							

  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>


				<c:forEach var="FAQs" items="${FAQs}">
					<tr>
						<td>${FAQs.fidx}</td>
						<td><a href="FAQsDetail/${FAQs.fidx}" data-toggle="modal" data-target="#FAQsDetailModal" style="color: #81918E;">${FAQs.title}</a></td>
						<td>${FAQs.regdate}</td>
					</tr>
				</c:forEach>

			</table>

<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
				<button data-dismiss="modal">닫기</button>
</div>   

</div>
</div>

<div id="QNAModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
								<h2>내 문의내역</h2>
							</header>
							

  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>


				<c:forEach var="QNA" items="${QNA}">
					<tr>
						<td>${QNA.qidx}</td>
						<td><a href="QNADetail/${QNA.qidx}" data-toggle="modal" data-target="#QNADetailModal" style="color: #81918E;">${QNA.title}</a></td>
						<td>${QNA.regdate}</td>
					</tr>
				</c:forEach>

			</table>

<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
				<button data-dismiss="modal">닫기</button>
</div>   
</div>
</div>

<div id="callModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
								<h2>문의하기</h2>
							</header>

<!-- 문의하기 기본 뷰 -->
							<form method="post" action="insertQNA">
								<div class="row">
									<div class="11u" style="margin-left: 2%"><input type="text" name="title" placeholder="제목" /></div>
									<div class="11u$" style="margin-left: 2%">
										<textarea name="content" placeholder="내용"></textarea>
									</div>
									<div class="11u$" style="margin-left: 2%">
										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="문의" />
									</div>
								</div>
							</form>
		
</div>
</div>
</div>

<div id="NoticesDetailModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">

<header>
								<h2>공지사항</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${NoticesDetail.title}</th>
				</tr>
				
				<tr>
					<th>작성일</th>
					<th>${NoticesDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${NoticesDetail.content}</td>
					</tr>
			

			</table>

			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" /></a>
			</div>

<%-- <jsp:include page="NoticesDetail.jsp"></jsp:include> --%>
</div>

</div>
</div>


<div id="FAQsDetailModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">

<header>
								<h2>FAQ</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${FAQDetail.title}</th>
				</tr>
				
				<tr>
					<th>작성일</th>
					<th>${FAQDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${FAQDetail.content}</td>
					</tr>
			

			</table>

			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" /></a>
			</div>
</div>
</div>
</div>


<div id="QNADetailModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">

<header>
								<h2>내 문의내역</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${QNAsDetail.title}</th>
				</tr>
				
				<tr>
					<th>작성일</th>
					<th>${QNAsDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${QNAsDetail.content}</td>
					</tr>
			

			</table>

			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" /></a>
			</div>


</div>
</div>
</div>