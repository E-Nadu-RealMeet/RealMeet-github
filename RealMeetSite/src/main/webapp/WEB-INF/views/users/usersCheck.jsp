<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE HTML>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Users Check</title>
<style type="text/css">

/* #Intro{
margin: 0;
    font-size: 14px;
    line-height: 20px;
    color: #333333;
    background-color: #ffffff;
} */
#mod-wrapper {
    margin: 0;
    width: 100%;
    position: relative;
}

#mod-header {
    height: 10px;
    margin: 0;
    padding: 0;
}

#mod-content {
    margin: 0;
    padding: 0;
    background-color: #FFF;
    position: relative;
}

#Intro .cert-outln {
    border: 6px solid #f2f2f2;
    padding: 13px 17px;
    overflow: hidden;
    clear: both;
}

form#modConfForm {
    margin: 0 0 20px;
    font-size: 12px;
    color: #000;
    line-height: 140%;
}

legend {
    display: block;

    padding: 0;
    margin-bottom: 20px;
    font-size: 21px;
    line-height: 40px;
    color: #333333;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}

div#res-pw{
    margin: 0;
    padding: 0;
    font-family: "굴림", Gulim, Batang, arial, Verdana, AppleGothic, Tahoma, Sans-serif;
    font-size: 12px;
    color: #000;
    line-height: 140%;
}

p {
    margin: 0 0 10px;
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

#Intro fieldset {
    background-color: #FFF;
    border: none;
}

#mod-content #res-pw dl {
    margin: 14px auto;
    width: 356px;
    height: 50px;
    border: 1px solid #d8d8d8;
}

#mod-content #res-id dl dt, #res-pw dl dt {
    padding: 15px 0 0 15px;
    width: 109px;
    height: 35px;
    clear: both;
    float: left;
    background-color: #f2f2f2;
    font-weight: bold;
}

#mod-content #res-id dl dd, #res-pw dl dd {
    padding: 10px 0 0 0;
    text-align: -moz-center;
    text-align: center;
    both: clear;
    font-size: 1.5em;
}

#mod-content dd {
    margin-left: 10px;
}
#mod-content dt, dd {
    line-height: 20px;
}

#mod-content .btn-submit {
    margin: 15px 0 0 0;
    text-align: -moz-center;
    text-align: center;
}

#mod-content input[type="password"]{
	display: inline-block;
    height: 20px;
    padding: 4px 6px;
    margin-bottom: 10px;
    font-size: 14px;
    line-height: 20px;
    color: #555555;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    vertical-align: middle;
}

#mod-content .form-control {
    width: 150px;
}
</style>


<script type="text/javascript">

function pwdCheck(){

	if ($("#pwd").val() == '' || $("#pwd").val() == null) {
		alert("비밀번호를 입력하세요");
		return false;
	}

	var returnVal = false;
	
	$.ajax({
		async:false,
		type:"POST",
		dataType : 'text',
		url : "pwdcheck",
		data : {
			"pwd" : $('#pwd').val(),
			"id" : $('#id').val()
		},		
		success : function(data) {
			if ($.trim(data) == "YES") {
				if(confirm("정말로 탈퇴하시겠습니까?") == true){
					returnVal = true;
				}else{
					returnVal = false;
				}
			} else {
				alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
				returnVal  = false;
			}
		},

	});
	return returnVal;
	
}

</script>

</head>
<body lang="ko" id="Intro">
	<div id="mod-wrapper">
		<div id="mod-header"></div>
		<div id="mod-content" class="mod-container">
			<div class="cert-outln" >
				<form id="modConfForm" role="form" method="post" action="check" onsubmit="return pwdCheck()">
					<fieldset>
						<legend>비밀번호확인</legend>
						<p>회원님의 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</p>
						<div id="res-pw">
							<dl>
								<dt>비밀번호 확인</dt>
								<dd>
									<input type="password" class="form-control" id="pwd" name="pwd" >
								</dd>
							</dl>
						</div>
					</fieldset>
					<div class="btn-submit">
						<input type="hidden" id="id" name="id" value="${id }" />
						<button type="submit" name="submit" id="submit" class="btn-ml9" style="">확 인</button>
					</div>
				</form>
			</div>
			<div class="etc"></div>
		</div>
	</div>
	
		<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>

</body>
</html>