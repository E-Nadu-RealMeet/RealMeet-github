<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<script>
	$(document).ready(function() {
		$('#myCarousel').carousel('cycle');
		$('#myCarousel2').carousel('cycle');
	});
</script>
<div class="container">
	<h2>금주의 이벤트!</h2>
	<hr>
	<div id="myCarousel2" class="carousel slide vertical">
		<ol class="carousel-indicators">
			<c:forEach var="e" items="${list}" varStatus="status">
				<c:choose>
					<c:when test="${status.count==1}">
						<c:set var="numone" value="active"></c:set>
					</c:when>
					<c:when test="${status.count!=1}">
						<c:set var="numone" value=""></c:set>
					</c:when>
				</c:choose>
				<li data-target="#myCarousel2" data-slide-to="${status.index}" class="${numone}"></li>
			</c:forEach>
		</ol>

		<div class="carousel-inner" role="listbox">
			<c:forEach var="e" items="${list}" varStatus="status">
				<c:choose>
					<c:when test="${status.count==1}">
						<c:set var="numone" value=" active"></c:set>
					</c:when>
					<c:when test="${status.count!=1}">
						<c:set var="numone" value=""></c:set>
					</c:when>
				</c:choose>
				<div class="item${numone}" style="cursor:pointer;">
					<img alt="${status.count}위" src="${pageContext.request.contextPath}/resources/core/images/upload/${e.getImgsrc()}"
						data-src="holder.js/1200x500/text:slide" onclick="location.href='${pageContext.request.contextPath}/event/${e.getEsidx()}'">
					<div class="carousel-caption" onclick="location.href='${pageContext.request.contextPath}/event/${e.getEsidx()}'">
						<h3>
							<a id="detailLink" href="${pageContext.request.contextPath}/event/${e.getEsidx()}"><c:out value="${e.getEventname()}" /></a>
						</h3>
						<p>
							<c:out value="${e.getAbs()}" />
						</p>
						<span class="icon fa-heart-o">${e.getGood()}</span>
						&nbsp
						<span class="icon fa-commenting-o"></span>
						<br>
					</div>
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
</div>
