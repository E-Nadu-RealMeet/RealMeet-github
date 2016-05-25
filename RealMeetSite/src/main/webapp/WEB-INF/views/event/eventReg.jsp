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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/core/js/eventReg-map.js"></script>
<script type="text/javascript">
var map;
$(document).ready(function(){
  map = new GMaps({
    div: '#map',
    zoom: 16,
    lat: 37.553152,
    lng: 126.936894,
    click: function(e) {
      alert('click');
    },
    dragend: function(e) {
      alert('dragend');
    }
  });
  $('#addr').keyup(function(){
	  GMaps.geocode({
		  address: $('#addr').val().trim(),
		  callback: function(results, status) {
		    if (status == 'OK') {
		      var latlng = results[0].geometry.location;
		      map.setCenter(latlng.lat(), latlng.lng());
		      map.addMarker({
		        lat: latlng.lat(),
		        lng: latlng.lng()
		      });
		    }
		  }
		});
  });
 
  
  /* map.addMarker({
	  lat: 37.553152,
	  lng: 126.936894,
	  title: 'Double_Dragon',
	  click: function(e) {
	    alert('You are DD student.');
	  },
	  infoWindow: {
		  content: '<p>Double_Dragon</p>'
		}
	}); */
  map.setContextMenu({
	  control: 'map',
	  options: [{
	    title: '이벤트 장소로 등록합니다.',
	    name: 'add_marker',
	    action: function(e) {
	    	rev_Geocode(e.latLng.lat(), e.latLng.lng());
	    }
	  }]
	});
  map.addControl({
	  position: 'top_right',
	  content: 'Geolocate',
	  style: {
	    margin: '5px',
	    padding: '1px 6px',
	    border: 'solid 1px #717B87',
	    background: '#fff'
	  },
	  events: {
	    click: function(){
	      console.log(this);
	    }
	  }
	});
});
function rev_Geocode(arg1, arg2){
	var lat = arg1; // 위도
    var lng = arg2; // 경도
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&sensor=false";
	jQuery.ajax({
		url: geocode,
		type: 'POST',
		success: function(myJSONResult){
			if(myJSONResult.status == 'OK'){
				var addr = $('#addr');
				var tag = "";
				var i;
				for (i=0; i<myJSONResult.results.length; i++){
					tag+=myJSONResult.results[i].formatted_address
					alert(myJSONResult.results[i].formatted_address);
				}
				addr.val(myJSONResult.results[0].formatted_address);
			}else if(myJSONResult.status == 'ZERO_RESULTS') {
                alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
            } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                alert("할당량이 초과되었습니다.");
            } else if(myJSONResult.status == 'REQUEST_DENIED') {
                alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
            } else if(myJSONResult.status == 'INVALID_REQUEST') {
                alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
            }
		}
	})
}
</script>
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
						<button type="button" class='regButton'>인연</button>
						<button type="button" class='regButton'>맛집</button>
						<button type="button" class='regButton'>지식</button>
					</div>
					<div class="selectBox" id="selectBox2" style="display:none;">
					
						<div>
							<h3>이벤트의 이름은 무엇으로 하실껀가요?</h3>
						</div>
						<input type="text" name="eventname" class="regInput">
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox3" style="display:none;">
						<div>
							<h3>생성할 이벤트의 간단한 설명 부탁드립니다.</h3>
							
						</div>
						
						<input type="text" name="abs" class="regInput">
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox4" style="display:none;">
						<div>
							<h3>설명을 위한 사진을 넣어주세요.</h3>
						</div>
						<div id="fileUpload" class="dragAndDropDiv">이벤트와 관련된 사진을 끌어다 넣어주세요.</div>
						
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
						<input type="text" name="imgsrc" id="imgsrc" class="regInput" value="사진을 넣지 않습니다."/>
					</div>
					<div class="selectBox" id="selectBox5" style="display:none;">
						<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
							<h3>생성할 이벤트의 자세한 설명 부탁드립니다.</h3>

							<br>
						</div>
						<textarea name="description" id="description"></textarea>
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox6">
						<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
							<h3>첫 이벤트가 진행될 날짜를 입력해주세요</h3>

							<br>
						</div>
						<input type="text" name="addr" class="regInput">
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox7">
						<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
							<h3>첫 이벤트가 진행될 주소를 입력해주세요</h3>
							<br>
							<input type="text" name="addr" id="addr"class="regInput" placeholder="주소를 입력해주세요">
								
							<br>
							<br>
						</div>
						<input type="hidden">
						<div id="map" style="height: 400px"></div>
						<button type="button" class="regButton-save">저장</button>
						<button type="button" class="regButton-back">뒤로가기</button>
						<button type="button" class="regButton-first">처음으로</button>
					</div>
					<!-- <input type="hidden" name="description" id="description" /> --> 
					<input type="text" name="category" id="category" />
					<button type="submit" id="selectEnd5" class='regButton'>이벤트 생성</button>
				</form>
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
