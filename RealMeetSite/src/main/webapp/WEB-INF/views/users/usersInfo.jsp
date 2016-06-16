<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style type="text/css">
.row {
	margin: -40px 0 -1px -40px;
}
</style>
</head>
<div class="container">
	<c:out value="회원정보"></c:out>
	<hr style="border: solid 1px #ddd; margin: 0 0 1em 0;">
	<div class="featurette" id="services" style="text-align: left;">
		<img style="margin: 5em 5em 5em 5em;"
			class="featurette-image img-circle img-responsive pull-left"
			src="http://placehold.it/140x140">
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
		<p class="lead"></p>
		<p class="lead"></p>
	</div>
	<div class="row">
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
