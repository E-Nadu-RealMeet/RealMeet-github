
$(document).ready(function(){
	
	// url 파싱을 통한 esidx 추출
	var url = $(location).attr('href');
	var esidx = url.substring(url.lastIndexOf('/')+1, url.length);
	init(esidx);
	//init();
})


function cancleProcess(elidx) {
	 /* body... */ 
	 alert(elidx);
	 alert("enterCancle");
}

function applyProcess(elidx){
	
	var ret = loginChka();

	if(ret == true){
		//로그인 되어있을때
		$.ajax({
			type : 'GET',  
			dataType : 'text',
			url : 'apply/'+elidx,
			success : function(res) {
				alert(res);
				init(elidx);
			}
		});
		
		return true;
	}
	else{
		//로그인 안되어있을때.
		return false;
	}
	
}

function init(elidx){
	
	$('#lists').html('');
	
	$.ajax({
		type : 'POST',  
		dataType : 'json',
		data : {"esidx" : elidx},
		url : 'detail/dataload',
		success : function(returnData) {
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
	var tmpStr = '<input class="chk" id=chk"'+data.elidx+'" name="chkDate" type="radio">';
	newDiv.attr('style',"");
	newDiv.find('.target').attr('data-target','#apply'+data.elidx);
	if(data.attended) {
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '이미 참석함';
	}
	else{
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '참여 가능';
	}
	newDiv.find('.target').html(tmpStr);
	newDiv.find('.modal.fade').attr('id','apply'+data.elidx);
	if(data.attended){
		tmpStr = '정말 취소 하시겠습니까?';
	}
	else{
		tmpStr = '정말 참여 하시겠습니까?';
	}
	newDiv.find('.modal-body').children('div').html(tmpStr);
	
	if(data.attended){
		var clickEvent = 'cancleProcess('+data.elidx+')';
	}
	else{
		var clickEvent = 'applyProcess('+data.elidx+')';
	}
	newDiv.find('.btn.btn-primary').attr('onclick',clickEvent);
	return newDiv;
}


function loginChka(){
	var ret = true;
	$.ajax({
		url:getContextPath()+'/midCheck',
		type:'POST',
		dataType: 'text',
		success: function(data){
			if(data==="true"){
				ret = true;
			}else{
				ret = false;
			}
		},
		error: function(data){
			alert('에러 발생')
		}
	})
	
	return ret;
}

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}