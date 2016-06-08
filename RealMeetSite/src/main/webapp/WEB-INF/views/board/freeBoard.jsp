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
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=true"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/free/gmaps.js"></script>
	
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script type="text/javascript">
var map;
$(document).ready(function(){
  map = new GMaps({
    div: '#map',
    lat: 37.553152,
    lng: 126.936894,
    click: function(e) {
    	var addr = rev_Geocode(e.latLng.lat(), e.latLng.lng());
    	
      }
  });
  
  
  
  map.addMarker({
	  lat: e.latLng.lat(),
	  lng: e.latLng.lng(),
	  title: addr,
  	  infoWindow: {
  		  content: addr
  	  },
  	  click: function(e) {
  		  alert(addr);
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
				}
				alert(myJSONResult.results[0].formatted_address)
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
		
		<div id="map" style="width:100%;height:400px;"></div>
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
	<%-- <script
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
		src="${pageContext.request.contextPath}/resources/core/js/main.js"></script> --%>

</body>
</html>
