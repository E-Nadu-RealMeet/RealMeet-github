/**
 * 
 */

	function inputCheck(arg){
		if(arg.length===0){
			alert('글자가 없습니다.')
			return false;
		}else{
			alert(arg);
			return true;
		}
	}
	function cateClick() {
		var a = $('#selectEnd1a');
		$('#selectBox1').hide();
		$('#selectBox2').show();
	}
	function bclick() {
		var a = $('#selectEnd1b');
		$('#category').val(a.html());
		$('#selectBox1').hide();
		$('#selectBox2').show();
	}
	function cclick() {
		var a = $('#selectEnd1c');
		$('#category').val(a.html());
		$('#selectBox1').hide();
		$('#selectBox2').show();
	}
	function dclick() {
		var d = $('#regInput1').val();
		if (d.length === 0) {
			alert("값을 입력해주십시오");
			return false;
		} else {
			$('#selectBox2').hide();
			$('#selectBox3').show();
			return true;
		}
	}
	function eclick() {
		var e = $('#regInput2').val();
		if (e.length === 0) {
			alert("값을 입력해주십시오");
			return false;
		} else {
			$('#selectBox3').hide();
			$('#selectBox4').show();
			return true;
		}
	}
	function gclick() {
		$('#selectBox4').hide();
		$('#selectBox5').show();
		return true;
	}
	function fclick() {
		$('#description').val($('#regInput3').html());
		if ($('#category').val().length === 0) {
			alert("카테고리를 눌러주십시오");
			$('#selectBox1').focus();
			return false;
		} else if ($('#regInput1').val().length === 0) {
			alert("이벤트의 이름이 비어있네요.");
			$('#selectBox1').focus();
			return false;
		} else if ($('#regInput2').val().length === 0) {
			alert("간단한 설명이 비어있네요.");
			$('#selectBox1').focus();
			return false;
		} else if ($('#detail').val().length === 0) {
			alert("값을 입력해주십시오");
			$('#regInput3').focus();
			return false;
		} else {
			return true;
		}
	}
	function userKeyPress(){
    	//입력받은 key가 엔터일 경우 (key값이 13일 경우)
    	if(window.event.keyCode == 13){
    		//아무런 작동값이 없는 0으로 강제 변환
    		//window.event.keyCode=0;
    		return false;
    	}else{
    		return true;
    	}
    }
	$(document).ready(function() {
		var regForm = $('#regForm');
		var selectBox1 = regForm.children('#selectBox1');
		var selectBox2 = regForm.children('#selectBox2');
		var reg1 = selectBox1.children('.regButton');
		reg1.click(function(){
			var text = $(this).text();
			$('#category').val(text);
			reg1.css("background-color","#9ececc");
			$(this).css("background-color", "#65a9d7");
			selectBox1.fadeOut();
			selectBox2.fadeIn();
		})
		var regSave =  $('.regButton-save');
		var regBack =  $('.regButton-back');
		var regFirst = $('.regButton-first');
		regSave.click(function(){
			var par = $(this).parent();
			var input = par.children('.regInput');
			if(inputCheck(input.val())){
				par.fadeOut();
				par.next().fadeIn();
			}
		})
		regBack.click(function(){
			var par = $(this).parent();
			par.fadeOut();
			par.prev().fadeIn();
		})
		regFirst.click(function(){
			var par = $(this).parent();
			var input = par.children('.regInput');
			selectBox1.fadeIn();
			par.fadeOut();
		})
		/*$('#selectBox1').show();
		$('#selectBox2').hide();
		$('#selectBox3').hide();
		$('#selectBox4').hide();
		$('#selectBox5').hide();*/
	});