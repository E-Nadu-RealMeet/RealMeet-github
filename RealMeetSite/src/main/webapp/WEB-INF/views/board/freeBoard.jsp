<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/board.css" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/freeBoard/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
	
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body>

	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>
	
	<!-- Main -->
	<div id="main">
		<!-- Intro -->
		<jsp:include page="../modules/commons/intro.jsp">
			<jsp:param value="자유게시판" name="introValue"/>
		</jsp:include>
	<section>
	<div class="container">
		<div id="real_cnt" style="max-width: 1000px; margin: 0px auto;">
			<br>
			<br>
			<br>

			<table  class="table table-striped table-bordered">
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width=""/>
					<col width="100" />
					<col width="160" />
				</colgroup>
				<thead>
				<tr class="success">
					<th style="text-align: center;">NO</th>
					<th style="text-align: center;">CATEGORY</th>
					<th style="text-align: center;">SUBJECT</th>
					<th style="text-align: center;">WRITER</th>
					<th style="text-align: center;">DATE</th>
				</tr>
				</thead>
				<c:forEach var="aa" items="${list}">
				<tr>
					<td>${aa.getNidx()}</td>
					<td class='c1'><b>질문</b></td>
					<td class='subject'><a href="${pageContext.request.contextPath}/freeDetail/${aa.getNidx()}"><b>${aa.getTitle()}</b></a></td>
					<td>${aa.getWriter()}</td>
					<td>${aa.getRegdate()}</td>
				</tr>
				</c:forEach>
				
				<c:forEach var="i" items="${qnalist}">
					<tr>
						<td>${i.qno}</td>
						<td class='c1'>${i.kind }</td>
						<td class='subject'><c:choose>
								<c:when test="${i.writer.equals(user_id)}">
									<a href="qnahit.do?cmd=qnahit&job=${i.qno}">${i.writer}님의
										${i.kind} 입니다</a>
								</c:when>

								<c:otherwise>
									<span id="other">${i.writer}님의 ${i.kind} 입니다<img
										src="/img/icon_sec.gif" />
									</span>
								</c:otherwise>
							</c:choose></td>
						<td>${i.writer}</td>
						<td>${i.regdate}</td>
						<td></td>
					</tr>
				</c:forEach>

			</table>
			<div class="board_list_button ">
				<a href="${pageContext.request.contextPath}/freeReg"  align="right" ><div class="board_button" style="margin-right: 100px;">WRITE</div></a>
			</div>
			<div class="paging_noline">
				<span><a href="javascript:alert('처음페이지입니다.');"><img
						src="${pageContext.request.contextPath}/resources/core/images/pre.gif" border='0' /></a></span>
						<span>1</span>
						<span><a href=>2</a></span>
						<span><a href=>3</a></span>
						<span><a href=>4</a></span>
						<span><a href=>5</a></span>
						<span><a href=>6</a></span>
					<%-- <span><a href=""><img src="${pageContext.request.contextPath}/resources/core/images/nex.gif" border='0'></a></span> --%>
					<span><a href=""><img src="${pageContext.request.contextPath}/resources/core/images/nex.gif" border='0'></a></span>
			</div>
			<form name="searchbbs" action="" method="post">
			
				<div class="searchbbs" style="width: 500px; margin-left: 30%">
				<div class="col-sm-3">
					<select name='key' style="height: 50px; font-size:medium;">
						<option value='subject' >제목</option>
						<option value='mem_name'>작성자</option>
						<option value='memo'>메모</option>
					</select> 
					</div>
					<div class="col-sm-8"><input type='text' name='keyword' value='' style='height: 18px;'></div>
					<input type='image' src="${pageContext.request.contextPath}/resources/core/images/btn_find.gif">
				</div>
				
			</form>
		</div>
		</div>
		</section>
	</div>

	<!-- Footer -->
	<div id="footer">

		<!-- Copyright -->
		<ul class="copyright">
			<li>&copy; Untitled. All rights reserved.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>

</body>
</html>
