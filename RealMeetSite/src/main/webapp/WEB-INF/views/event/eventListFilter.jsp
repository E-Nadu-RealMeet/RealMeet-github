<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script type="text/javascript">
function divshow(aisi) {
	document.getElementById(aisi).style.visibility = 'visible';
}
function divhide(aisi) {
	document.getElementById(aisi).style.visibility = 'hidden';
}
function newfilter(c,v,id){
	if($("#"+id).length > 0){
		return;
	}else{
		$("#selectfilter").append("<a id="+id+" class="+c+" value="+v+"><span>"+v+"</span></a><a id="+id+" href=javascript:delfilter('"+id+"');><img src=http://img.incruit.com/fe/sub_home_contents_job/img/button/btn_delete.gif></a>");
	}
}
function delfilter(divId){
	$("[id="+divId+"]").remove();
}
</script>
</head>

<div id="list-filter">
	<div id="menubar">
		<ul id="sidebar" class="nav nav-pills nav-stacked">
			<li class="menu"><a onmouseover="divshow('menu_div_0');"
				onmouseleave="divhide('menu_div_0');" onfocus=this.blur><span
					class="fa fa-bars">카테고리전체</span></a>
				<div id=menu_div_0 class="menu_div"
					onmouseover="divshow('menu_div_0');"
					onmouseleave="divhide('menu_div_0');">
					<div>
						<ul style="width: 200px; border-top: none;">
							<li style="border: 1px solid #ddd;"><a href="#">지역별</a>
								<ul style="width: 250px;">
									<li><a href="javascript:newfilter('region','서울','seuol');">서울</a></li>
									<li><a
										href="javascript:newfilter('region','인천', 'incheon');">인천</a></li>
									<li><a
										href="javascript:newfilter('region','경기', 'gyeongi');">경기</a></li>
								</ul>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('region','충청도','chungcheong');">충청도</a></li>
									<li><a
										href="javascript:newfilter('region','강원도','gangwon');">강원도</a></li>
									<li><a
										href="javascript:newfilter('region','경상도','gyeongsang');">경상도</a></li>
								</ul>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('region','전라도','jeolla');">전라도</a></li>
								</ul></li>
						</ul>
					</div>
					<div style="display: inline-block;">
						<ul style="text-align: center; width: 250px; border-top: none;">
							<li style="border: 1px solid #ddd;"><a href="#">관심분야별</a>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('category','인연','relation');">인연</a></li>
									<li><a
										href="javascript:newfilter('category','게임','game');">게임</a></li>
								</ul>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('category','모임','meeting');">모임</a></li>
									<li><a
										href="javascript:newfilter('category','여행','travel');">여행</a></li>
								</ul>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('category','맛집','restaurant');">맛집</a></li>
									<li><a
										href="javascript:newfilter('category','강연','lecture');">강연</a></li>
								</ul>
								<ul style="width: 250px;">
									<li><a
										href="javascript:newfilter('category','지식','knowledge');">지식</a></li>
								</ul></li>
						</ul>
					</div>
				</div></li>

			<li class="menu"><a onmouseover="divshow('menu_div_1');"
				onmouseleave="divhide('menu_div_1');" onfocus=this.blur><span
					class="fa fa-map-marker">지역</span></a>
				<div id="menu_div_1" class="menu_div"
					onmouseover="divshow('menu_div_1');"
					onmouseleave="divhide('menu_div_1');">
					<ul>
						<li><a href="javascript:newfilter('region','서울','seuol');">서울</a></li>
						<li><a href="javascript:newfilter('region','인천', 'incheon');">인천</a></li>
						<li><a href="javascript:newfilter('region','경기', 'gyeongi');">경기</a></li>
						<li><a href="javascript:newfilter('region','충청도','chungcheong');">충청도</a></li>
						<li><a href="javascript:newfilter('region','강원도','gangwon');">강원도</a></li>
						<li><a href="javascript:newfilter('region','경상도','gyeongsang');">경상도</a></li>
						<li><a href="javascript:newfilter('region','전라도','jeolla');">전라도</a></li>
					</ul>
				</div></li>
			<li class="menu"><a onmouseover="divshow('menu_div_2');"
				onmouseleave="divhide('menu_div_2');" onfocus=this.blur><span
					class="fa fa-share-alt">관심분야</span></a>
				<div id="menu_div_2" class="menu_div"
					onmouseover="divshow('menu_div_2');"
					onmouseleave="divhide('menu_div_2');">
					<ul>
						<li><a
							href="javascript:newfilter('category','인연','relation');">인연</a></li>
						<li><a href="javascript:newfilter('category','게임','game');">게임</a></li>
						<li><a
							href="javascript:newfilter('category','모임','meeting');">모임</a></li>
						<li><a href="javascript:newfilter('category','여행','travel');">여행</a></li>
						<li><a
							href="javascript:newfilter('category','맛집','restaurant');">맛집</a></li>
						<li><a
							href="javascript:newfilter('category','강연','lecture');">강연</a></li>
						<li><a
							href="javascript:newfilter('category','지식','knowledge');">지식</a></li>
					</ul>
				</div></li>
		</ul>
		<div id="selectfilter"></div>
	</div>
</div>
