<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>


<div class="container" style="margin-bottom: 10px; text-align: center;">
	<c:out value="회원정보"></c:out>
	<hr style="border: solid 1px #ddd; margin: 0 0 1em 0;">
	<jsp:include page="../users/usersInfo.jsp"></jsp:include>
</div>


<div style="margin: 0 auto;">
	<div class="event_make"
		style="float: left; width: 47%; text-align: center; border: 0.5px solid #cccccc; margin: 1%; padding: 0 0.5em 0 0.5em;">
		<c:out value="내가 만든 이벤트 리스트"></c:out>
		<hr style="border: solid 1px #ddd; margin: 0 auto;">
		<br>
		<ul class="event-list">
		<c:forEach var="item" items="${my_list }">
			<li><time datetime="${item.getEldate() }">
					<span class="month"><c:out value="${item.getEldate() }"></c:out></span>
					<!-- <span class="day">4</span>
					<span class="month">Jul</span> -->
				</time> 
				<div class="info">
					<h2 class="title">${item.getEventname() }</h2>
					<p class="desc">${item.getDescription() }</p>
					<ul>
						<li style="width: 70%;"><a href="#website"><span
								class="fa fa-globe"></span> ${item.getAddr() }</a></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#"><span
								class="fa fa-users"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#"><span
								class="fa fa-heart"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#"><span class="fa fa-wifi"></span></a></li>
					</ul>
				</div></li>
		</c:forEach>
		</ul>
		<!-- <ul class="event-list">
			<li><time datetime="2015-11-20">
					<span class="day">4</span>
					<span class="month">Jul</span>
				</time> 
				<div class="info">
					<h2 class="title">Independence Day</h2>
					<p class="desc">United States Holiday</p>
					<ul>
						<li style="width: 70%;"><a href="#website"><span
								class="fa fa-globe"></span> Website</a></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-20 0000">
					<span class="day">8</span> <span class="month">Jul</span> <span
						class="year">2014</span> <span class="time">12:00 AM</span>
				</time>
				<div class="info">
					<h2 class="title">One Piece Unlimited World Red</h2>
					<p class="desc">PS Vita</p>
					<ul>
						<li style="width: 50%;"><a href="#website"><span
								class="fa fa-globe"></span> Website</a></li>
						<li style="width: 50%;"><span class="fa fa-money"></span>
							$39.99</li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-20 2000">
					<span class="day">20</span> <span class="month">Jan</span> <span
						class="year">2014</span> <span class="time">8:00 PM</span>
				</time> <img alt="My 24th Birthday!"
				src="https://farm5.staticflickr.com/4150/5045502202_1d867c8a41_q.jpg" />
				<div class="info">
					<h2 class="title">Mouse0270's 24th Birthday!</h2>
					<p class="desc">Bar Hopping in Erie, Pa.</p>
					<ul>
						<li style="width: 33%;">1 <span
							class="glyphicon glyphicon-ok"></span></li>
						<li style="width: 34%;">3 <span class="fa fa-question"></span></li>
						<li style="width: 33%;">103 <span class="fa fa-envelope"></span></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-31 1600">
					<span class="day">31</span> <span class="month">Jan</span> <span
						class="year">2014</span> <span class="time">4:00 PM</span>
				</time> <img alt="Disney Junior Live On Tour!"
				src="http://www.thechaifetzarena.com/images/main/DL13_PiratePrincess_thumb.jpg" />
				<div class="info">
					<h2 class="title">Disney Junior Live On Tour!</h2>
					<p class="desc">Pirate and Princess Adventure</p>
					<ul>
						<li style="width: 33%;">$49.99 <span class="fa fa-male"></span></li>
						<li style="width: 34%;">$29.99 <span class="fa fa-child"></span></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>
		</ul> -->
	</div>

	<div class="event_join"
		style="float: right; width: 47%; text-align: center; border: 0.5px solid #cccccc; margin: 1%; padding: 0 0.5em 0 0.5em;">
		<c:out value="내가 참여한 이벤트 리스트"></c:out>
		<hr style="border: solid 1px #ddd; margin: 0 auto;">
		<br>

		<ul class="event-list">
		<c:forEach var="item" items="${join_list }">
			<li><time datetime="${item.getEldate() }">
					<span class="month"><c:out value="${item.getEldate() }"></c:out></span>
					<!-- <span class="day">4</span>
					<span class="month">Jul</span> -->
				</time> 
				<div class="info">
					<h2 class="title">${item.getEventname() }</h2>
					<p class="desc">${item.getDescription() }</p>
					<ul>
						<li style="width: 70%;"><a href="#website"><span
								class="fa fa-globe"></span> ${item.getAddr() }</a></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>
		</c:forEach>
		
			<!-- <li><time datetime="2014-07-20">
					<span class="day">4</span> <span class="month">Jul</span> <span
						class="year">2014</span> <span class="time">ALL DAY</span>
				</time> <img alt="Independence Day"
				src="https://farm4.staticflickr.com/3100/2693171833_3545fb852c_q.jpg" />
				<div class="info">
					<h2 class="title">Independence Day</h2>
					<p class="desc">United States Holiday</p>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-20 0000">
					<span class="day">8</span> <span class="month">Jul</span> <span
						class="year">2014</span> <span class="time">12:00 AM</span>
				</time>
				<div class="info">
					<h2 class="title">One Piece Unlimited World Red</h2>
					<p class="desc">PS Vita</p>
					<ul>
						<li style="width: 50%;"><a href="#website"><span
								class="fa fa-globe"></span> Website</a></li>
						<li style="width: 50%;"><span class="fa fa-money"></span>
							$39.99</li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-20 2000">
					<span class="day">20</span> <span class="month">Jan</span> <span
						class="year">2014</span> <span class="time">8:00 PM</span>
				</time> <img alt="My 24th Birthday!"
				src="https://farm5.staticflickr.com/4150/5045502202_1d867c8a41_q.jpg" />
				<div class="info">
					<h2 class="title">Mouse0270's 24th Birthday!</h2>
					<p class="desc">Bar Hopping in Erie, Pa.</p>
					<ul>
						<li style="width: 33%;">1 <span
							class="glyphicon glyphicon-ok"></span></li>
						<li style="width: 34%;">3 <span class="fa fa-question"></span></li>
						<li style="width: 33%;">103 <span class="fa fa-envelope"></span></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li>

			<li><time datetime="2014-07-31 1600">
					<span class="day">31</span> <span class="month">Jan</span> <span
						class="year">2014</span> <span class="time">4:00 PM</span>
				</time> <img alt="Disney Junior Live On Tour!"
				src="http://www.thechaifetzarena.com/images/main/DL13_PiratePrincess_thumb.jpg" />
				<div class="info">
					<h2 class="title">Disney Junior Live On Tour!</h2>
					<p class="desc">Pirate and Princess Adventure</p>
					<ul>
						<li style="width: 33%;">$49.99 <span class="fa fa-male"></span></li>
						<li style="width: 34%;">$29.99 <span class="fa fa-child"></span></li>
					</ul>
				</div> <div class="social">
					<ul>
						<li class="facebook" style="width: 33%;"><a href="#facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="twitter" style="width: 34%;"><a href="#twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="google-plus" style="width: 33%;"><a
							href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
					</ul>
				</div></li> -->
		</ul>
	</div>
</div>