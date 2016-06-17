<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container Title">
<span  class="detail-info-Title">개최자 프로필</span>
</div>
<div class="container">
	<div class="featurette" id="services" style="text-align: left;">
		<c:if test="${!empty holderInfo}">
			<div id="detail-img">
			<img class="featurette-image img-circle img-responsive pull-left"
				src='${pageContext.request.contextPath}/resources/core/images/upload/${holderInfo.getImgsrc()}'>
			</div>
			<div id="detail-info">
				<div id="detail-info-titleDiv">
				<span class="detail-info-Title">${holderInfo.getId() }</span>
				</div>
				<p class="lead">
					<span class="text-muted">별명:</span> ${holderInfo.getNickname() }
				</p>
				<%-- <p class="lead">
					<span class="text-muted">연락처:</span> ${holderInfo.getPhone() }
				</p> --%>
				<c:choose>
					<c:when test="${holderInfo.getRating()<10}">
						<!-- 검정 -->
						<c:set var="x" value="-21px"></c:set>
						<c:set var="y" value="-127px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()<20}">
						<!-- 빨강 -->
						<c:set var="x" value="-74px"></c:set>
						<c:set var="y" value="1px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()<30}">
						<!-- 주황 -->
						<c:set var="x" value="-152px"></c:set>
						<c:set var="y" value="-43px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()<50}">
						<!-- 노랑 -->
						<c:set var="x" value="-152px"></c:set>
						<c:set var="y" value="-43px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()<70}">
						<!-- 초록 -->
						<c:set var="x" value="-160px"></c:set>
						<c:set var="y" value="-90px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()<=100}">
						<!-- 남색 -->
						<c:set var="x" value="-137px"></c:set>
						<c:set var="y" value="-131px"></c:set>
					</c:when>
					<c:when test="${holderInfo.getRating()>100}">
						<!-- 보라 -->
						<c:set var="x" value="-101px"></c:set>
						<c:set var="y" value="-154px"></c:set>
					</c:when>
					<%-- <c:when test="${holderInfo.getRating()>=70}">
						<!-- 금색 -->
						<c:set var="x" value="-56px"></c:set>
						<c:set var="y" value="-152px"></c:set>
					</c:when> --%>
				</c:choose>
				<div id="gradeImg" style="background-position: ${x} ${y}"></div>
				<p class="lead">
					<span class="text-muted">POINT:</span> ${holderInfo.getRating() }
				</p>
				<p class="lead">
					<span class="text-muted">관심 카테고리:</span> ${holderInfo.getInterest() }
				</p>
			</div>
		</c:if>
	</div>
</div>
<div class="container con-list Title">
<span  class="detail-info-Title">만든 이벤트 목록</span>
</div>
<c:forEach var="item" items="${holderEvents }">
<div class="container con-list list">
		<c:if test="${not empty holderEvents }">
				<div class="list-contents-title">이벤트 제목</div>
				<p><a href="${pageContext.request.contextPath}/event/${item.getEsidx()}"><c:out value="${item.getEventname() }"></c:out></a></p>
				<div class="list-contents-title">이벤트 일자</div>
				<p><c:out value="${item.getEldate() }" default="진행 중인 이벤트가 없습니다."></c:out></p>
				<div class="list-contents-title">이벤트 내용</div>
				<p><c:out value="${item.getAbs() }" default="이벤트 간단 설명이 없습니다."></c:out></p>
		</c:if>
	</div>
</c:forEach>
