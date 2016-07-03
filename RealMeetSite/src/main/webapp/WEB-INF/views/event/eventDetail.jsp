<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgH95U-UGuPS-t2hK--kjCb2-Spu3pEZ0&signed_in=true&callback=initMap"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/gmap/gmaps.js"></script>	
	
<script type="text/javascript">



function initMap(call) {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 13,
		center : {
			lat : 37.553152,
			lng : 126.936894
		}
	});
	// Create the DIV to hold the control and call the CenterControl()
	// constructor
	// passing in this DIV.
	var centerControlDiv = document.createElement('div');
	var centerControl = new CenterControl(centerControlDiv, map);
	var marker;
	var markers=[];
	var geocoder = new google.maps.Geocoder;
	var infowindow;
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'dataloadformapbyesidx',
		success : function(data) {
			// alert('검색된 모임의 갯수 : '+data.length);
			for (var i = 0; i < data.length; i++) {
				var addr = data[i].addr;
				var latlngStr = data[i].latlng.split(', ', 2);
				var latlng = {
						lat : parseFloat(latlngStr[0]),
						lng : parseFloat(latlngStr[1])
					};
				var content = data[i];
				content.latlng = latlng;
				content.imgsrc = content.imgsrc.split(':',2)[0]; 
				placeMarkerAndPanTo(latlng, map, content);
			}

		},
		error : function(error) {
			alert('dataloadformap error: ' + error.message);
		},
		complete : function(data) {
		}
	});
	centerControlDiv.index = 1;
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);
	function placeMarkerAndPanTo(latLng, map, arg) {
		var marker = new google.maps.Marker({
			position : latLng,
			draggable:false,
			map : map
		});
		markers.push(marker);
		//map.panTo(latLng);
		/*if(arg != null&& arg.length!=0){
			infowindow.setContent(arg);
			infowindow.open(map, marker);
		}*/
		google.maps.event.addListener(marker, 'click', function(){
			infowindow = new google.maps.InfoWindow;
			infowindow.setContent(arg.eventname+'<img src="'+getContextPath()+'/resources/core/images/upload/'+arg.imgsrc+'" style="width:40px;height:30px"/>')
			infowindow.setPosition(arg.latlng)
			infowindow.open(map);
		})
	}
	
}
function toggleBounce() {
	if (marker.getAnimation() !== null) {
		marker.setAnimation(null);
	} else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}

//역지오코딩
function geocodeLatLng(geocoder, map, infowindow, input) {
	var latlngStr = input.split(',', 2);
	var latlng = {
		lat : parseFloat(latlngStr[0]),
		lng : parseFloat(latlngStr[1])
	};
	geocoder.geocode({
		'location' : latlng
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
			if (results[1]) {
				map.setZoom(11);
				var marker = new google.maps.Marker({
					position : latlng,
					map : map
				});
				infowindow.setContent(results[1].formatted_address);
				infowindow.open(map, marker);
			} else {
				window.alert('No results found');
			}
		} else {
			window.alert('Geocoder failed due to: ' + status);
		}
	});
}

