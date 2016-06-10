<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
var marker;
var list;
//제일 먼저 실행
;(function($) {
	
})(jQuery);

//window load 때 실행
$(window).load(function(){
	//alert('ajax start')
});

//중심조절
function CenterControl(controlDiv, map) {

	  // Set CSS for the control border.
	  var controlUI = document.createElement('div');
	  controlUI.style.backgroundColor = '#fff';
	  controlUI.style.border = '2px solid #fff';
	  controlUI.style.borderRadius = '3px';
	  controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
	  controlUI.style.cursor = 'pointer';
	  controlUI.style.marginBottom = '22px';
	  controlUI.style.textAlign = 'center';
	  controlUI.title = 'Click to recenter the map';
	  controlDiv.appendChild(controlUI);

	  // Set CSS for the control interior.
	  var controlText = document.createElement('div');
	  controlText.style.color = 'rgb(25,25,25)';
	  controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
	  controlText.style.fontSize = '16px';
	  controlText.style.lineHeight = '38px';
	  controlText.style.paddingLeft = '5px';
	  controlText.style.paddingRight = '5px';
	  controlText.innerHTML = '내 위치';
	  controlUI.appendChild(controlText);

	  // Setup the click event listeners: simply set the map to Chicago.
	  controlUI.addEventListener('click', function() {
	    GMaps.geolocate({
			success : function(position) {
				map.setCenter({lat : position.coords.latitude, lng : position.coords.longitude});
				//얻어온 좌표로 센터 이동
			},
			error : function(error) {
				alert('Geolocation failed: ' + error.message);
			},
			not_supported : function() {
				alert('브라우저가 geolocation을 지원하지 않습니다. chrome 브라우저를 써주세요')
				alert("Your browser does not support geolocation");
			}
		})
	  });

	}
function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
	   zoom: 13,
	   center: {lat: 37.553152, lng: 126.936894}
	});
	//Create the DIV to hold the control and call the CenterControl() constructor
	// passing in this DIV.
	var centerControlDiv = document.createElement('div');
	var centerControl = new CenterControl(centerControlDiv, map);

	centerControlDiv.index = 1;
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);
	$.ajax({
		type : 'POST',  
		dataType : 'json',
		url : 'dataloadformap',
		success : function(data) {
			//alert('검색된 모임의 갯수 : '+data.length);
			for (var i = 0; i < data.length; i++) {
				var addr = data[i].addr;
				var eventname = '<h4>'+data[i].eventname+'</h4>';
				var ahref = '<a href="'+getContextPath()+'/event/'+ data[i].esidx +'">더보기</a>';
				//gmaps.js를 이용한 geocoding
				GMaps.geocode({
					address: addr,
					callback: function(results, status) {
					    if (status == 'OK') {
					      var latlng = results[0].geometry.location;
					      //map.setCenter(latlng.lat(), latlng.lng());
					      marker = new google.maps.Marker({
					    	    map: map,
					    	    draggable: true,
					    	    position: {lat: latlng.lat(), lng: latlng.lng()}
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
}
function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}

</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgH95U-UGuPS-t2hK--kjCb2-Spu3pEZ0&signed_in=true&callback=initMap"></script>
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
