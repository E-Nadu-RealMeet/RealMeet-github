
$(document).ready(function(){
	
	// url 파싱을 통한 esidx 추출
	var url = $(location).attr('href');
	var esidx = url.substring(url.lastIndexOf('/')+1, url.length);
	listLoad(esidx);

})


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
						if(res == 'success'){
							alert('성공하였습니다.');
						}
						else if( res == 'No empty seats'){
							alert('빈자리가 없습니다.');
						}
						else if( res == 'Already applied for this event'){
							alert('이미 참석하셨습니다.');
						}
						
						
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
	
	if(data.cntguest == data.maxguest && data.attended == false){
		newDiv.find('.target').attr('data-target','');
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) '+ '여석이 없습니다.';
	}
	else if(data.attended) {
		newDiv.find('.target').attr('data-target','#apply'+data.elidx);
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) <a style="cursor: pointer">' + '참석취소하기';
	}
	else{
		newDiv.find('.target').attr('data-target','#apply'+data.elidx);
		tmpStr += " " + data.addr + ' / ' + data.date + ' / ' + '( '+data.cntguest+' / '+data.maxguest+ ' ) <a style="cursor: pointer">' + '참여하기';
	}
	newDiv.find('.target').html(tmpStr);
	//newDiv.find('.target').children('a').css('cursor', 'pointer'); 
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
	newDiv.find('.btn.btn-primary').attr('data-dismiss','modal');
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

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}