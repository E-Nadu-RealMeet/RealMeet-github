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

function getEventList(page){

	var urls = '';
	if(location.href.substring(location.href.indexOf(location.host)+location.host.length,location.href.length) == '/RealMeetSite/event/list'){
		urls = 'list/dataload';
	}else{
		urls = 'event/list/dataload';
	}


	// 데이터 로드
	$.ajax({
		type : 'GET',  
		dataType : 'json',
		data : {"page" : page},
		url : urls,
		success : function(returnData) {
			var list = returnData.datas;
			var startNum = returnData.startNum;
			var endNum = returnData.endNum;
			var html = "";
			if(returnData.startNum <= returnData.cnt){
				//뷰 만들기 ... 개 노가다 -ㅂ-
				var contextPath = getContextPath();
				for(var i=0; i<(endNum-startNum+1); i++){
					html = html+'<div class="bs-example" style="overflow: hidden; margin-bottom: 10px">'
					+ '<div>'
					+ '<div class="col-md-3">'
					+ '<img	src="'+contextPath+'/resources/core/images/pic02.jpg" alt="Responsive image" class="img-rounded img-responsive">'
					+ '</div>'
					+ '<div class="col-md-9">'
					+ '<div class="dl-horizontal" style="height: 40px; overflow: hidden; text-overflow: ellipsis; text-align: left; ">'
					+ 'Name : '+ list[i].eventname
					+ '</div>'
					+ '<hr>'
					+ '<div class="dl-horizontal" style="height: 40px; overflow: hidden; text-overflow: ellipsis; text-align: left; white-space: nowrap; ">'
					+ '설명 : '+ list[i].abs
					+ '</div>'
					+ '<hr>'
					+ '</div>'
					+ '</div>'
					+ '<div id=detail>'
					+ '<div class="col-md-12">'
					+ '<button type="button" class="btn btn-primary btn-lg"data-toggle="modal" data-target="#detail'+ ((page-1)*10+i) +'">더보기</button>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '<div class="modal fade" id="detail'+ ((page-1)*10+i) +'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'
					+ ''
					+ '<div class="modal-dialog modal-lg">'
					+ '<div class="modal-content">'
					+ '<div class="modal-header">'
					+ '<button type="button" class="close" data-dismiss="modal"	aria-label="Close">'
					+ '<span aria-hidden="true">&times;</span>'
					+ '</button>'
					+ '<h4 class="modal-title" id="myModalLabel">상세 내용</h4>'
					+ '</div>'
					+ '<div class="modal-body" style="overflow: auto">'
					+ '<div class="col-md-12" style="text-align: left">Description	: '+ list[i].description +'</div>'
					+ '<hr>'
					+ '<div class="col-md-2">'
					+ '<img	src="'+contextPath+'/resources/core/images/pic.jpg" alt="Responsive image" class="img-rounded img-responsive" style="width: 100px; height: 100px">'
					+ '</div>'
					+ '<div class="col-md-10">'
					+ '<div style="text-align: left; font-size: 0.8em;">'
					+ '<div>Nick : '+ list[i].nickname +' 님</div>'
					+ '<div>ID : '+ list[i].id +'</div>'
					+ '<div>RAITNG : '+ list[i].rating +'</div>'
					+ '<div>INTEREST : '+ list[i].interest +'</div>'
					+ '<div>PHONE : '+ list[i].phone +'</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '<div class="modal-footer">'
					+ '<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>'
					+ '<a href = '+contextPath +'/event/'+ list[i].esidx +'><button type="button" class="btn btn-primary">상세 페이지 이동</button></a>'
					+ '</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>';	

				}
				$("#container").append(html); 
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
function openFilters(){
	
}

/*contextPath 가져오는 함수 by 지원 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}