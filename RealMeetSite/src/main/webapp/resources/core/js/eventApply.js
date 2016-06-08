
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

function applyProcess(){
	
	$(doucment)
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

function init(elidx){
	
	$.ajax({
		type : 'POST',  
		dataType : 'json',
		data : {"esidx" : elidx},
		url : 'detail/dataload',
		success : function(returnData) {

			alert(returnData);
		}

	});
/*
	var data = Object();
	data.ELIDX = 1;
	data.ATTENDED = false;
	data.ADDR = 'addr';
	data.DATE = 'date';
	alert("enterTmp");
	var newDiv = createApplyElement(data);
	$('#lists').append(newDiv);*/
}

function createApplyElement(data){
	// 이미있는 div 복제
	
	var newDiv = $('.eventlist').clone();
	newDiv.attr('class','');
	var tmpStr = '<input class="chk" id=chk"'+data.ELIDX+'" name="chkDate" type="radio">';
	newDiv.attr('style',"");
	newDiv.find('.target').attr('data-target','#apply'+data.ELIDX);
	if(data.ATTENDED) {
		tmpStr += " " + data.ADDR + ' / ' + data.DATE + ' / ' + '이미 참석함';
	}
	else{
		tmpStr += " " + data.ADDR + ' / ' + data.DATE + ' / ' + '참여 가능';
	}
	newDiv.find('.target').html(tmpStr);
	alert(newDiv.find('.modal.fade').attr('id'));
	newDiv.find('.modal.fade').attr('id','apply'+data.ELIDX);
	if(data.ATTENDED){
		tmpStr = '정말 취소 하시겠습니까?';
	}
	else{
		tmpStr = '정말 참여 하시겠습니까?';
	}
	newDiv.find('.modal-body').children('div').html(tmpStr);
	
	if(data.ATTENDED){
		var clickEvent = 'cancleProcess(data.ELIDX)';
	}
	else{
		var clickEvent = 'applyProcess(data.ELIDX)';
	}
	newDiv.find('.btn.btn-primary').attr('onclick',clickEvent);
	alert(newDiv.find('.btn.btn-primary').attr('onclick'));
	return newDiv;
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