<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container" style="margin-bottom: 10px; text-align: center;  padding-top: 0.6em;">
	<span style="font-size: 2em"><c:out value="회원정보"></c:out></span>
	<hr style="border: solid 1px #ddd;">
	<div class="featurette" id="services" style="text-align: left;">
		<c:if test="${empty users.getImgsrc()}">
		<img style="margin: 5em 5em 1em 5em; width: 140px; height 140px;" class="featurette-image img-circle img-responsive pull-left" src="http://placehold.it/140x140">
		</c:if>
		<c:if test="${!empty users.getImgsrc()}">
		<img style="margin: 5em 5em 1em 5em; width: 140px; height 140px;" class="featurette-image img-circle img-responsive pull-left" src="${pageContext.request.contextPath}/resources/core/images/upload/${users.getImgsrc()}">
		</c:if>
		<h2 class="featurette-heading">${users.getId() }</h2>
		<p class="lead">
			<span class="text-muted">별명:</span> ${users.getNickname() }
		</p>
		<p class="lead">
			<span class="text-muted">연락처:</span> ${users.getPhone() }
		</p>
		<p class="lead">
			<span class="text-muted">등급:</span> ${users.getRating() }
		</p>
		<p class="lead">
			<span class="text-muted">관심 카테고리:</span> ${users.getInterest() }
		</p>
		<form id="insertform" action="uploadfile" enctype="multipart/form-data" method="POST">
			<input class="input-default pull-left" type="file" id="uploadfile" name="uploadfile" style="font-size: 14px;">
			<button  class="btn btn-default pull-left" type="submit" name="submit" id="submit" style="color: #333 !important;">사진올리기</button>
		</form>
		<p class="lead"></p>
		<p class="lead"></p>
	</div>
	<div class="row" style="margin: -40px 0 -1px -40px;">
		<div class="col-md-12">
			<hr>
			<button class="btn btn-default pull-right"
				style="color: #333 !important;"
				onClick="location.href='../users/edit?id=${users.getId() }'">
				<i class="glyphicon glyphicon-pencil"></i> 회원정보수정
			</button>
			<%-- <button class="btn btn-default pull-right" onClick="location.href='../users/check?id=${users.getId() }'">
										<i class="glyphicon glyphicon-pencil" ></i> 회원탈퇴
									</button> --%>
			<button type="button" class="btn btn-default pull-right"
				data-toggle="modal" data-target="#myModal"
				style="margin-right: 1%; color: #333 !important;">탈퇴</button>

			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header"></div>
						<jsp:include page="usersCheck.jsp?id=${users.getId() }"
							flush="false"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>