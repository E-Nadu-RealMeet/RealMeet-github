<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<style type="text/css">
.row{
	margin: -40px 0 -1px -40px;
}
</style>
</head>
<div class="container" style="text-align: left;">
	<div class="featurette" id="services">
            <img style="margin: 5em 5em 5em 5em;" class="featurette-image img-circle img-responsive pull-left" src="http://placehold.it/140x140">
            <h2 class="featurette-heading">The Second Heading
                <span class="text-muted">Is Pretty Cool Too.</span>
            </h2>
            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
</div>
<div style="padding: 2px; border-radius: 4px; border: 1px solid gray; border-image: none; width: 100%; max-width: 1000px; margin: 0 auto;">
	<div class="row">
		<div class="col-md-9" style="width: 100%; margin: 0 auto;">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12 lead">
							User profile
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 text-center">
							<img class="img-circle avatar avatar-original" style="-webkit-user-select: none; display: block; margin: auto;"
								src="http://robohash.org/sitsequiquia.png?size=120x120">
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12" style="padding: 15px 10px 15px 10px;">
									<h1 class="only-bottom-margin">${users.getId() }</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6" style="text-align: left;">
									<span class="text-muted">별명:</span> ${users.getNickname() }<br> <span class="text-muted">연락처:</span> ${users.getPhone() }<br>
									<span class="text-muted">등급:</span> ${users.getRating() }<br> <span class="text-muted">관심 카테고리:</span> ${users.getInterest() }<br>
									<br> <small class="text-muted">Created: 01.01.2015</small>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<hr>
							<button class="btn btn-default pull-right" style="color: #333 !important;"
								onClick="location.href='../users/edit?id=${users.getId() }'">
								<i class="glyphicon glyphicon-pencil"></i> 회원정보수정
							</button>
							<%-- <button class="btn btn-default pull-right" onClick="location.href='../users/check?id=${users.getId() }'">
										<i class="glyphicon glyphicon-pencil" ></i> 회원탈퇴
									</button> --%>
							<button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#myModal"
								style="margin-right: 1%; color: #333 !important;">탈퇴</button>

							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header"></div>
										<jsp:include page="usersCheck.jsp?id=${users.getId() }" flush="false"></jsp:include>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>