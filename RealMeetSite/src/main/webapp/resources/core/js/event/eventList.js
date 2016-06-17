var page = 1;  //페이징과 같은 방식이라고 생각하면 된다.		 
var isDone = false;


$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	
	getEventList(page);
	page++;
}); 

//스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
$(window).scroll(function(){  
	//alert("얼럿");
	if($(window).scrollTop() >= $(document).height() - $(window).height()){
		//alert("휠다운");
		if(isDone == false){
			getEventList(page);
			page++;
		}
		
	}
});

function redirecting(esidx){
	
	var urls = '';
	if(location.href.substring(location.href.indexOf(location.host)+location.host.length,location.href.length) == '/RealMeetSite/event/list'){
		urls = ''+esidx;
	}else{
		urls = 'event/'+esidx;
	}
	
	window.location = urls;
}


function getFilters(page){
   //
   var regions = '';
   var categories = '';
   
   // 필터링 할 종류
   var filterMap = {
   	'region':'',
   	'category':'',
   	'page':page
   };

   // 필터된 값들 가져오기
   $('#selectfilter').find('a').each(function(){
   	  var filter = $(this).attr('class');
   	  var fValue = $(this).attr('value');
   	  $.each(filterMap, function (key, value) {
   	  	 /* body... */
   	  	 if(filter == key){
   	  	 	filterMap[key] += fValue+"|";
   	  	 }
   	  });
    });
	return filterMap;   
}

function createListElement(data){
	
	// 이미있는 dummy div 복제후 뷰 생성
	var newDiv = $('.row.dummy').clone();
	newDiv.attr('onclick','redirecting('+data.esidx+')');
	newDiv.attr('data-toggle','modal');
	newDiv.attr('data-target',"#detail");
	newDiv.attr('class','.row');
	newDiv.attr('style',"cursor: pointer");
	
	newDiv.find('.caption-title').html('<a href=\"#\">'+data.eventname+'</a>');
	
	newDiv.find('.container.eventlist').attr('style','background-image: url("'+getContextPath()+'/resources/core/images/upload/'+data.imgsrc+'");background-size: cover;');
	newDiv.find('.caption-desc').html(data.description);
	newDiv.find('.icon.fa-heart-o').html(data.good);
	newDiv.find('.icon.fa-commenting-o').html(data.reviewcnt);
	
	return newDiv;
}


function getEventList(page){

	var urls = '';
	if(location.href.substring(location.href.indexOf(location.host)+location.host.length,location.href.length) == '/RealMeetSite/event/list'){
		urls = 'list/dataload';
	}else{
		urls = 'event/list/dataload';
	}

	jQuery.ajaxSettings.traditional = true;

	// 필터링 된 조건 가져오기
	var filterQuery = getFilters(page);
	
	// 데이터 로드
	$.ajax({
		headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		type : 'POST',  
		dataType : 'json',
		data : JSON.stringify(filterQuery),
		contentType : "application/json; charset=utf-8",
		url : urls,
		success : function(returnData) {
			var list = returnData.datas;
			var startNum = returnData.startNum;
			var endNum = returnData.endNum;
			if(returnData.startNum <= returnData.cnt){
				
				//컨텍스트패스 받아오기(이미지 경로용)
				var contextPath = getContextPath();
				
				for(var i=0; i<(endNum-startNum+1); i++){
					var newDiv = createListElement(list[i]);
					$("#viewList").append(newDiv);
					newDiv = "";
				}
				
				html = "";
			}
			else{
				isDone = true;
				page--;
			}
		}
	});
} 


/* 구글 맵 */

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
		url : 'dataloadformap',
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

/*contextPath 가져오는 함수 by 지원 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}