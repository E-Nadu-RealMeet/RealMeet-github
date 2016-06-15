/**
 * 
 */
function replaceHtml(string_to_replace) {
	// return string_to_replace.replace(/&nbsp;/g, ' ').replace(/<br.*?>/g,
	// '\u2028');
	return string_to_replace.replace(/\n/g, "<br>");
}

function inputCheck(arg) {
	if (arg.length === 0) {
		alert('입력된 게 없어요.')
		return false;
	} else {
		// alert(arg)
		return true;
	}
}

/*
 * function userKeyPress(){ //입력받은 key가 엔터일 경우 (key값이 13일 경우)
 * if(window.event.keyCode == 13){ //아무런 작동값이 없는 0으로 강제 변환
 * //window.event.keyCode=0; return false; }else{ return true; } }
 */
$(document).ready(
		function() {
			var container = $('.container');

			var selectBoxName = container.children('#selectBox-name');
			var selectBoxDesc = container.children('#selectBox-desc');
			var selectBoxDate = container.children('#selectBox-date');
			var selectBoxCheck = container.children('#selectBox-check');
			var selectBoxAddr = container.children('#selectBox-addr');
			var inputEight = selectBoxCheck.find('#category');

			var regSave6 = selectBoxDate.children('.regButton-save');
			// 결과값을 순서대로 넣을 배열 선언.
			var regResult = [];
			var check = 0;

			// 첫번째 셀렉트 박스 (카테고리)
			var selectBoxCate = container.children('#selectBox-cate');
			var reg1 = selectBoxCate.children('.regButton');
			reg1
					.click(function() {
						var text = $(this).text();
						// $('#category').val(text);
						inputEight.val(text);
						inputEight = $(inputEight).next().next();
						regResult[check] = text;
						check++;
						reg1.css("background-color", "#9ececc");
						$(this).css("background-color", "#65a9d7");
						selectBoxCate.fadeOut(10)
						selectBoxCate.fadeOut(10, "linear", selectBoxName
								.fadeIn(1100));

					})

			var regSave = $('.regButton-save');
			var regBack = $('.regButton-back');
			var regFirst = $('.regButton-first');
			// 5번 박스의 저장 버튼 클릭시 textArea 줄바꿈 변환
			var descText = selectBoxDesc.children('#desc-text');
			descText.on('keyup', function(event) {
				var currentString = descText.val();
				selectBoxCheck.children("textarea").html(currentString);
				var descInput = selectBoxCheck.children("#description");
				currentString = replaceHtml(currentString);
				descInput.val(currentString);
				selectBoxDesc.children('#description').val(currentString);
			});

			var regSave5 = selectBoxDesc.children('.regButton-save');
			regSave.click(function() {
				var par = $(this).parent();
				var input = par.children('.regInput');
				// var lastInput = $('input:last');
				// alert(input.val())
				if (inputCheck(input.val())) {
					// input.clone().insertAfter(lastInput);
					regResult[check] = input.val();
					inputEight.val(regResult[check]);
					inputEight = $(inputEight).next().next();
					check++;
					par.fadeOut(10);
					par.next().fadeIn(1100, "swing", par.fadeOut(10));
				}
			})
			var regInputDate = $('#regInput-date');
			regInputDate.blur(function() {
				var value = regInputDate.val();
				value = value.replace('T', ' ');
				$('#date2').val(value.replace('T', ' '));
			})
			// 지도 불러오기.
			regSave6.click(function() {
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 13,
					center : {
						lat : 37.553152,
						lng : 126.936894
					}
				});
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

			regBack.click(function() {
				var par = $(this).parents('.selectBox');
				inputEight = $(inputEight).prev().prev();
				check--;
				par.hide();
				par.prev().fadeIn();
			})
			regFirst.click(function() {
				check = 0;
				var par = $(this).parents('.selectBox');
				var input = par.children('.regInput');
				selectBoxCate.fadeIn();
				par.hide();
			})
			/*
			 * $('#selectBox1').show(); $('#selectBox-name').hide();
			 * $('#selectBox-abs').hide(); $('#selectBox4').hide();
			 * $('#selectBoxDesc').hide();
			 */
		});