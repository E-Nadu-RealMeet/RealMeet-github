//$(document).ready(function(){
//$("#NoticesModal").click(function(){
//getNoticesList();
//})

//$("#NoticesDetail").click(function(){
//getNoticesDetailList();
//})
//});


$(document).ready(function(){


	$('[data-target="#NoticesDetailModal"]').on("click",function(){
		
		getNoticesDetailList();	
	});
	
	$('[data-target="#FAQsDetailModal"]').on("click",function(){
		
		getFAQsDetailList();	
	});
	
	$('[data-target="#QNAsDetailModal"]').on("click",function(){
		
		getQNAsDetailList();	
	});


	function getNoticesDetailList(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'NoticesDetail/{nidx}',
			success : function(returnValue) {
				var detail = returnValue.noticesdetail;
				var contextPath = getContextPath();
				var html = "";
				html = html+'<div class="modal fade" role="dialog" id="NoticesDetailModal">'
				+  '<div class="modal-dialog">'
				+ '<div class="modal-content">' 
				+               '<header>'
				+                  '<h2 align="center">공지사항</h2>'
				+               '</header>'


				+ ' <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">'


				+ '<tr>'
				+'<th>제목</th>'
				+'<th>'+detail.title+'</th>'
				+'</tr>'

				+'<tr>'
				+'<th>작성자</th>'
				+'<td>'+detail.writer+'</td>'
				+'</tr>'

				+'<tr>'
				+'<th>작성일</th>'
				+'<td>'+detail.regdate+'</td>'
				+'</tr>'

				+'<tr>'
				+'<td>'+detail.content+'</td>'
				+'</tr>'

				+   '</table>'

				+   '<a href="#NoticesModal"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a>'
				+' </div>'
				+ ' </div>'
				+ ' </div>';
				$("#container").append(html); 
				html = "";
			}
			error : function(returnValue) {
				alert("error");
			}
		});
	};      



	function getFAQDetailList(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'FAQDetail',
			success : function(returnValue) {
				var detail = returnValue.noticesdetail;
				var contextPath = getContextPath();
				var html = "";
				html = html+'<div class="modal fade" role="dialog" id="NoticesDetailModal">'
				+  '<div class="modal-dialog">'
				+ '<div class="modal-content">' 
				+               '<header>'
				+                  '<h2 align="center">공지사항</h2>'
				+               '</header>'


				+ ' <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">'


				+ '<tr>'
				+'<th>제목</th>'
				+'<th>'+detail.title+'</th>'
				+'</tr>'

				+'<tr>'
				+'<th>작성자</th>'
				+'<td>'+detail.writer+'</td>'
				+'</tr>'

				+'<tr>'
				+'<th>작성일</th>'
				+'<td>'+detail.regdate+'</td>'
				+'</tr>'

				+'<tr>'
				+'<td>'+detail.content+'</td>'
				+'</tr>'

				+   '</table>'

				+   '<a href="#NoticesModal"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a>'
				+' </div>'
				+ ' </div>'
				+ ' </div>';
				$("#container").append(html); 
				html = "";
			}

		});
	};      

	function getQNADetailList(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'QNADetail',
			success : function(returnValue) {
				var detail = returnValue.noticesdetail;
				var contextPath = getContextPath();
				var html = "";
				html = html+'<div class="modal fade" role="dialog" id="NoticesDetailModal">'
				+  '<div class="modal-dialog">'
				+ '<div class="modal-content">' 
				+               '<header>'
				+                  '<h2 align="center">공지사항</h2>'
				+               '</header>'


				+ ' <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">'


				+ '<tr>'
				+'<th>제목</th>'
				+'<th>'+detail.title+'</th>'
				+'</tr>'

				+'<tr>'
				+'<th>작성자</th>'
				+'<td>'+detail.writer+'</td>'
				+'</tr>'

				+'<tr>'
				+'<th>작성일</th>'
				+'<td>'+detail.regdate+'</td>'
				+'</tr>'

				+'<tr>'
				+'<td>'+detail.content+'</td>'
				+'</tr>'

				+   '</table>'

				+   '<a href="#NoticesModal"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a>'
				+' </div>'
				+ ' </div>'
				+ ' </div>';
				$("#container").append(html); 
				html = "";
			}

		});
	};      


	function getContextPath(){
		var offset=location.href.indexOf(location.host)+location.host.length;
		var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
		return ctxPath;
	}
})