$('[data-target="#EventAddrUpdate"]').click(function(){
	 geocoder = new google.maps.Geocoder();

	    latLng = new google.maps.LatLng(37.553152, 126.936894);
	
	// Create the DIV to hold the control and call the
	// CenterControl()
	// constructor
	// passing in this DIV.
	var centerControlDiv = document.createElement('div');
	var centerControl = new CenterControl(centerControlDiv, map);
	var marker;
	var markers=[];
	var geocoder = new google.maps.Geocoder;
	var infowindow = new google.maps.InfoWindow;
	centerControlDiv.index = 1;
	map.controls[google.maps.ControlPosition.TOP_CENTER]
			.push(centerControlDiv);
	/*
	 * // 마커를 클릭하면 줌을 당기고 센터 중심으로. marker.addListener('click',
	 * function() { map.setZoom(15);
	 * map.setCenter(marker.getPosition()); });
	 */
	
	map.addListener('click', function(e) {
		var latLng = e.latLng.toString();
		latLng=latLng.substring(1,latLng.length-2);
		deleteMarkers();
		//placeMarkerAndPanTo(e.latLng, map);
		geocodeLatLng(geocoder, map, infowindow, latLng);
		setLatlngToInput(latLng)
	});
	function placeMarkerAndPanTo(latLng, map, arg) {
		var marker = new google.maps.Marker({
			position : latLng,
			draggable:false,
			content:arg,
			map : map
		});
		markers.push(marker);
		map.panTo(latLng);
		if(arg != null&& arg.length!=0){
			infowindow.setContent(arg);
			infowindow.open(map, marker);
		}
	}
	$('#addr').keyup(function() {
		GMaps.geocode({
			address : $('#addr').val().trim(),
			callback : function(results, status) {
				if (status == 'OK') {
					deleteMarkers();
					var latlng = results[0].geometry.location;
					placeMarkerAndPanTo(latlng, map, $('#addr').val().trim());
					map.setZoom(15);
					var latLng = latlng.toString();
					var latLng=latLng.substring(1,latLng.length-2);
					setLatlngToInput(latLng)
				}
			}
		});
	});
	function setLatlngToInput(latlng){
		var latlng2 = latlng.toString()
		//alert(latlng2)
		//alert(typeof(latlng2))
		$('#latlng').val(latlng2.toString())
	}
	// Sets the map on all markers in the array.
	function setMapOnAll(map) {
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(map);
	  }
	}

	// Removes the markers from the map, but keeps them in the array.
	function clearMarkers() {
	  setMapOnAll(null);
	}

	// Shows any markers currently in the array.
	function showMarkers() {
	  setMapOnAll(map);
	}

	// Deletes all markers in the array by removing references to them.
	function deleteMarkers() {
	  clearMarkers();
	  markers = [];
	}
	//지오코딩 메서드
	function geocodeLatLng(geocoder, map, infowindow, input) {
		  var latlngStr = input.split(',', 2);
		  var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
		  geocoder.geocode({'location': latlng}, function(results, status) {
		    if (status === google.maps.GeocoderStatus.OK) {
		      if (results[1]) {
		        map.setZoom(15);
		        /*map.panTo(latlng);
		        var marker = new google.maps.Marker({
		          position: latlng,
		          map: map
		        });*/
		        placeMarkerAndPanTo(latlng, map, results[1].formatted_address);
		        $('#addr').val(results[1].formatted_address)
		      } else {
		        window.alert('No results found');
		      }
		    } else {
		      window.alert('Geocoder failed due to: ' + status);
		    }
		  });
		}
	
})
</script>

		<div class="container">
	
            <!-- Blog Post Content Column -->
				  <c:if test="${detail.size() != 0 }">
                <!-- Blog Post -->

                <!-- Title -->
                <h1 style="font-size: 2em;">${detail.get(0).getEventname() }
                		<c:if test="${mid == detail.get(0).getHolder()}">
							<span class="icon fa-pencil-square-o" data-toggle="modal" data-target="#EventNameUpdate"></span>
				  		</c:if>
                		<hr>
                </h1>
                <div style="height: 10em;">
				<span>카테고리 : ${detail.get(0).getCategory() }
				<c:if test="${mid == detail.get(0).getHolder()}">
							<span class="icon fa-pencil-square-o" data-toggle="modal" data-target="#EventCategoryUpdate"></span>
							
				  		</c:if>
				</span>
               
				
                <!-- Author -->
                <p class="lead">
                	 by <a href="#">${detail.get(0).getHolder() }</a>
                </p>
                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> ${detail.get(0).getEldate() }
                <c:if test="${mid == detail.get(0).getHolder()}">
							<span class="icon fa-pencil-square-o" data-toggle="modal" data-target="#EventDateUpdate"></span>
				  		</c:if>
                </p>
				<div style="border: 3px outset gray;width: 10%;float: right;box-shadow: 2px 1px 3px 0px #989898;"><span id="goodIcon" class="icon fa-heart"></span><span id="getGoodCnt">${detail.get(0).getGood() }</span></div>
                </div>
                <hr>

                <!-- Preview Image -->
            	<!-- <img class="img-responsive" style="margin: auto;" src="http://placehold.it/900x300" alt=""> -->
				<div id="myCarousel2" class="carousel slide vertical">
					<div class="carousel-inner" role="listbox">
		
						<c:forEach var="e" items="${list}" varStatus="status">
							<c:choose>
								<c:when test="${status.count==1}">
									<c:set var="numone" value=" active"></c:set>
								</c:when>
								<c:when test="${status.count!=1}">
									<c:set var="numone" value=""></c:set>
								</c:when>
							</c:choose>
							<div class="item${numone}" style="cursor: pointer;">
								<img alt="${status.count}위"
									src="${pageContext.request.contextPath}/resources/core/images/upload/${e}"
									data-src="holder.js/1200x500/text:slide">
		
							</div>
						</c:forEach>
					</div>
					<a class="left carousel-control" href="#myCarousel2" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel2" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<hr>

                <!-- Post Content -->
                <p class="lead">${detail.get(0).getDescription() }
                	<c:if test="${mid == detail.get(0).getHolder() }">
							<span class="icon fa-pencil-square-o" data-toggle="modal" data-target="#EventContentUpdate"></span>
					</c:if>
                </p>
                <hr>
                <div id="map" style="width: 100%; height: 400px;"></div>
				  <div id="lists"></div> 
				  <c:if test="${mid == detail.get(0).getHolder() }">
							<span class="icon fa-pencil-square-o" data-toggle="modal" data-target="#EventAddrUpdate">주소 수정</span> 
 				  </c:if>
                <hr>

                <!-- Blog Comments -->

		        <!-- Comments Form -->
				<div class="well">
					<h4 style="font-size: 1.3em;">Leave a Reviews:</h4>
					<form name="rData">
						<div class="form-gropu">
							<c:if test="${empty mid}">
								<input type="text" style="margin-bottom: 5px;" onclick="review_login();" readonly="readonly"/>
							</c:if>
							<c:if test="${!empty mid}">
								<input type="text" id="title" name="title" style="margin-bottom: 5px;"/>
							</c:if>
						</div>
						
						<div class="form-group">
							<c:if test="${empty mid}">
								<textarea class="form-control" placeholder="로그인이 필요합니다." rows="3" onclick="review_login();" readonly="readonly"></textarea>
							</c:if>
							<c:if test="${!empty mid}">
								<textarea class="form-control" id="content" name="content" rows="3"></textarea>
							</c:if>
							
						</div>
						<c:if test="${!empty mid}">
							<button type="submit" class="btn btn-primary" onclick="review_data();">Write</button>
						</c:if>
					</form>
				</div>
		
				<hr>

                <!-- Posted Comments -->

                <!-- Comment -->
                <div id="divSettings">
						<c:if test="${reviews.size() != 0}">
							<c:forEach begin="0" end="${reviews.size()-1 }" var="i">
								<!-- "col-sm-6" = 가용범위 1/2 크기 div -->
								<div class="media">
									<div class="media-body">
										<h4 class="media-heading">${reviews.get(i).getTitle() }
											<small>${reviews.get(i).getRegdate() }</small>
										</h4>
										${reviews.get(i).getContent() }<br>
										<span>by ${reviews.get(i).getWriter() }</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
                <!-- Comment -->
				  </c:if>

		<!-- 안보이는 부분 -->
		<div class="eventlist" style='display: none;'>
			<div class="target" data-toggle="modal" data-target="#apply">
				<input type="radio" class="chk" id="chk${i}" name="chkDate">주소
				/ 날짜 / 참여여부
			</div>
			<div class="modal fade" id="apply">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-body" style="overflow: auto">
							<div class="col-md-12" style="text-align: left">정말 참여하시겠습니까</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="submitEvent" 
								onclick="return applyProcess()">네</button>
							<button type="button" id="close"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>


