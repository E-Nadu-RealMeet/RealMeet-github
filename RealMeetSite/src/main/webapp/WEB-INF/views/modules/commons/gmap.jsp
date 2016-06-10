<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	var map;
	var markers = [];
	
	//제일 먼저 실행 (map용 데이터 불러오기)
	;(function($) {
		//alert('ajax start')
		$.ajax({
			type : 'POST',  
			dataType : 'json',
			url : 'dataloadformap',
			success : function(data) {
				//alert('검색된 모임의 갯수 : '+data.length);
				for (var i = 0; i < data.length; i++) {
					var addr = data[i].addr;
					GMaps.geocode({
					  address: addr,
					  callback: function(results, status) {
					    if (status == 'OK') {
					      var latlng = results[0].geometry.location;
					      //map.setCenter(latlng.lat(), latlng.lng());
					      map.addMarker({
					        lat: latlng.lat(),
					        lng: latlng.lng()
					      });
					    }
					  }
					});
				}
			},
			error : function(error) {
				alert('dataloadformap error: ' + error.message);
			}
		});
	})(jQuery);
	
	//다음에 실행
	$(document).ready(function() {
		map = new GMaps({
			div : '#map',
			lat : 37.553152,
			lng : 126.936894,
			zoom : 12,
			click : function(e) {
				var addr;
				addMarker(e);
				addAddr(e);

			}
		});

		$('#addr').keyup(function() {
			GMaps.geocode({
				address : $('#addr').val().trim(),
				callback : function(results, status) {
					if (status == 'OK') {
						var latlng = results[0].geometry.location;
						map.setCenter(latlng.lat(), latlng.lng());
						map.addMarker({
							lat : latlng.lat(),
							lng : latlng.lng()
						});
					}
				}
			});
		});

		map.addControl({
			position : 'top_right',
			content : '내 위치',
			style : {
				margin : '5px',
				padding : '1px 6px',
				border : 'solid 1px #717B87',
				background : '#fff'
			},
			events : {
				click : function() {
					console.log(this);
					/* geolocate버튼 기능 삽입 */
					GMaps.geolocate({
						success : function(position) {
							map.setCenter(position.coords.latitude, position.coords.longitude);
							//얻어온 좌표로 센터 이동
						},
						error : function(error) {
							alert('Geolocation failed: ' + error.message);
						},
						not_supported : function() {
							alert("Your browser does not support geolocation");
						}/* ,
						always : function() {
							alert("");
						} */
					});
				}
			}
		});
	});
	
	function addAddr(e) {
		rev_Geocode(e.latLng.lat(), e.latLng.lng());
	}

	function addMarker(e) {
		var marker = map.addMarker({
			lat : e.latLng.lat(),
			lng : e.latLng.lng(),

		/* infoWindow: {
		content: addr
		} */
		});
		markers.push(marker);
	}

	function setMapOnAll(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}

	function clearMarkers() {
		setMapOnAll(null);
	}

	function deleteMarkers() {
		clearMarkers();
		markers = [];
	}

	function rev_Geocode(arg1, arg2) {
		var lat = arg1; // 위도
		var lng = arg2; // 경도
		var geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng="
				+ lat + "," + lng + "&sensor=false";
		jQuery
				.ajax({
					url : geocode,
					type : 'POST',
					success : function(myJSONResult) {
						if (myJSONResult.status == 'OK') {
							var tag = "";
							var i;
							for (i = 0; i < myJSONResult.results.length; i++) {
								tag += myJSONResult.results[i].formatted_address
							}
							alert(myJSONResult.results[0].formatted_address)
							/* alert(myJSONResult.results[0].formatted_address) */
						} else if (myJSONResult.status == 'ZERO_RESULTS') {
							alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
						} else if (myJSONResult.status == 'OVER_QUERY_LIMIT') {
							alert("할당량이 초과되었습니다.");
						} else if (myJSONResult.status == 'REQUEST_DENIED') {
							alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
						} else if (myJSONResult.status == 'INVALID_REQUEST') {
							alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
						}
					}
				})
	}
</script>
<div class="container">
	<!-- <div id="floating-panel">
    	  <input onclick="deleteMarkers();" type=button value="Delete Markers">
 		 </div> -->
	<div>
		<h3>무슨 이벤트가 있을까요?</h3>
	</div>
	<hr>
	<div id="map" style="width: 100%; height: 400px;"></div>
</div>
