/**
 * 
 */

$(document).ready(function(){
	var cc = $('#comment-content');
	var mid = $('#mid');
	var write=$('#tdWrite');
	write.click(function(){
		if(mid.val()===null ||mid.val().length==0){
			if(confirm('로그인이 필요합니다. 로그인하시겠습니까?')){
				openLoginForm();
			}
			$('#comment-write').attr("disabled","disabled");
		}else if(cc.val() === null || cc.val().length==0){
			if(confirm('덧글 내용을 입력해주세요')){
				cc.focus();
			}
			$('#comment-write').attr("disabled","disabled");
		}else{
			$('#comment-write'.removeAttr('disabled'))
		}
	})
	cc.keyup(function(){
		cc.attr('onclick', '').unbind('click');
		if(mid.val()===null ||mid.val().length==0 || cc.val() === null || cc.val().length==0){
			$('#comment-write').attr("disabled","disabled");
		}else{
			$('#comment-write').removeAttr('disabled')
		}
	})
	/*alert(mid.val()===null)
	alert(mid.val().length==0)
	if(mid.val()===null ||mid.val().length==0){
		write.click(function(){
			if(confirm('로그인이 필요합니다. 로그인하시겠습니까?')){
				openLoginForm();
			}
			$('#comment-write').attr("disabled","disabled");
		})
	}else if(cc.val() === null || cc.val().length==0){
		write.click(function(){
			if(confirm('덧글 내용을 입력해주세요')){
				cc.focus();
			}
			$('#comment-write').attr("disabled","disabled");
		})
	}else{
		$('#comment-write'.removeAttr('disabled'))
	}
	cc.blur(function(){
		cc.attr('onclick', '').unbind('click');
		if(mid.val()===null ||mid.val().length==0){
			$('#comment-write').attr("disabled","disabled");
		}else if(cc.val() === null || cc.val().length==0){
			$('#comment-write').attr("disabled","disabled");
		}else{
			$('#comment-write'.removeAttr('disabled'))
		}
	})
	cc.keyup(function(){
		cc.attr('onclick', '').unbind('click');
		if(mid.val()===null ||mid.val().length==0 || cc.val() === null || cc.val().length==0){
			$('#comment-write').attr("disabled","disabled");
		}else{
			$('#comment-write').removeAttr('disabled')
		}
	})*/
})
function commentChk(){
	var cc = $('#comment-content');
	var mid = $('#mid');
	var write=$('#tdWrite');
	if(mid.val()==null ||mid.val().length==0){
		write.click(function(){
			if(confirm('로그인이 필요합니다. 로그인하시겠습니까?')){
				openLoginForm();
			}
			$('#comment-write').attr("disabled","disabled");
		})
	}else if(cc.val() === null || cc.val().length==0){
		write.click(function(){
			if(confirm('덧글 내용을 입력해주세요')){
				cc.focus();
			}
			$('#comment-write').attr("disabled","disabled");
		})
	}else{
		$('#comment-write'.removeAttr('disabled'))
	}
}