<%@page import="java.util.List"%>
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
</script>

</head>
<%-- <script	src="${pageContext.request.contextPath}/resources/core/js/event/eventList.js?ver=1" type="text/javascript"></script> --%>
<div class="container" id="container">
	<div style="max-width: 1000px; padding: 10px; margin: 10px auto;">
		<div>
			<!-- <div class="dropdown">
						<button class="btn btn-default dropdwon-toggle" type="button" id="dr1" data-toggle="dropdown" aria-expanded="true">
							DropDown
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dr1" style="margin: 0 auto;">
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
						 </ul>
					</div> -->
		</div>

		<div id="menubar">
			<ul id="sidebar" class="nav nav-pills nav-stacked">
				<li class="menu"><a onmouseover="divshow('menu_div_0');"
					onmouseleave="divhide('menu_div_0');" onfocus=this.blur><span
						class="fa fa-bars">카테고리전체</span></a>
					<div id=menu_div_0 class="menu_div"
						onmouseover="divshow('menu_div_0');"
						onmouseleave="divhide('menu_div_0');">
						<div>
							<ul style="text-align: center; width: 200px; border-top: none;">
								<li style="border: 1px solid #ddd;"><a href="#">지역별</a>
									<ul style="width: 200px;">
										<li><a>서울</a></li>
										<li><a>인천/경기</a></li>
										<li><a>충청도</a></li>
									</ul>
									<ul style="width: 200px;">
										<li><a>강원도</a></li>
										<li><a>경상도</a></li>
										<li><a>전라도</a></li>
									</ul></li>

							</ul>
						</div>
						<div style="display: inline-block;">
							<ul style="text-align: center; width: 250px; border-top: none;">
								<li style="border: 1px solid #ddd;"><a href="#">관심분야별</a>
									<ul style="width: 250px;">
										<li><a>식사</a></li>
										<li><a>운동</a></li>
									</ul>
									<ul style="width: 250px;">
										<li><a>일상대화</a></li>
										<li><a>문화생활</a></li>
									</ul>
									<ul style="width: 250px;">
										<li><a>만남</a></li>
										<li><a>자원봉사</a></li>
									</ul>
									<ul style="width: 250px;">
										<li><a>스터디</a></li>
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
							<li><a>서울</a></li>
							<li><a>인천/경기</a></li>
							<li><a>충청도</a></li>
							<li><a>강원도</a></li>
							<li><a>경상도</a></li>
							<li><a>전라도</a></li>
						</ul>
					</div></li>
				<li class="menu"><a onmouseover="divshow('menu_div_2');"
					onmouseleave="divhide('menu_div_2');" onfocus=this.blur><span
						class="fa fa-share-alt">관심분야</span></a>
					<div id="menu_div_2" class="menu_div"
						onmouseover="divshow('menu_div_2');"
						onmouseleave="divhide('menu_div_2');">
						<ul>
							<li><a>식사</a></li>
							<li><a>운동</a></li>
							<li><a>일상대화</a></li>
							<li><a>문화생활</a></li>
							<li><a>만남</a></li>
							<li><a>자원봉사</a></li>
							<li><a>스터디</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="row" style="margin: 0.6em;">
	   <div class="col-md-6 portfolio-item">
	       <div class="col-md-6 portfolio-item-detail">
	       <p>
		       <span class="caption-title">
		           <a href="#">Project One</a>
		       </span>
	       </p>
	       <br>
	       <p>
		       <span class="caption-desc">
		       		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.
		       </span>
	       </p>
	       <span class="icon fa-heart-o">${e.getGood()}</span>
						&nbsp
				<span class="icon fa-commenting-o">${e.getReviewCnt()}</span>
	       </div>
	   </div>
	</div>
	<div class="row" style="margin: 0.6em;">
	   <div class="col-md-6 portfolio-item">
	       <div class="col-md-6 portfolio-item-detail">
	       <p>
		       <span class="caption-title">
		           <a href="#">Project Two</a>
		       </span>
	       </p>
	       <br>
	       <p>
		       <span class="caption-desc">
		       		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.
		       </span>
	       </p>
	       <span class="icon fa-heart-o"></span>
						&nbsp
						<span class="icon fa-commenting-o"></span>
	       </div>
	   </div>
	</div>
</div>