<div class="modal fade" id="EventAddrUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<h2>주소 수정</h2>
<div id="map"></div>
<form action="editAddr" method="POST">
<input type="text" id="addr" name="addr" class="regInput" value="${detail.get(0).getAddr() }">
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

<div class="modal fade" id="EventCategoryUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<h2>카테고리 수정</h2>
<form action="editCategory" method="post">
<input type="radio" name="category" value="맛집">맛집
<input type="radio" name="category" value="게임">게임
<input type="radio" name="category" value="강연">강연
<input type="radio" name="category" value="여행">여행
<input type="radio" name="category" value="인연">인연
<input type="radio" name="category" value="지식">지식
<input type="radio" name="category" value="모임">모임<br>
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

<div class="modal fade" id="EventNameUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>제목 수정</h2>
</header>

<form action="editName" method="POST">
<input type="text" name="eventName" value="${detail.get(0).getEventname() }"/>
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>


<div class="modal fade" id="EventDateUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>날짜 수정</h2>
</header>

<form action="editDate" method="post">
<input type="datetime" name="elDate" value="${detail.get(0).getEldate() }" />
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

<div class="modal fade" id="EventContentUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>요약 수정</h2>
</header>



<form action="editDesc" method="post">
<input type="text" name="description" value="${detail.get(0).getDescription() }" />
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

	
</div>
