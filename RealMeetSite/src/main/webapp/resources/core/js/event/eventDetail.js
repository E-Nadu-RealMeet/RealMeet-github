
$(document).ready(function(){
	
	// url 파싱을 통한 esidx 추출
	var url = $(location).attr('href');
	var esidx = url.substring(url.lastIndexOf('/')+1, url.length);
	listLoad(esidx);

})


$(document).ready(function() {
	$('#myCarousel').carousel('cycle');
	$('#myCarousel2').carousel('cycle');
});


function review_login(){

	/* 로그인 체크 */
	$.ajax({
		url:getContextPath()+'/midCheck',
		type:'POST',
		dataType: 'text',
		success: function(data){
			if(data ==="true"){
			}
			else{
				/* 로그인 체크 실패 */
				alert("로그인이 필요합니다.");
			}
		},
		error: function(data){
			alert('에러 발생')
		}
	})

}

function review_data(){

	var obj = {"title" : $("#title").val(), "content" : $("#content").val()};
	var json_obj = JSON.stringify(obj);

	$.ajax({
		type: "POST",
		dataType : 'json',
		url : "review",
		data : json_obj,
		cache:false,
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			window.location.reload();
		},
	     error:function(request,status,error){
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}



function cancleProcess(elidx) {
	 /* body... */ 

	 $.ajax({
			url:getContextPath()+'/midCheck',
			type:'POST',
			dataType: 'text',
			success: function(data){
				if(data ==="true"){
					/* 로그인 체크 성공시  취소작업*/
					$.ajax({
						type : 'GET',  
						dataType : 'text',
						url : 'cancle/'+elidx,
						success : function(res) {
							
							if(res=="true"){
								// 리스트 재구성
								alert("취소되었습니다.");
							}
							// esidx값 추출
							var url = $(location).attr('href');
							var esidx = url.substring(url.lastIndexOf('/')+1, url.length);
							listLoad(esidx);
						}
					});
					
				}else{
					/* 로그인 체크 실패 */
					alert("로그인이 필요합니다.");
				}
			},
			error: function(data){
				alert('에러 발생')
			}
		})
		
}

function applyProcess(elidx){
/*	
	var ret = loginChka();*/

	/* 로그인 체크 */
	$.ajax({
		url:getContextPath()+'/midCheck',
		type:'POST',
		dataType: 'text',
		success: function(data){
			if(data ==="true"){
				/* 로그인 체크 성공시 */
				$.ajax({
					type : 'GET',  
					dataType : 'text',
					url : 'apply/'+elidx,
					success : function(res) {
						
						alert(res);
						
						var url = $(location).attr('href');
						var esidx = url.substring(url.lastIndexOf('/')+1, url.length);
						
						listLoad(esidx);
					}
				});
				
			}else{
				/* 로그인 체크 실패 */
				alert("로그인이 필요합니다.");
			}
		},
		error: function(data){
			alert('에러 발생')
		}
	})
	
}

function listLoad(elidx){
	
	$.ajax({
		type : 'POST',  
		dataType : 'json',
		data : {"esidx" : elidx},
		url : 'detail/dataload',
		success : function(returnData) {
			$('#lists').empty();
			var data = returnData;
			for(var i=0;i<data.length;i++){
				var newDiv = createApplyElement(data[i]);
				$('#lists').append(newDiv);
			}
		}

	});
}

function createApplyElement(data){
	// 이미있는 div 복제
	
	var newDiv = $('.eventlist').clone();
	newDiv.attr('class','');
	var tmpStr = '<div class="chk" id=chk"'+data.elidx+'" name="chkDate">';
	newDiv.attr('style',"");
	

	if(data.attended == "owned"){
		newDiv.find('.target').attr('data-target','');
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) '+ '';
	}
	else if(data.cntguest == data.maxguest && data.attended == "false"){
		newDiv.find('.target').attr('data-target','');
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) '+ '여석이 없습니다.';
	}
	else if(data.attended == "true") {
		newDiv.find('.target').attr('data-target','#apply'+data.elidx);
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) <a id="event-apply" style="cursor: pointer">' + '참석취소하기';
	}
	else{
		newDiv.find('.target').attr('data-target','#apply'+data.elidx);
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) <a id="event-apply" style="cursor: pointer">' + '참여하기';
	}
	newDiv.find('.target').html(tmpStr);
	//newDiv.find('.target').children('a').css('cursor', 'pointer'); 
	newDiv.find('.modal.fade').attr('id','apply'+data.elidx);
	if(data.attended == "true"){
		tmpStr = '정말 취소 하시겠습니까?';
	}
	else if (data.attended == "false"){
		tmpStr = '정말 참여 하시겠습니까?';
	}
	
	newDiv.find('.modal-body').children('div').html(tmpStr);
	
	if(data.attended == "owned"){
		var clickEvent = '';
	}
	else if(data.attended == "true"){
		var clickEvent = 'cancleProcess('+data.elidx+')';
	}
	else if(data.attended == "false"){
		var clickEvent = 'applyProcess('+data.elidx+')';
	}
	newDiv.find('#submitEvent').attr('onclick',clickEvent);
	newDiv.find('#submitEvent').attr('data-dismiss','modal');
	return newDiv;
}


function loginChka(){

	$.ajax({
		url:getContextPath()+'/midCheck',
		type:'POST',
		dataType: 'text',
		success: function(data){
			if(data ==="true"){
			}else{
				alert("로그인이 필요합니다.");
			}
		},
		error: function(data){
			alert('에러 발생')
		}
	})
	
}
$(document).ready(function() {
	

	$('[data-target="#EventAddrUpdate"]').click(function(){
		var map;
		var markers = [];
		$(document).ready(function(){
		  map = new GMaps({
		    div: '#map',
		    lat: 37.553152,
		    lng: 126.936894,
		    click: function(e) {
		    	var addr;

				addMarker(e);
		    	addAddr(e);
		    	
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

		function addAddr(e){
			rev_Geocode(e.latLng.lat(), e.latLng.lng());
		}
		  
		function addMarker(e){
			var marker = map.addMarker({
				lat: e.latLng.lat(),
		  		lng: e.latLng.lng(),
		  		
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

		function rev_Geocode(arg1, arg2){
			var lat = arg1; // 위도
		    var lng = arg2; // 경도
		    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&sensor=false";
			jQuery.ajax({
				url: geocode,
				type: 'POST',
				success: function(myJSONResult){
					if(myJSONResult.status == 'OK'){
						var tag = "";
						var i;
						for (i=0; i<myJSONResult.results.length; i++){
							tag+=myJSONResult.results[i].formatted_address
						}
						alert(myJSONResult.results[0].formatted_address)
						/* alert(myJSONResult.results[0].formatted_address) */
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
	})
});
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}