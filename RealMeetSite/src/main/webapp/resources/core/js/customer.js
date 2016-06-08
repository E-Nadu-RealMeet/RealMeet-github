//$(document).ready(function(){
//$("#NoticesModal").click(function(){
//	getNoticesList();
//})

//$("#NoticesDetail").click(function(){
//	getNoticesDetailList();
//})
//});

$(function(){
	$.ajax({
		var html = "";
		html = html + '<div class="row">'
		+'<div class="5u" style="margin-left: 6%; margin-bottom: 7%; margin-top: 7%">'
		+'<article class="item" >'
			+'<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NoticesModal">'
			+'<img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" width="200px" height="100px"/>'
			+'<header>'
			+'	<h2 >공지사항</h2>'
			+'</header></button>'
		+'</article>'
		+'<article class="item">'
			+'<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#QNAModal">'
			+'<img src="${pageContext.request.contextPath}/resources/core/images/pic06.jpg" alt="" width="200px" height="100px"/>'
			+'<header>'
				+'<h2>내 문의내역</h2>'
			+'</header></button>'
		+'</article>'
	+'</div>'
	+'<div class="5u" style="margin-top: 7%" >'
		+'<article class="item">'
			+'<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#FAQModal">'
			+'<img src="${pageContext.request.contextPath}/resources/core/images/pic04.jpg" alt="" width="200px" height="100px"/>'
			+'<header>'
				+'<h2>FAQ</h2>'
			+'</header></button>'
		+'</article>'
		+'<article class="item">'
			+'<button type="button" style="background-color: #81918E;" class="btn btn-info btn-lg" data-toggle="modal" data-target="#callModal">'
			+'<img src="${pageContext.request.contextPath}/resources/core/images/pic05.jpg" alt="" width="200px" height="100px"/>'
		
		+'<header>'
			+'	<h2>문의하기</h2>'
			+'</header>'
			+'</button>'
		+'</article>'
	+'</div>'
+'</div>'
	})
	$("#container").append(html); 
});


$(document).ready(function(){


$('#NoticesModal').click(function(){
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'Notices/Modal',
		success : function(returnData) {
			var list = returnData.notices;
			var contextPath = getContextPath();
			var html = "";
			html = html+'<div class="modal" tabindex="-1"  role="dialog" id="NoticesModal">'
		    +  '<div class="modal-dialog">'
		     + '<div class="modal-content">' 
				+					'<header>'
				+						'<h2 align="center">공지사항</h2>'
				+					'</header>'
									

		+ ' <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">'

						
					+	'<tr>'
						+	'<th>번호</th>'
						+	'<th>제목</th>'
						+	'<th>작성일</th>'
					+	'</tr>';

				for (var i = 0; i < list.size(); i++) {
						html = html+'<tr>'
							+	'<td>'+list[i].nidx+'</td>'
							+	'<td><a id="NoticesDetail" href="NoticeDetail/${'+ list[i].nidx +'}">'+list[i].title+'</a></td>'
							+	'<td>'+list[i].regdate+'</td>'
						+	'</tr>'
				}

			html = html	+	'</table>'
				+	'<table>'
				+	'<tr>'
				+	'<td><form method="post" action="NoticesModal">'
				+		'<div class="6u" align="center"><input style="margin-left: 50%; padding: 0.5em 1.0em 0.5em 1.0em;" type="text" name="title" placeholder="제목" />'
				+	'<input style="margin-left:50%; padding: 0.25em 1.0em 0.25em 1.0em;" type="submit" value="검색" /></div>'
					+	'</form></td>'
				+	'<td><a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a></td>'
				+	'</tr>'
				+	'</table>'
		     +' </div>'
		    + ' </div>'
		    + ' </div>';
			$(html).appendTo('container').modal();
	html = "";
				}
			error : function(){
			alert("error");	
			
			}
		
	});
		}
	
		
function getNoticesDetailList(){
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : 'NoticesDetail',
				success : function(returnValue) {
					var detail = returnValue.noticesdetail;
					var contextPath = getContextPath();
					var html = "";
					html = html+'<div class="modal fade" role="dialog" id="NoticesDetailModal">'
				    +  '<div class="modal-dialog">'
				     + '<div class="modal-content">' 
						+					'<header>'
						+						'<h2 align="center">공지사항</h2>'
						+					'</header>'
											

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

				+	'</table>'
						
						+	'<a href="#NoticesModal"><input style="padding: 0.25em 1.0em 0.25em 1.0em; margin-left: -100%" type="submit" value="뒤로" /></a>'
				     +' </div>'
				    + ' </div>'
				    + ' </div>';
			$("#container").append(html); 
			html = "";
				)
				
			});
				};		
});		
	function getContextPath(){
	    var offset=location.href.indexOf(location.host)+location.host.length;
	    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
	    return ctxPath;
	}