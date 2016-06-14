<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

<script type="text/javascript">
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
</script>

<style>
.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}

</style>
<section id="portfolio" class="two">
	<div class="container">

		<div class="blog-post">
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#detail" id="detail-tab" role="tab" data-toggle="tab" aria-controls="detail">Detail</a></li>
					<li role="presentation"><a href="#pictures" role="tab"
						id="pictures-tab" data-toggle="tab" aria-controls="pictures">Pictures</a></li>
					<li role="presentation"><a href="#review" role="tab"
						id="review-tab" data-toggle="tab" aria-controls="reivew">Reviews</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<c:if test="${detail.size() != 0 }">
						<div role="tabpanel" class="tab-pane fade in active" id="detail"
							aria-labelledby="detail-tab" aria-expanded="true">
							<!-- 이벤트 제목란 -->
							<h2 class="blog-post-title">${detail.get(0).getEventname() }</h2>
							<c:if test="${mid != null}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventNameUpdate">수정</button>
							</c:if>
							<!-- 이벤트 날짜란 -->
							<p class="blog-post-meta">${detail.get(0).getEldate() }
								by <a href="#">${detail.get(0).getHolder() }</a>
							</p>
							<c:if test="${mid != null}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventDateUpdate">수정</button>
							</c:if>
							<hr>
							<!-- 이벤트 상세내용 -->
							<blockquote>
								<p>${detail.get(0).getDescription() }</p>		
							</blockquote>
							<c:if test="${mid != null}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventContentUpdate">수정</button>
							</c:if>
							<hr>
							<div id="lists"></div>
							<c:if test="${mid != null}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventAddrUpdate">수정</button>
							</c:if>
							<hr>
							<h3>카테고리 : ${detail.get(0).getCategory() }</h3>
							<c:if test="${mid != null}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventCategoryUpdate">수정</button>
							</c:if>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="pictures"
							aria-labelledby="pictures-tab" aria-expanded="false">
							<p><div class="row">사진 넣을공간</div>


						</div>
						<div role="tabpanel" class="tab-pane fade" id="review"
							aria-labelledby="review-tab" aria-expanded="false">
							<div class="row">
								<c:if test="${reviews.size() != 0}">
									<c:forEach begin="0" end="${reviews.size()-1 }" var="i">
										<!-- "col-sm-6" = 가용범위 1/2 크기 div -->
										<div class="col-sm-6">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title">${reviews.get(i).getTitle() }</h3>
												</div>
												<div class="panel-body">${reviews.get(i).getContent() }
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			


		</div>
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
							<button type="submit" id="submitEvent" class="btn btn-primary"
								onclick="return applyProcess()">네</button>
							<button type="button" id="close" class="btn btn-default"
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
<div id="map" style="width: 100%; height: 400px;"></div>

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
</section>