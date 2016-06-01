
$(document).ready(function(){

	
	
	$('#applyEvent').click(function(){
		
		
		var result = applyProcess();
		if(result == true){
			
		}
		else{
			
		}

	});



	// 취소 기능
	$('.btn.btn-warning').click(function () {
		 /* body... */ 

		 // 취소 프로세스

		 alert("취소 눌림2");
	});

});

function cancleProcess( ) {
	 /* body... */ 
	 alert("cancle");
}

function applyProcess(){

	var mid = $("#id").val();
	/* 로그인 로컬에서 체크   */
	if(mid  == "" || mid == null){
		return false;
	}
	/* 로그인 프로세스를 위한 Ajax 호출  */
	else{
		/* 라디오 박스 체크 확인*/
		if($("input:radio[name='chkDate']:checked").val() == undefined){

			return false;
		}
		else{
			var selectedRadio = $("input:radio[name='chkDate']:checked").val();
		}
		
		$("input:radio[name='chkDate']:checked").val();
	}
	// 여유 인원 검사
	// ajax로 하고
	
	
}

/*contextPath 가져오는 함수 by 지원 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}