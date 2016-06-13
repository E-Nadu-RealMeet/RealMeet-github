<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<style>
.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}

</style>
<section id="portfolio" class="two">
	<div class="container">

		<div class="blog-post">
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#detail" id="detail-tab" role="tab" data-toggle="tab" aria-controls="detail">Detail</a></li>
					<li role="presentation"><a href="#pictures" role="tab"
						id="pictures-tab" data-toggle="tab" aria-controls="pictures">Pictures</a></li>
					<li role="presentation"><a href="#review" role="tab"
						id="review-tab" data-toggle="tab" aria-controls="reivew">Reviews</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<c:if test="${detail.size() != 0 }">
						<div role="tabpanel" class="tab-pane fade in active" id="detail"
							aria-labelledby="detail-tab" aria-expanded="true">
							<!-- 이벤트 제목란 -->
							<h2 class="blog-post-title">${detail.get(0).getEventname() }</h2>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventNameUpdate">수정</button>
							<!-- 이벤트 날짜란 -->
							<p class="blog-post-meta">${detail.get(0).getEldate() }
								by <a href="#">${detail.get(0).getHolder() }</a>
							</p>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventDateUpdate">수정</button>
							<hr>
							<!-- 이벤트 상세내용 -->
							<blockquote>
								<p>${detail.get(0).getDescription() }</p>		
							</blockquote>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#EventContentUpdate">수정</button>
							<hr>
							<div id="lists"></div>
							
							<hr>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="pictures"
							aria-labelledby="pictures-tab" aria-expanded="false">
							<p><div class="row">사진 넣을공간</div>


						</div>
						<div role="tabpanel" class="tab-pane fade" id="review"
							aria-labelledby="review-tab" aria-expanded="false">
							<div class="row">
								<c:if test="${reviews.size() != 0}">
									<c:forEach begin="0" end="${reviews.size()-1 }" var="i">
										<!-- "col-sm-6" = 가용범위 1/2 크기 div -->
										<div class="col-sm-6">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title">${reviews.get(i).getTitle() }</h3>
												</div>
												<div class="panel-body">${reviews.get(i).getContent() }
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			


		</div>
		<!-- 안보이는 부분 -->
		<div class="eventlist" style='display: none;'>
			<div class="target" data-toggle="modal" data-target="#apply">
				<input type="radio" class="chk" id="chk${i}" name="chkDate">주소
				/ 날짜 / 참여여부
			</div>
			<div class="modal fade" id="apply">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-body" style="overflow: auto">
							<div class="col-md-12" style="text-align: left">정말 참여하시겠습니까</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="submitEvent" class="btn btn-primary"
								onclick="return applyProcess()">네</button>
							<button type="button" id="close" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>



<div class="modal fade" id="EventNameUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>제목 수정</h2>
</header>

<form action="editName" method="POST">
<input type="text" name="eventName" value="${detail.get(0).getEventname() }"/>
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>


<div class="modal fade" id="EventDateUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>날짜 수정</h2>
</header>

<form action="editDate" method="post">
<input type="datetime-local" name="elDate" value="${detail.get(0).getEldate() }" />
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

<div class="modal fade" id="EventContentUpdate" role="dialog">
 <div class="modal-dialog">
<div class="modal-content">
<header>
<h2>요약 수정</h2>
</header>



<form action="editDesc" method="post">
<input type="text" name="description" value="${detail.get(0).getDescription() }" />
<input type="hidden" name="esidx" value="${detail.get(0).getEsidx() }">
<button type="submit" class="btn btn-primary">수정</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</form>
</div>
</div>
</div>

	
</div>
</section>