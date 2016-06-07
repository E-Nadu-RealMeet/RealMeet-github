

function cancleProcess(elidx) {
	 /* body... */ 
	 alert(elidx);
}

function applyProcess(){

	/*var ret = loginChk();*/
	alert(elidx);
	/*if( ret == true ){
		$.ajax({
			url:getContextPath()+'/apply/'+elidx,
			type:'POST',
			dataType: 'text',
			success: function(data){
				alert(data);
			},
			error: function(data){
				alert('에러 발생')
			}
		})
	}
	else{
		alert("로그인이 필요합니다.");
	}*/
	return true;
	
}


function loginChk(){
	$.ajax({
		url:getContextPath()+'/midCheck',
		type:'POST',
		dataType: 'text',
		success: function(data){
			if(data==="true"){
				return true;
			}else{
				return false;
			}
		},
		error: function(data){
			alert('에러 발생')
		}
	})
}

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}