//function getNoticesList(){
//$.ajax({
//type : 'GET',
//dataType : 'json',
//url : 'Notices',
//success : function(returnData) {
//var list = returnData.notices;
//var contextPath = getContextPath();
//var html = "";
//html = html+'<div class="modal fade" role="dialog" id="NoticesModal" >'
//+ '<div class="modal-dialog">'
//+ '<div class="modal-content">'
//+ '<header>'
//+ '<h2 align="center">공지사항</h2>'
//+ '</header>'


//+ ' <table border="1" style="width: 75%; text-align: center; margin-left:
//12.5%; background-color: white;">'


//+ '<tr>'
//+ '<th>번호</th>'
//+ '<th>제목</th>'
//+ '<th>작성일</th>'
//+ '</tr>';

//for (var i = 0; i < list.size(); i++) {
//html = html+'<tr>'
//+ '<td>'+list[i].nidx+'</td>'
//+ '<td><a id="NoticesDetail" href="NoticeDetail/${'+ list[i].nidx
//+'}">'+list[i].title+'</a></td>'
//+ '<td>'+list[i].regdate+'</td>'
//+ '</tr>'
//);

//html = html + '</table>'
//+ '<table>'
//+ '<tr>'
//+ '<td><form method="post" action="NoticesModal">'
//+ '<div class="6u" align="center"><input style="margin-left: 50%; padding:
//0.5em 1.0em 0.5em 1.0em;" type="text" name="title" placeholder="제목" />'
//+ '<input style="margin-left:50%; padding: 0.25em 1.0em 0.25em 1.0em;"
//type="submit" value="검색" /></div>'
//+ '</form></td>'
//+ '<td><a href="${pageContext.request.contextPath}/customer/customer"><input
//style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit"
//value="뒤로" /></a></td>'
//+ '</tr>'
//+ '</table>'
//+' </div>'
//+ ' </div>'
//+ ' </div>';
//$("#container").append(html);
//html = "";
//)

//});
//};


//function getNoticesDetailList(){
//$.ajax({
//type : 'GET',
//dataType : 'json',
//url : 'NoticesDetail',
//success : function(returnData) {
//var detail = returnData.noticesdetail;
//var contextPath = getContextPath();
//var html = "";
//html = html+'<div class="modal fade" role="dialog" id="NoticesDetailModal">'
//+ '<div class="modal-dialog">'
//+ '<div class="modal-content">'
//+ '<header>'
//+ '<h2 align="center">공지사항</h2>'
//+ '</header>'


//+ ' <table border="1" style="width: 75%; text-align: center; margin-left:
//12.5%; background-color: white;">'


//+ '<tr>'
//+'<th>제목</th>'
//+'<th>'+detail.title+'</th>'
//+'</tr>'

//+'<tr>'
//+'<th>작성자</th>'
//+'<td>'+detail.writer+'</td>'
//+'</tr>'

//+'<tr>'
//+'<th>작성일</th>'
//+'<td>'+detail.regdate+'</td>'
//+'</tr>'

//+'<tr>'
//+'<td>'+detail.content+'</td>'
//+'</tr>'

//+ '</table>'

//+ '<a href="#NoticesModal"><input style="padding: 0.25em 1.0em 0.25em 1.0em;
//margin-left: -100%" type="submit" value="뒤로" /></a>'
//+' </div>'
//+ ' </div>'
//+ ' </div>';
//$("#container").append(html);
//html = "";
//)

//});
//};

//function getContextPath(){
//var offset=location.href.indexOf(location.host)+location.host.length;
//var
//ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
//return ctxPath;
//}
