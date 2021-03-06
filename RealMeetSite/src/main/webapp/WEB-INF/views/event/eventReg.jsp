<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery UI CSS파일 --> 
<!-- <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" /> -->
<%-- <link rel="stylesheet" media="all" type="text/css" href="${pageContext.request.contextPath}/resources/core/js/jquery-ui-timepicker-addon.css" /> --%>
<!-- // jQuery UI 라이브러리 js파일 -->
<%-- <script type="text/javascript" src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/jquery-ui-sliderAccess.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/jquery-ui-timepicker-addon-i18n.min.js"></script>
<script type="text/javascript" src="https://sellfy.com/js/api_buttons.js"></script> --%>

<!-- <style type="text/css">
			dl.defs{ margin: 10px 0 10px 40px; }
			dl.defs dt{ font-weight: bold; line-height: 20px; margin: 10px 0 0 0; }
			dl.defs dd{ margin: -20px 0 10px 160px; padding-bottom: 10px; border-bottom: solid 1px #eee;}

			.wrapper{ background-color: #ffffff; width: 800px; border: solid 1px #eeeeee; padding: 20px; margin: 0 auto; }
			#tabs{ margin: 20px -20px; border: none; }
			#tabs, #ui-datepicker-div, .ui-datepicker{ font-size: 85%; }
			.clear{ clear: both; }

			.example-container{ background-color: #f4f4f4; border-bottom: solid 2px #777777; margin: 0 0 20px 40px; padding: 20px; }
			.example-container input{ border: solid 1px #aaa; padding: 4px; width: 175px; }
			.ebook{}
			.ebook img.ebookimg{ float: left; margin: 0 15px 15px 0; width: 100px; }
			.ebook .buyp a iframe{ margin-bottom: -5px; }
		</style> -->
<div class="container">
	<div class="selectBox" id="selectBox-cate">
		<div>
			<h3>무엇을 함께할 만남을 만드실껀가요?</h3>
		</div>
		<hr>
		<c:forEach items="${categories}" var="c" varStatus="status">
			<button type="button" class='regButton'>${c}</button>
		</c:forEach>
	</div>
	<div class="selectBox" id="selectBox-name" style="display: none;">

		<div>
			<h3>이벤트의 이름은 무엇으로 하실껀가요?</h3>
		</div>
		<hr>
		<br> <input type="text" class="regInput" placeholder="이벤트 이름은 10자 이상 적어주세요"> <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-abs" style="display: none;">
		<div>
			<h3>생성할 이벤트의 간단한 설명 부탁드립니다.</h3>
		</div>
		<hr>
		<br> <input type="text" name="abs" class="regInput"> <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-img" style="display: none;">
		<div>
			<h3>설명을 위한 사진을 넣어주세요.</h3>
		</div>
		<hr>
		<br>
		<div id="fileUpload" class="dragAndDropDiv">이벤트와 관련된 사진을 끌어다 넣어주세요.</div>
		<br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
		<input type="text" id="imgsrc" class="regInput" value="사진을 넣지 않습니다" hidden="hidden" />
	</div>
	<div class="selectBox" id="selectBox-desc" style="display: none;">
		<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
			<h3>생성할 이벤트의 자세한 설명 부탁드립니다.</h3>

			<br>
		</div>
		<textarea name="description" id="desc-text" style="width: 100%; height: 10em;"></textarea>
		<input type="text" id="description" class="regInput" hidden="hidden"> <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-date" style="display: none;">
		<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
			<h3>첫 이벤트가 진행될 날짜와 시작 시간을 입력해주세요</h3>
				
			<br>
		</div>
		<input id="fromDate"  type="text" class="regInput" > <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-addr" style="display: none">
		<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
			<h3>첫 이벤트가 진행될 주소를 입력해주세요</h3>
			<br>
		</div>
		<div id="map" style="width: 100%; height: 400px;"></div>
		<input type="text" id="addr" class="regInput" placeholder="주소를 입력해보세요"> <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-quantity" style="display: none">
		<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
			<h3>이벤트 수용 인원은 몇명까지 가능합니까?</h3>
			<br>
		</div>
		<input type="number" min="2" max="20" class="regInput" > <br>
		<button type="button" class="regButton-save">저장</button>
		<button type="button" class="regButton-back">뒤로가기</button>
		<button type="button" class="regButton-first">처음으로</button>
	</div>
	<div class="selectBox" id="selectBox-check" style="display: none">
		<form action="reg" method="post" id="regForm">
			<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
				<h2>입력한 내용이 아래와 같나요??</h2>
				<br>
			</div>
			<h3>카테고리</h3>
			<input type="text" name="category" id="category" class="regInput sbox-check" readonly>
			<h3>이벤트명</h3>
			<input type="text" name="eventname" class="regInput sbox-check" readonly>
			<h3>간단한 설명</h3>
			<input type="text" name="abs" class="regInput sbox-check" readonly>
			<h3>업로드한 파일</h3>
			<input type="text" name="imgsrc" id="imgsrc" class="regInput sbox-check" readonly />
			<h3>자세한 설명</h3>
			<div id="desc-text"></div>
			<h3>이벤트 개최 날짜</h3>
			<input type="text" name="eldate"  class="regInput sbox-check" readonly />
			<h3>이벤트 개최 장소</h3>
			<input type="text" name="addr" id="addr" class="regInput sbox-check" readonly>
			<h3>이벤트 최대 인원</h3>
			<input type="text" name="maxgnum" id="addr" class="regInput sbox-check" readonly>
			<input type="hidden" id="description" name="description" class="regInput" readonly>
			<input type="hidden" id="latlng" name="latlng" class="regInput">
			
			<button type="submit" id="selectEnd" class='regButton'>이벤트 생성</button>
			<button type="button" class="regButton-back">뒤로가기</button>
			<button type="button" class="regButton-first">처음으로</button>
		</form>
	</div>
</div>