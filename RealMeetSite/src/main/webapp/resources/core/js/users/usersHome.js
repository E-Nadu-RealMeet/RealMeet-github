/**
 * written by 철규 16-06-27
 */

function deleteEvent(esidx){
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			url:'../event/'+esidx,
			type:'DELETE',
			success:function(data){
				if(data == 'success'){
					alert('삭제 성공하였습니다.');
					window.location = "home";
				}
				else if(data == 'failed'){
					alert('삭제 권한이 없습니다.');
				}
				else if(data == 'error'){
					alert('에러가 발생하였습니다.');
				}
			}
		});

	}

	else{
		
	}
}

function redirecting(esidx){
	window.location = "../event/"+esidx;
}