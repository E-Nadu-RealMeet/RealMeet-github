function formCheck() {
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