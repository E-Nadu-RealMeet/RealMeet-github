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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/customer.css" />


				<!-- Portfolio -->


					<section id="portfolio" class="two">
						<div class="container" id="container" style="margin-left: 1%; width: 200%">



							

							
							<div class="row">
								<div class="5u" style="margin-left: 7.5%; margin-bottom: 7%; margin-top: 7%">
									<article class="item" >
										<button data-toggle="modal" data-target="#NoticesModal" style="background-image:url('../resources/core/images/Norway-summer-landscape-grass-trees-road-hills-green_1920x1080.jpg'); width: 100%; height: 250px;"><h2 style="color: white;">공지사항</h2></button>
									</article>
									<article class="item">
										<button data-toggle="modal" data-target="#QNAModal" style="background-image:url('../resources/core/images/16.jpg'); width: 100%; height: 250px;"><h2 style="color: white;">문의내역</h2></button>
									</article>
								</div>
								<div class="5u" style="margin-top: 7%" >
									<article class="item">
										<button data-toggle="modal" data-target="#FAQsModal" style="background-image:url('../resources/core/images/duga14.jpg'); width: 100%; height: 250px;"><h2 style="color: white;">FAQ</h2></button>
									</article>
									<article class="item">
										<button data-toggle="modal" data-target="#callModal" style="background-image:url('../resources/core/images/F4-1.jpg'); width: 100%; height: 250px;"><h2 style="color: white;">문의하기</h2></button>
									</article>
								</div>
							</div>
							
							
							<a href="information" >
										<header>
											<h2>이용안내</h2>
										</header></a>
						</div>
												
						</section>
					

<div class="modal fade" id="NoticesModal" role="dialog">
 <div class="modal-dialog">
 <div class="modal-content">
 
 <div class="modal-header">
 <header>
								<h2>공지사항</h2>
							</header>
 </div>
<div class="modal-body">

							

  <table class="table">
            <thead>
                <tr>
                    <th style="text-align: center;">번호</th>
                    <th style="text-align: center;">제목</th>
                    <th style="text-align: center;">작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="Notices" items="${Notices}">
					<tr>
						<td>${Notices.nidx}</td>
						<td><a href="NoticesDetail/${Notices.nidx}" data-toggle="modal" data-target="#NoticesDetailModal" style="color: #81918E;">${Notices.title}</a></td>
						<td>${Notices.regdate}</td>
					</tr>
			</c:forEach>
			</tbody>
        </table>
<!--         <ul class="pager"> -->
<!--             <li data-bind="css: {'disabled': !previousPageEnabled()}"> <a href="#" data-bind="click: previousPage">Previous</a> -->

<!--             </li> -->
<!--             <li data-bind="css: {'disabled': !nextPageEnabled()}"> <a href="#" data-bind="click: nextPage">Next</a> -->

<!--             </li> -->
<!--         </ul>			 -->
<%-- 			<form method="get" action="Notices/${title}"> --%>
<!-- 				<div class="4u" align="center" ><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /> -->
<!-- 				<input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" data-dismiss="modal" data-toggle="modal" data-target="#NoticesModal" value="검색" /></div> -->
<!-- 				</form> -->
</div>
<div class="modal-footer">
				<button data-dismiss="modal">닫기</button>

<%-- <jsp:include page="Notices.jsp"></jsp:include> --%>

</div>   

</div>
</div>
</div>

<div id="FAQsModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
 <div class="modal-header">
<header>
								<h2>FAQ</h2>
							</header>
</div>							

<div class="modal-body">
  <table class="table">

				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>

				<tbody>
				<c:forEach var="FAQs" items="${FAQs}">
					<tr>
						<td>${FAQs.fidx}</td>
						<td><a href="FAQsDetail/${FAQs.fidx}" data-toggle="modal" data-target="#FAQsDetailModal" style="color: #81918E;">${FAQs.title}</a></td>
						<td>${FAQs.regdate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
</div>
<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
<div class="modal-footer">
				<button data-dismiss="modal">닫기</button>
</div>   

</div>
</div>
</div>
<div id="QNAModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
 <div class="modal-header">
<header>
								<h2>문의내역</h2>
							</header>
						</div>	
<div class="modal-body">
  <table class="table">

				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성일</th>
				</tr>

				<tbody>
				<c:forEach var="QNA" items="${QNA}">
					<tr>
						<td>${QNA.qidx}</td>
						<td><a href="QNADetail/${QNA.qidx}" data-toggle="modal" data-target="#QNADetailModal" style="color: #81918E;">${QNA.title}</a></td>
						<td>${QNA.regdate}</td>
						<c:if test="${mid == 'won' && QNA.answer == 'N/A'}">
						<td><a href="Answer/${QNA.qidx}" data-toggle="modal" data-target="#AnswerModal"><span class="icon fa-pencil-square-o">답변</span></a></td>
						</c:if>
					</tr>
				</c:forEach>
				</tbody>
			</table>
</div>
<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
<div class="modal-footer">

				<button data-dismiss="modal">닫기</button>
</div>   
</div>
</div>
</div>

<div id="callModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<header>
								<h2>문의하기</h2>
							</header>

</div>
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
			</div>
			</div>

<%-- <jsp:include page="NoticesDetail.jsp"></jsp:include> --%>


</div>



<div id="FAQsDetailModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<header>
								<h2>FAQ</h2>
							</header>
	</div>			

<div class="modal-body">
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
</div>
<div class="modal-footer">
			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" />
			</div>
			
</div>
</div>
</div>


<div id="QNADetailModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">

<header>
								<h2>문의내역</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${QNADetail.title}</th>
				</tr>
				
				<tr>
					<th>작성일</th>
					<th>${QNADetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${QNADetail.content}</td>
					</tr>
			

			</table>

			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" />
			</div>


</div>
</div>


<div id="AnswerModal" class="modal fade" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">

<header>
								<h2>답변하기</h2>
							</header>
							
							<h3>답변할 게시물 : ${QNADetail.title}</h3>
								
					
							<form action="addAnswer" method="post">
									<div class="11u$" style="margin-left: 4%">
										<textarea name="answer" placeholder="답변내용"></textarea>
									</div>
									
									<div class="11u$" style="margin-left: 4%">
										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="답변" />
										<input type="hidden" name="qidx" value="${QNADetail.qidx}">
									</div>
							</form>
</div>
</div>
</div>
