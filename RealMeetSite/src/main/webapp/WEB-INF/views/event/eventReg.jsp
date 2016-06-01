<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventReg.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=true"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/gmap/gmaps.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/eventReg.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/upload.js"></script>
</head>
<body>
	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>
	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="one dark cover">
				<header>
					<h2>이벤트 등록해요</h2>
				</header>
		</section>

		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container">
				<div class="selectBox" id="selectBox1">
					<div>
						<h3>무엇을 함께할 만남을 만드실껀가요?</h3>
					</div>
					<c:forEach items="${categories}" var="c" varStatus="status">
						<button type="button" class='regButton'>${c}</button>
					</c:forEach>
				</div>
				<div class="selectBox" id="selectBox2" style="display:none;">
				
					<div>
						<h3>이벤트의 이름은 무엇으로 하실껀가요?</h3>
					</div><br>
					<input type="text" class="regInput">
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
				</div>
				<div class="selectBox" id="selectBox3" style="display:none;">
					<div>
						<h3>생성할 이벤트의 간단한 설명 부탁드립니다.</h3>
						
					</div><br>
					
					<input type="text" name="abs" class="regInput">
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
				</div>
				<div class="selectBox" id="selectBox4" style="display:none;">
					<div>
						<h3>설명을 위한 사진을 넣어주세요.</h3>
					</div><br>
					<div id="fileUpload" class="dragAndDropDiv">이벤트와 관련된 사진을 끌어다 넣어주세요.</div>
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
					<input type="text" id="imgsrc" class="regInput" value="사진을 넣지 않습니다." hidden="hidden"/>
				</div>
				<div class="selectBox" id="selectBox5" style="display:none;">
					<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
						<h3>생성할 이벤트의 자세한 설명 부탁드립니다.</h3>

						<br>
					</div>
					<textarea name="description" id="desc-text" style="width: 100%; height: 10em;"></textarea>
					<input type="text" id="description" class="regInput" hidden="hidden">
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
				</div>
				<div class="selectBox" id="selectBox6" style="display:none;">
					<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
						<h3>첫 이벤트가 진행될 날짜를 입력해주세요</h3>

						<br>
					</div>
					<input id="regInput6" class="regInput" type="datetime-local">
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
				</div>
				<div class="selectBox" id="selectBox7" style="display: none">
					<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
						<h3>첫 이벤트가 진행될 주소를 입력해주세요</h3>
						<br>
					</div>
					<div id="map" style="width:100%;height: 400px;"></div>
					<input type="text" id="addr" class="regInput" placeholder="주소를 입력해보세요">
					<br>
					<button type="button" class="regButton-save">저장</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
				</div>
				<div class="selectBox" id="selectBox8" style="display:none;">
				<form action="reg.do" method="post" id="regForm">
					<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
						<h2>입력한 내용이 아래와 같나요??</h2>
						<br>
					</div>
					<h3>카테고리 : </h3>
					<input type="text" name="category" id="category" class="regInput" readonly>
					<h3>이벤트명 : </h3>
					<input type="text" name="eventname" class="regInput" readonly>
					<h3>간단한 설명 : </h3>
					<input type="text" name="abs" class="regInput" readonly>
					<h3>업로드한 파일 : </h3>
					<input type="text" name="imgsrc" id="imgsrc" class="regInput" readonly/>
					<h3>자세한 설명 : </h3>
					<textarea id="description" class="regInput" disabled="disabled"></textarea>
					<h3>이벤트 개최 날짜 : </h3>
					<input type="datetime-local" class=regInput readonly/>
					<h3>이벤트 개최 장소 : </h3>
					<input type="text" name="addr" id="addr" class="regInput" readonly>
					<br>
					<input type="hidden" name="date" id="date2" readonly>
					<input type="hidden" id="description" class="regInput" disabled="disabled">
					<button type="submit" id="selectEnd" class='regButton'>이벤트 생성</button>
					<button type="button" class="regButton-back">뒤로가기</button>
					<button type="button" class="regButton-first">처음으로</button>
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
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
</body>
</html>
