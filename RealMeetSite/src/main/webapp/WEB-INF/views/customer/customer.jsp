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
<<<<<<< HEAD
=======

>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
					<section id="portfolio" class="two">
						<div class="container" id="container">



							

							
							<div class="row">
								<div class="5u" style="margin-left: 6%; margin-bottom: 7%; margin-top: 7%">
									<article class="item" >
<<<<<<< HEAD
										<a href="Notices"><button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NoticesModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" width="200px" height="100px"/>
										<header>
											<h2 >공지사항</h2>
										</header></button></a>
=======
										<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NoticesModal">
										<img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" width="200px" height="100px"/>
										<header>
											<h2 >공지사항</h2>

										</header></button>
>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
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
												
						</section>
					

<!-- <div class="modal fade" id="NoticesModal" role="dialog"> -->
<!--  <div class="modal-dialog"> -->
<!-- <div class="modal-content"> -->
<!-- <header> -->
<!-- 								<h2>공지사항</h2> -->
<!-- 							</header> -->
							

<!--   <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;"> -->

<!-- 				<tr> -->
<!-- 					<th style="text-align: center;">번호</th> -->
<!-- 					<th style="text-align: center;">제목</th> -->
<!-- 					<th style="text-align: center;">작성일</th> -->
<!-- 				</tr> -->


<%-- 				<c:forEach var="Notices" items="${Notices}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${Notices.nidx}</td> --%>
<%-- 						<td><a href="NoticesDetail/${Notices.nidx}" data-toggle="modal" data-target="#NoticesDetailModal">${Notices.title}</a></td> --%>
<%-- 						<td>${Notices.regdate}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>

<!-- 			</table> -->

<%-- 			<form method="get" action="Notices/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
<!-- 				<button data-dismiss="modal">닫기</button> -->
<!-- </div>    -->
<!-- </div> -->
<!-- </div> -->

<!-- <div id="FAQModal" class="modal fade" role="dialog"> -->
<!--  <div class="modal-dialog"> -->
<!-- <div class="modal-content"> -->
<!-- <header> -->
<!-- 								<h2>FAQ</h2> -->
<!-- 							</header> -->
							

<!--   <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;"> -->

<!-- 				<tr> -->
<!-- 					<th style="text-align: center;">번호</th> -->
<!-- 					<th style="text-align: center;">제목</th> -->
<!-- 					<th style="text-align: center;">작성일</th> -->
<!-- 				</tr> -->


<%-- 				<c:forEach var="FAQs" items="${FAQs}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${FAQs.nidx}</td> --%>
<%-- 						<td><a href="FAQsDetail/${FAQs.nidx}">${FAQs.title}</a></td> --%>
<%-- 						<td>${FAQs.regdate}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>

<!-- 			</table> -->

<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
<!-- 				<button data-dismiss="modal">닫기</button> -->
<!-- </div>    -->
<!-- </div> -->
<!-- </div> -->

<!-- <div id="QNAModal" class="modal fade" role="dialog"> -->
<!--  <div class="modal-dialog"> -->
<!-- <div class="modal-content"> -->
<!-- <header> -->
<!-- 								<h2>공지사항</h2> -->
<!-- 							</header> -->
							

<!--   <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;"> -->

<!-- 				<tr> -->
<!-- 					<th style="text-align: center;">번호</th> -->
<!-- 					<th style="text-align: center;">제목</th> -->
<!-- 					<th style="text-align: center;">작성일</th> -->
<!-- 				</tr> -->


<%-- 				<c:forEach var="Notices" items="${QNA}"> --%>
<!-- 					<tr> -->
<%-- 						<td>${QNA.nidx}</td> --%>
<%-- 						<td><a href="NoticesDetail/${QNA.nidx}">${QNA.title}</a></td> --%>
<%-- 						<td>${QNA.regdate}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>

<!-- 			</table> -->

<%-- 			<form method="get" action="FAQs/${title}"> --%>
<!-- 				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div> -->
<!-- 				</form> -->
<!-- 				<button data-dismiss="modal">닫기</button> -->
<!-- </div>    -->
<!-- </div> -->
<!-- </div> -->

<!-- <div id="callModal" class="modal fade" role="dialog"> -->
<!--  <div class="modal-dialog"> -->
<!-- <div class="modal-content"> -->
<!-- <header> -->
<!-- 								<h2>문의하기</h2> -->
<!-- 							</header> -->

<!-- <!-- 문의하기 기본 뷰 --> -->
<!-- 							<form method="post" action="insertQNA"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="11u" style="margin-left: 2%"><input type="text" name="title" placeholder="제목" /></div> -->
<!-- 									<div class="11u$" style="margin-left: 2%"> -->
<!-- 										<textarea name="content" placeholder="내용"></textarea> -->
<!-- 									</div> -->
<!-- 									<div class="11u$" style="margin-left: 2%"> -->
<!-- 										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="문의" /> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</form> -->
		
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<!-- <div id="NoticesDetailModal" class="modal fade" role="dialog"> -->
<!--  <div class="modal-dialog"> -->
<!-- <div class="modal-content"> -->

<!-- <header> -->
<!-- 								<h2>공지사항</h2> -->
<!-- 							</header> -->
				


<!-- 			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;"> -->
				
				
<!-- 				<tr> -->
<!-- 					<th>제목</th> -->
<%-- 					<th>${NoticesDetail.title}</th> --%>
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 					<th>작성일</th> -->
<%-- 					<th>${NoticesDetail.regdate}</th> --%>
<!-- 				</tr> -->
				
<!-- 					<tr> -->
<%-- 					<td>${NoticesDetail.content}</td> --%>
<!-- 					</tr> -->
			

<!-- 			</table> -->

<<<<<<< HEAD
    <div class="modal" id="NoticesModal">
  <div class="modal-content">
							
							<span class="close">×</span>
							<header>
								<h2>공지사항</h2>
							</header>
							

  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>


				<c:forEach var="Notices" items="${Notices}">
					<tr>
						<td>${Notices.nidx}</td>
						<td><a href="NoticesDetail/${Notices.nidx}">${Notices.title}</a></td>
						<td>${Notices.regdate}</td>
					</tr>
				</c:forEach>

			</table>

			<form method="post" action="Notices">
				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="검색" /></div>
				</form>
			<a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="뒤로" /></a>
		
</div>
</div>
=======
<!-- 			<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="button" data-dismiss="modal" value="뒤로" /></a> -->
<!-- 			</div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

>>>>>>> f44d77afc15da165c87b1f27b6cad6a49f0bb179
