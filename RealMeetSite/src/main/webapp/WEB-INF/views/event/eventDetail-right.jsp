<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<div class="featurette" id="services" style="text-align: left;">
		<c:if test="${!empty holderInfo}">
		<img style="margin: 5em 5em 5em 5em;"
			class="featurette-image img-circle img-responsive pull-left"
			src='${pageContext.request.contextPath}/resources/core/images/upload/${holderInfo.getImgsrc()}'>
		<br><br><br><br><br><br><br><br><br>
		<h2 class="featurette-heading">${holderInfo.getId() }</h2>
		<p class="lead">
			<span class="text-muted">별명:</span> ${holderInfo.getNickname() }
		</p>
		<p class="lead">
			<span class="text-muted">연락처:</span> ${holderInfo.getPhone() }
		</p>
		<p class="lead">
			<span class="text-muted">등급:</span> ${holderInfo.getRating() }
		</p>
		<p class="lead">
			<span class="text-muted">관심 카테고리:</span> ${holderInfo.getInterest() }
		</p>
		<p class="lead"></p>
		<p class="lead"></p>
		</c:if>
		
		
		만든 리스트 목록<br>
			<c:if test="${not empty holderEvents }">
				<c:forEach var="item" items="${holderEvents }">
					eldate -- ${item.getEldate() }<br>
					eventname -- ${item.getEventname() }<br>
					description -- ${item.getDescription() }<br>
					<p>---------------------------------------<br>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
