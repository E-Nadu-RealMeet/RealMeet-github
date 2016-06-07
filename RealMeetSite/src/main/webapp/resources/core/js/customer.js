$(document).ready(function() {

	$('[data-toggle="modal"]').click(function(e) {
	getNoticesList();
);
});


function getNoticesList(){
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'Notices',
		success : function(returnData) {
			var list = returnData.datas;
		
			var html = "";
			html = html+'<div class="modal fade" role="dialog" id="NoticesModal">'
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

				for (var i = 0; i < list.size; i++) {
						html = html+'<tr>'
							+	'<td>'+list[i].nidx+'</td>'
							+	'<td><a href="NoticesDetail/${Notices.nidx}">'+list[i].title+'</a></td>'
							+	'<td>'+list[i].regdate+'</td>'
						+	'</tr>'
					)

				+	'</table>'
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
		    + ' </div>'
		)
	});
}