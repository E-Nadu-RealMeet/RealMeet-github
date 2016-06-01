
$(document).ready(function(){

	$('#applyForEvent').click(function(){
		alert("눌림");
		
	});

});


/*contextPath 가져오는 함수 by 지원 */
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}