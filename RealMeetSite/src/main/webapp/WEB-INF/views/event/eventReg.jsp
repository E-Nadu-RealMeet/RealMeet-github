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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/eventReg.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/upload.js"></script>
</head>
<body onkeypress="userKeyPress();">
	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>
	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="one dark cover">
			<div class="container">

				<header>
					<h2>이벤트 등록해요</h2>
				</header>

			</div>
		</section>

		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container">


				<form action="reg.do" method="post" id="regForm" onsubmit="return fclick();">
					<div class="selectBox" id="selectBox1">
						<div>
							<h3>무엇을 함께할 만남을 만드실껀가요?</h3>
						</div>
						<button type="button" id="인연" class='regButton'>인연</button>
						<button type="button" id="맛집" class='regButton'>맛집</button>
						<button type="button" id="지식" class='regButton'>지식</button>
					</div>
					<div class="selectBox" id="selectBox2" style="display:none">
						<div>
							<h3>이벤트의 이름은 무엇으로 하실껀가요?</h3>
						</div>
						<input type="text" name="eventname" id="regInput1">
						<button type="button" id="selectEnd2" class='regButton' onclick="dclick();">저장</button>
						<button type="button" class='regButton' onclick="window.location.reload();;">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox3" style="display:none">
						<div>
							<h3>생성할 이벤트의 간단한 설명 부탁드립니다.</h3>
							
						</div>
						
						<input type="text" name="abs" id="regInput2">
						<button type="button" id="selectEnd3" class='regButton' onclick="eclick();">저장</button>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<div class="selectBox" id="selectBox4" style="display:none">
						<div>
							<h3>설명을 위한 사진을 넣어주세요.</h3>
						</div>
						<div id="fileUpload" class="dragAndDropDiv">이벤트와 관련된 사진을 끌어다 넣어주세요.</div>
						
						<button type="button" id="selectEnd4" class='regButton' onclick="gclick();">저장</button>
						<input type="text" name="imgsrc" id="imgsrc"/>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<div class="selectBox" id="selectBox5" style="display:none">
						<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
							<h3>생성할 이벤트의 자세한 설명 부탁드립니다.</h3>

							<br>
						</div>
						<div contenteditable="true" spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"
							data-placeholder="Type your text" data-medium-focused="true" id="regInput3">
							<p>어떤 이유로 모임을 만들게 됐나요? 간단한 자기소개로 시작합시다.</p>
							<p>&nbsp</p>
							<p>무엇을 하는 모임인가요?</p>
							<p>&nbsp</p>
							<p>우리 동네 사는 사람, 나와 취향이 비슷한 사람, 아니면 그냥 즐거운 시간을 보내고픈 사람? 누구를 만나 볼까요?</p>
							<p>&nbsp</p>
							<p>누구나 어색할 수 있는 처음 5분! 자, 우리 어떤 이야기로 친해질까요?</p>
							<p>&nbsp</p>
						</div>
						<button type="submit" id="selectEnd5" class='regButton'>이벤트 생성</button>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<!-- <input type="hidden" name="description" id="description" /> --> 
					<input type="text" name="category" id="category" />
					
				</form>
			</div>
			<div id="map" style="height: 400px;"></div>
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
