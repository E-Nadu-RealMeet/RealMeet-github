<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Prologue by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/eventReg.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=true"></script>
<script src="${pageContext.request.contextPath}/resources/core/js/gmap/gmaps.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	var map;
	function aclick() {
		var a = $('#selectEnd1a');
		$('#category').val(a.html());
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
		$('#selectBox1').show();
		$('#selectBox2').hide();
		$('#selectBox3').hide();
		$('#selectBox4').hide();
		$('#selectBox5').hide();

		/* map = new GMaps({
			div : '#map',
			lat : -12.043333,
			lng : -77.028333
		}); */
	});
</script>
<style>
            .dragAndDropDiv {
               	border: 2px dashed #92AAB0;
			    /* width: 650px; */
			    height: 200px;
			    color: #92AAB0;
			    text-align: center;
			    vertical-align: middle;
			    padding: 10px 0px 10px 10px;
			    font-size: 200%;
			    /* display: table-cell; */
			    margin-top: 1.5em;
			    margin-bottom: 0.5em;
            }
            .progressBar {
                width: 200px;
                height: 22px;
                border: 1px solid #ddd;
                border-radius: 5px; 
                overflow: hidden;
                display:inline-block;
                margin:0px 10px 5px 5px;
                vertical-align:top;
            }
              
            .progressBar div {
                height: 100%;
                color: #fff;
                text-align: right;
                line-height: 22px; /* same as #progressBar height if we want text middle aligned */
                width: 0;
                background-color: #0ba1b5; border-radius: 3px; 
            }
            .statusbar{
                border-top:1px solid #A9CCD1;
                min-height:25px;
                width:99%;
                padding:10px 10px 0px 10px;
                vertical-align:top;
                font-size: 1en;
            }
            .statusbar:nth-child(odd){
                background:#EBEFF0;
            }
            .filename{
                display:inline-block;
                vertical-align:top;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:100px;
                margin-left:10px;
                margin-right:5px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                 
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #0B85A1');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                     
                    $(this).css('border', '2px dotted #0B85A1');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                 
                    handleFileUpload(files,objDragAndDrop);
                });
                 
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '2px dotted #0B85A1');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                //여기까지 웹이 실행되면 불러오는 박스 
                
                //files를 받아서 파일갯수만큼 fd에 넣고 sendFileToServer를 실행하는 메서드
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                  		
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                   }
                }
				
                
                //statusbar를 생성하는 메서드
                var rowCount=0;
                function createStatusbar(obj){
                         
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even"; //handleFileUpload에서 파일 갯수만큼 rowCount++하므로 파일 갯수가 짝수라면 even 홀수라면 odd
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);//statusbar 안에 <div를 넣는다>
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                     
                    obj.after(this.statusbar); //obj 뒤에 statusbar를 추가한다. append는 안에 / after는 뒤에
                  	
                    //파일 사이즈 MB / KB 변환
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                  		//$('#selectEnd4').after("<input type=\"hidden\" name=\"imgsrc\" value=\""+name+"\"/>");
                  		if($('#imgsrc').val().length>0){
	                  		$('#imgsrc').val($('#imgsrc').val()+":"+name);
                  		}else{
                  			$('#imgsrc').val(name);
                  		}
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    //진행바 만드는 메서드
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100; 
                        
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                            this.abort.hide();
                        }
                    }
                     
                    //중지버튼을 클릭하면 statusbar를 숨긴다.
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                            jqxhr.abort();
                            sb.hide();
                        });
                    }
                }
                 
                //contextPath 얻기
                function getContextPath(){
                    var offset=location.href.indexOf(location.host)+location.host.length;
                    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
                    return ctxPath;
                }
                
                function sendFileToServer(formData,status)
                {
                    var uploadURL = getContextPath()+"/filepost"; //Upload URL
                    var extraData ={}; //Extra Data.
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                  
                    status.setAbort(jqXHR);
                }
                 
            });
            
        </script>
</head>
<body onkeypress="userKeyPress();">

	<!-- Header -->
	<div id="header">
		<jsp:include page="../modules/commons/leftBar.jsp"></jsp:include>
	</div>
	<!-- Main -->
	<div id="main">

		<!-- Intro -->
		<section id="top" class="one dark cover">
			<div class="container">

				<header>
					<h2>이벤트 등록해요</h2>
				</header>

			</div>
		</section>

		<!-- Portfolio -->
		<section id="portfolio" class="two">
			<div class="container">


				<form action="reg.do" method="post" onsubmit="return fclick();">
					<div class="selectBox" id="selectBox1">
						<div>
							<h3>무엇을 함께할 만남을 만드실껀가요?</h3>
						</div>
						<button type="button" id="selectEnd1a" class='regButton' onclick="aclick();">인연</button>
						<button type="button" id="selectEnd1b" class='regButton' onclick="bclick();">맛집</button>
						<button type="button" id="selectEnd1c" class='regButton' onclick="cclick();">지식</button>
					</div>
					<div class="selectBox" id="selectBox2" style="display:none">
						<div>
							<h3>이벤트의 이름은 무엇으로 하실껀가요?</h3>
						</div>
						<input type="text" name="eventname" id="regInput1">
						<button type="button" id="selectEnd2" class='regButton' onclick="dclick();">저장</button>
						<button type="button" class='regButton' onclick="window.location.reload();;">처음으로</button>
					</div>
					<div class="selectBox" id="selectBox3" style="display:none">
						<div>
							<h3>생성할 이벤트의 간단한 설명 부탁드립니다.</h3>
							
						</div>
						
						<input type="text" name="abs" id="regInput2">
						<button type="button" id="selectEnd3" class='regButton' onclick="eclick();">저장</button>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<div class="selectBox" id="selectBox4" style="display:none">
						<div>
							<h3>설명을 위한 사진을 넣어주세요.</h3>
						</div>
						<div id="fileUpload" class="dragAndDropDiv">이벤트와 관련된 사진을 끌어다 넣어주세요.</div>
						
						<button type="button" id="selectEnd4" class='regButton' onclick="gclick();">저장</button>
						<input type="hidden" name="imgsrc" id="imgsrc"/>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<div class="selectBox" id="selectBox5" style="display:none">
						<div style="border-bottom: 1px solid gray; margin-bottom: 2em">
							<h3>생성할 이벤트의 자세한 설명 부탁드립니다.</h3>

							<br>
						</div>
						<div contenteditable="true" spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true"
							data-placeholder="Type your text" data-medium-focused="true" id="regInput3">
							<p>어떤 이유로 모임을 만들게 됐나요? 간단한 자기소개로 시작합시다.</p>
							<p>&nbsp</p>
							<p>무엇을 하는 모임인가요?</p>
							<p>&nbsp</p>
							<p>우리 동네 사는 사람, 나와 취향이 비슷한 사람, 아니면 그냥 즐거운 시간을 보내고픈 사람? 누구를 만나 볼까요?</p>
							<p>&nbsp</p>
							<p>누구나 어색할 수 있는 처음 5분! 자, 우리 어떤 이야기로 친해질까요?</p>
							<p>&nbsp</p>
						</div>
						<button type="submit" id="selectEnd5" class='regButton'>이벤트 생성</button>
						<a href="reg" class='regButton'>처음으로</a>
					</div>
					<!-- <input type="hidden" name="description" id="description" /> --> 
					<input type="hidden" name="category" id="category" />
					
				</form>
			</div>
			<div id="map" style="height: 400px;"></div>
		</section>

		</div>

		<!-- Footer -->
		<div id="footer">

			<!-- Copyright -->
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>

		</div>

		<!-- Scripts -->
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
</body>
</html>
