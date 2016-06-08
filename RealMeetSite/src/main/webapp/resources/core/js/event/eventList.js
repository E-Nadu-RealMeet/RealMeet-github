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
	//alert("함수시작");
	// 데이터 로드
	$.ajax({
		type : 'GET',  
		dataType : 'json',
		data : {"page" : page},
		url : 'list/dataload',

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
					+ '<div class="modal fade" id="detail'+ ((page-1)*10+i) +'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
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


/*contextPath 가져오는 함수 by 지원 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}