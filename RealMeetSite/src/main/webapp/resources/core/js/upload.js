/**
 * 
 */

$(document).ready(function(){
    var objDragAndDrop = $(".dragAndDropDiv");
    var countImg=0;
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
            var status = new createStatusbar(obj, countImg); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status,countImg);
            countImg=countImg+1;
       }
    }
	
    
    //statusbar를 생성하는 메서드
    var rowCount=0;
    function createStatusbar(obj, countImg){
             
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even"; //handleFileUpload에서 파일 갯수만큼 rowCount++하므로 파일 갯수가 짝수라면 even 홀수라면 odd
        this.statusbar = $("<div class='statusbar "+row+"'></div>");
        this.img =  $("<img id='addimg"+countImg+"' style='width:4em; height:4em;'></img>").appendTo(this.statusbar)
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);//statusbar 안에 <div를 넣는다>
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
         
        obj.after(this.statusbar); //obj 뒤에 statusbar를 추가한다. append는 안에 / after는 뒤에
      	
        //파일 사이즈 MB / KB 변환
        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            var newFileName = '${newFileName}'
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }
      		//$('#selectEnd4').after("<input type=\"hidden\" name=\"imgsrc\" value=\""+name+"\"/>");
      		/* if($('#imgsrc').val().length>0){
          		$('#imgsrc').val($('#imgsrc').val()+":"+name);
      		}else{
      			$('#imgsrc').val(newFileName);
      		} */
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
    
    function sendFileToServer(formData,status,countImg)
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
                $('#addimg'+countImg).attr("src", getContextPath()+'/resources/core/images/upload/'+data);
                if($('#imgsrc').val()==='사진을 넣지 않습니다'){
                	$('#imgsrc').val(data);
          		}else{
          			$('#imgsrc').val($('#imgsrc').val()+":"+data);
          		}
                //$("#status1").append("File upload Done<br>");           
            }
        }); 
      
        status.setAbort(jqXHR);
    }
     
});