/**
 * 
 */
	function replaceHtml( string_to_replace ) 
	{
		//return string_to_replace.replace(/&nbsp;/g, ' ').replace(/<br.*?>/g, '\u2028');
		return string_to_replace.replace(/\n/g, "<br>");
	}
	
	function inputCheck(arg){
		if(arg.length===0){
			alert('글자가 없습니다.')
			return false;
		}else{
			//alert(arg)
			return true;
		}
	}
	
	
/*	function userKeyPress(){
    	//입력받은 key가 엔터일 경우 (key값이 13일 경우)
    	if(window.event.keyCode == 13){
    		//아무런 작동값이 없는 0으로 강제 변환
    		//window.event.keyCode=0;
    		return false;
    	}else{
    		return true;
    	}
    }
*/	$(document).ready(function() {
		var container = $('.container');
		var selectBoxCate = container.children('#selectBox-cate');
		var selectBoxName = container.children('#selectBox-name');
		var selectBoxDesc = container.children('#selectBox-desc');
		var selectBoxDate = container.children('#selectBox-date');
		var selectBoxCheck = container.children('#selectBox-check');
		var inputEight = selectBoxCheck.find('#category');
		var reg1 = selectBoxCate.children('.regButton');
		var regSave6 = selectBoxDate.children('.regButton-save');
		//결과값을 순서대로 넣을 배열 선언.
		var regResult = [];
		var check = 0;
		
		reg1.click(function(){
			var text = $(this).text();
			//$('#category').val(text);
			inputEight.val(text);
			inputEight=$(inputEight).next().next();
			regResult[check]=text;
			check++;
			reg1.css("background-color","#9ececc");
			$(this).css("background-color", "#65a9d7");
			selectBoxCate.fadeOut(10)
			selectBoxCate.fadeOut(10,"linear", selectBoxName.fadeIn(1100));
			
		})
		var regSave =  $('.regButton-save');
		var regBack =  $('.regButton-back');
		var regFirst = $('.regButton-first');
		//5번 박스의 저장 버튼 클릭시 textArea 줄바꿈 변환
		var descText = selectBoxDesc.children('#desc-text');
		descText.on('keyup', function(event) {
		    var currentString = descText.val();
		    selectBoxCheck.children("textarea").html(currentString);
		    var descInput = selectBoxCheck.children("#description");
		    currentString = replaceHtml( currentString );
		    descInput.val(currentString);
		    selectBoxDesc.children('#description').val(currentString);
		});
		
		var regSave5 = selectBoxDesc.children('.regButton-save');
		regSave.click(function(){
			var par = $(this).parent();
			var input = par.children('.regInput');
			//var lastInput = $('input:last');
			//alert(input.val())
			if(inputCheck(input.val())){
				//input.clone().insertAfter(lastInput);
				regResult[check]=input.val();
				inputEight.val(regResult[check]);
				inputEight=$(inputEight).next().next();
				check++;
				par.fadeOut(10);
				par.next().fadeIn(1100, "swing", par.fadeOut(10));
			}
		})
		var regInputDate = $('#regInput-date');
		regInputDate.blur(function(){
			var value = regInputDate.val();
			value=value.replace('T',' ');
			$('#date2').val(value.replace('T',' '));
		})
		//지도 불러오기.
		regSave6.click(function(){
			var map;
			$(document).ready(function(){
			  map = new GMaps({
			    div: '#map',
			    zoom: 16,
			    lat: 37.553152,
			    lng: 126.936894,
			    /* click: function(e) {
			      alert('click');
			    },
			    dragend: function(e) {
			      alert('dragend');
			    } */
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
		})
		regBack.click(function(){
			var par = $(this).parents('.selectBox');
			inputEight=$(inputEight).prev().prev();
			check--;
			par.hide();
			par.prev().fadeIn();
		})
		regFirst.click(function(){
			check=0;
			var inputEight = selectBox8.find('#category');
			var par = $(this).parents('.selectBox');
			var input = par.children('.regInput');
			selectBoxCate.fadeIn();
			par.hide();
		})
		/*$('#selectBox1').show();
		$('#selectBox-name').hide();
		$('#selectBox-abs').hide();
		$('#selectBox4').hide();
		$('#selectBoxDesc').hide();*/
	});