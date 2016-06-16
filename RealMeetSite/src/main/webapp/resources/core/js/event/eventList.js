var page = 1;  //페이징과 같은 방식이라고 생각하면 된다.		 
var isDone = false;

// 맵 
Map = function(){
 this.map = new Object();
};   
Map.prototype = {   
    put : function(key, value){   
        this.map[key] = value;
    },   
    get : function(key){   
        return this.map[key];
    },
    containsKey : function(key){    
     return key in this.map;
    },
    containsValue : function(value){    
     for(var prop in this.map){
      if(this.map[prop] == value) return true;
     }
     return false;
    },
    isEmpty : function(key){    
     return (this.size() == 0);
    },
    clear : function(){   
     for(var prop in this.map){
      delete this.map[prop];
     }
    },
    remove : function(key){    
     delete this.map[key];
    },
    keys : function(){   
        var keys = new Array();   
        for(var prop in this.map){   
            keys.push(prop);
        }   
        return keys;
    },
    values : function(){   
     var values = new Array();   
        for(var prop in this.map){   
         values.push(this.map[prop]);
        }   
        return values;
    },
    size : function(){
      var count = 0;
      for (var prop in this.map) {
        count++;
      }
      return count;
    }
};




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
	// 이미있는 div 복제
	var newDiv = $('.row.dummy').clone();
	newDiv.attr('onclick','#');
	newDiv.attr('data-toggle','modal');
	newDiv.attr('data-target',"#detail");
	newDiv.attr('class','.row');
	newDiv.attr('style',"margin: 0.6em;");
	
	newDiv.find('.caption-title').html('<a href=\"#\">'+data.eventname+'</a>');
	
	newDiv.find('.col-md-6.portfolio-item').attr('style','background-image: url("'+getContextPath()+'/resources/core/images/upload/'+data.imgsrc+'");');
	newDiv.find('.caption-desc').html(data.description);
	newDiv.find('.icon.fa-heart-o').html(data.good);
	newDiv.find('.icon.fa-commenting-o').html(data.reviewcnt);
	
	//모달 생성
	
	
	
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
				//뷰 만들기 ... 개 노가다 -ㅂ-
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
		},
	 	error : function(xhr, stat, err) {

		   	alert("error");

		   	console.log(err);

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