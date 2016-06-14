<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




				<!-- Portfolio -->
					

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
			
<ul>
							<c:forEach var="i" begin="0" end="4">
						
								<li>
								<c:if test="${startPageNum+i <= endPagesNumNotices}">
									<c:if test="${startPageNum+i == pages}">
										<a class="strong" href="Notices/${startPageNum+i}" data-toggle="modal" >${startPageNum+i}</a>
									</c:if>
									<c:if test="${startPageNum+i != pages}">
										<a href="Notices/${startPageNum+i}" data-toggle="modal" >${startPageNum+i}</a>
									</c:if>
								</c:if>	
								</li>
							</c:forEach>
							</ul>			
<%-- 			<form method="get" action="Notices/${title}"> --%>
<!-- 				<div class="4u" align="center" ><input style="margin-left: 100%;" type="text" name="title" placeholder="제목" /> -->
<!-- 				<input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" data-dismiss="modal" data-toggle="modal" data-target="#NoticesModal" value="검색" /></div> -->
<!-- 				</form> -->


				<button data-dismiss="modal">닫기</button>

				
