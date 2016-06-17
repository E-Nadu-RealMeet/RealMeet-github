<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="container">

		<header>
			<h2>Homepage Detail</h2>
		</header>

		<p>이 홈페이지는 1인시대, 모든 활동을 혼자하는 시대적 풍토때문에 단체 활동에 제약이 생기고 그로 인해 사회적 후생이 감소한다. 점심시간에 함께 식사를 하는것, 여럿이 함께 하는 스포츠 활동 등 단체활동들을 각 연령별, 지역별 모임활동을
			주최함으로써 지역사회에 활력을 불어넣고자 한다.</p>

	</div>
<%-- 
<!-- About Me -->
<section id="about" class="three">
	<div class="container">

		<header>
			<h2>Category</h2>
		</header>


		<table border=1>
			<tr>
				<td>카테고리필터</td>
			</tr>
			<tr>
				<td><input type=checkbox name=category value="lunch">식사 &nbsp; <input type=checkbox name=category value="sports">운동
					&nbsp; <input type=checkbox name=category value="communication">일상대화 &nbsp; <input type=checkbox name=category value="cultural">문화생활
					&nbsp; <input type=checkbox name=category value="meetin">만남 &nbsp; <input type=checkbox name=category value="volunteer">자원봉사
					&nbsp; <input type=checkbox name=category value="study">스터디 &nbsp;</td>
			</tr>
		</table>

		<c:forEach var="item" items="${list}">
			<div class="row">
				<div class="4u 12u$(mobile)">
					<article class="item">
						<a href="#" class="image fit"><img src="${pageContext.request.contextPath}/resources/core/images/pic02.jpg" alt="" /></a>
					</article>
				</div>
				<span style="width: 58%; height: 230px; text-align: left; border-left: solid; border-left-color: white;">
					<div style="font-weight: bold;">
						이벤트 명 : ${item.getEventname()}<br>
					</div>
					<div style="font-size: 0.8em; height: 50%; overflow: hidden;">설명 : ${item.getDescription() }</div> <a href="${item.getEsidx()}">더보기</a>
				</span> <span
					style="float: right; width: 14%; height: 230px; font-size: 15px; text-align: center; border-left: solid; border-left-color: white;">
					<img src="${pageContext.request.contextPath}/resources/core/images/pic.jpg" style="width: 40px; height: 40px; margin-right: 5px" /> <br>개최자
					: ${item.getHolder() } <br>평점 : 10 <br> <a href="">더보기</a>
				</span>
			</div>
		</c:forEach>

	</div>
</section> --%>