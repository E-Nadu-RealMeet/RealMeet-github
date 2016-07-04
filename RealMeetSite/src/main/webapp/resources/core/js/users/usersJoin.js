var count = 0;

function idCheck(){

	if ($("#id").val() == '' || $("#id").val() == null) {
		alert("아이디를 입력하세요");
		return false;
	}
	var text = $("#id").val();
	var regexp = /[0-9a-zA-Z]/;

	for (var i = 0; i < text.length; i++) {
		if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
			alert("한글이나 특수문자는 입력불가능 합니다.");
			return false;
		}
	}
	if (text.length < 4 || text.length > 20) {
		alert('ID는 4~20자내로 입력해주세요.');
		return false;
	}

	$.ajax({
		type:"POST",
		dataType : 'text',
		url : "idcheck",
		data : {
			"id" : $('#id').val()
		},		
		success : function(data) {
			if ($.trim(data) == "YES") {
				count += 1;
				alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.");
			} else {
				alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
				return false;
			}
		},
	});
}

function emailsend(){
	
	
	if ($("#email").val() == '' || $("#email").val() == null) {
		alert("이메일을 입력하세요");
		return false;
	}
	
	var certnum = null;
	$.ajax({
		type:"POST",
		dataType : 'text',
		url : "echeck",
		data : {
			"email" : $('#email').val()
		},
		success : function(returnData) {
			if(returnData != null){
				certnum = returnData;
				$('input[name=certnum]').attr('value',certnum);
				alert("인증번호가 발송되었습니다.")
			}else{
				alert("null!!!!!!");
			}
		}
	});
	
	layer_open('pop-layer');
}

function layer_open(el){
	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');
	
	if(bg){
		$('.layer').fadeIn();
	}else{
		temp.fadeIn();
	}
	
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');
	
	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();
		}
		e.preventDefault();
		
	});
	
	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});
}

function emailCheck(){
	var form = document.authenform;
	var authNum = $("#certnum").val();
	
	if(form.authnum.value!=authNum){
		alert("인증번호가 틀렸습니다. 다시 입력해주세요");
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value==authNum){
		alert("인증완료");
		$('#pop-layer').fadeOut();
		count += 2;
		return false;
	}
}


function formCheck() {
	var member_id = document.getElementById('id');
	var member_nickname = document.getElementById('nickname');
	var password = document.getElementById('password');
	var password_check = document.getElementById('passwordCheck');
	var member_phoneNumber = document.getElementById('phoneNumber');
	var email_check = document.getElementById('email');
	
	var email_format  = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	
	var interest = new Array();
	$("input[name=interest]:checked").each(function(){

		interest.push($(this).val());
	})

	if (member_id.value == '' || member_id.value == null) {
		alert('ID를 입력하세요');
		focus.member_id;
		return false;
	}

	if (password.value == '' || password.value == null) {
		alert('비밀번호를 입력하세요');
		focus.password;
		return false;
	}

	if (password_check.value == '' || password_check.value == null) {
		alert('비밀번호확인란을 입력하세요');
		focus.password_check;
		return false;
	}

	if (password.value != password_check.value) {
		alert("비밀번호와 비밀번호 확인란이 다릅니다.");
		focus.passowrd;
		return false;
	}

	if (member_nickname.value == '' || member_nickname.value == null) {
		alert('별명을 입력하세요');
		focus.member_nickname;
		return false;
	}

	if (member_phoneNumber.value == '' || member_phoneNumber.value == null) {
		alert('휴대폰번호를 입력하세요');
		focus.member_phoneNumber;
		return false;
	}

	if (member_phoneNumber.value.length <= 9 || member_phoneNumber.value.length >= 12) {
		alert("휴대폰번호를 제대로 입력해주세요");
		focus.member_phoneNumber;
		return false;
	}

	if (isNaN(member_phoneNumber.value)) {
		alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
		focus.member_phoneNumber;
		return false;
	}
	
	if(email_check.value == '' ||email_check.value == null){
		alert("이메일 주소를 입력해주세요.");
		focus.email_check;
		return false;
	}
	
	if(email_format.test(email_check.value) == false){
		alert("유효한 이메일 주소를 입력해주세요.");
		focus.email_check;
		return false;
	}

	if(interest.length < 1){
		alert('최소 한개이상의 흥미 카테고리를 선택하여야 합니다.');
		return false;
	}

	if (count == 0) {
		alert("아이디 중복확인을 눌러주세요");
		return false;
	}else if(count == 1){
		alert("이메일 인증을 눌러주세요");
		return false;
	}else if(count == 2) {
		alert("아이디 중복확인을 눌러주세요");
		return false;
	}


	//흥미 카테고리데이터 보내기
	$.ajax({
		url:'join',
		type:'GET',
		data: interest,
		success:function(data){
		}
	});

	return true;
}	

