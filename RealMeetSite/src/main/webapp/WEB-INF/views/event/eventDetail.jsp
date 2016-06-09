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
<div class="container">
	<%-- <script	src="${pageContext.request.contextPath}/resources/core/js/event/eventDetail.js" type="text/javascript"></script> --%>

	<div class="blog-post">
		<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li role="presentation"><a href="#detail" id="detail-tab" role="tab" data-toggle="tab" aria-controls="detail">Detail</a></li>
				<li role="presentation"><a href="#pictures" role="tab" id="pictures-tab" data-toggle="tab" aria-controls="pictures">Pictures</a></li>
				<li role="presentation"><a href="#review" role="tab" id="review-tab" data-toggle="tab" aria-controls="reivew">Reviews</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<c:if test="${detail.size() != 0 }">
					<div role="tabpanel" class="tab-pane fade in active" id="detail" aria-labelledby="detail-tab" aria-expanded="true">
						<!-- 이벤트 제목란 -->
						<h2 class="blog-post-title">${detail.get(0).getEventname() }</h2>
						<!-- 이벤트 날짜란 -->
						<p class="blog-post-meta">${detail.get(0).getEldate() }
							by <a href="#">${detail.get(0).getHolder() }</a>
						</p>
						<hr>
						<!-- 이벤트 상세내용 -->
						<blockquote>
							<p>${detail.get(0).getDescription() }</p>
						</blockquote>
						<hr>
						<div id="lists"></div>
<<<<<<< HEAD
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detailEditModal">수정</button>
<!-- 						<input type="button" onclick="tmp()" value="button" /> -->
=======
>>>>>>> 0b63bdbbcee5ab6e81b550a5c8e1629582ebf680
						<hr>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="pictures" aria-labelledby="pictures-tab" aria-expanded="false">
						<p>
						<div class="row">사진 넣을공간</div>

						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#picturesEditModal">수정</button>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="review" aria-labelledby="review-tab" aria-expanded="false">
						<div class="row">
							<c:if test="${reviews.size() != 0}">
								<c:forEach begin="0" end="${reviews.size()-1 }" var="i">
									<!-- "col-sm-6" = 가용범위 1/2 크기 div -->
									<div class="col-sm-6">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">${reviews.get(i).getTitle() }</h3>
											</div>
											<div class="panel-body">${reviews.get(i).getContent() }</div>
										</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#reviewEditModal">수정</button>
						</div>
						</c:if>
					</div>
				</div>
				
				
				
<div class="modal fade" role="dialog" id="detailEditModal">
      <div class="modal-dialog">
   
      						
      
      <div class="modal-content"> 
							<header>
								<h2 align="center">Detail 수정</h2>
							</header>
			
			
			
			<table>
			<tr>
			<th><form action="" method="post">
			제목 : <input type="text" name="detail" value="${detail.get(0).getEventname() }"/>
			날짜 : <input type="text" name="detail" value="${detail.get(0).getEldate() }"/>
			상세내용 : <input type="text" name="detail" value="${detail.get(0).getDescription() }"/>
			<button style="float: right;" type="submit"  class="btn btn-primary btn-lg">수정</button>
			</form></th>
			<th><button style="float: right;" type="button" class="btn btn-default btn-lg" data-dismiss="modal">취소</button></th>
			</tr>
			</table>
      </div>
      </div>
      </div>				
				
				
				
				
				<%-- 
				<c:if test="${detail.size() != 0}">
					<c:forEach var="i" begin="0" end="${detail.size()-1 }">
						<div data-toggle="modal" data-target="#apply${}">
							<input type="radio" id="chk${i}" name="chkDate" value="${i}">${detail.get(i).getAddr()}	/ ${detail.get(i).getEldate()} /
							<c:if test="${glist.size() != 0}">
							<c:forEach var="gl" begin="0" end="${glist.size()-1 }">
								<c:if test="${detail.get(i).getElidx() == glist.get(gl).getElidx()}">참여함</c:if>
							</c:forEach>
							</c:if>
							
						</div>
						<div class="modal fade" id="apply">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-body" style="overflow: auto">
										<div class="col-md-12" style="text-align: left">
											정말 참여하시겠습니까
										</div>
										<c:if test="${glist.size() != 0}">
											<c:if test="${detail.get(i).getElidx() == glist.get(gl).getElidx()}">
												<div class="col-md-12" style="text-align: left">정말 취소 하시겠습니까</div>
											</c:if>
										</c:if>
										<c:if test="${glist.size() == 0 || detail.get(i).getElidx() != glist.get(gl).getElidx() }">
											<div class="col-md-12" style="text-align: left">정말 참여 하시겠습니까</div>
										</c:if>
										
									</div>
									<div class="modal-footer">
										<c:if test="${glist.size() != 0}">
											<c:if test="${detail.get(i).getElidx() == glist.get(gl).getElidx()}">
											<button type="submit" id="applyEvent" class="btn btn-primary"
												onclick="return applyProcess()">네</button>
											</c:if>
										</c:if>
										<c:if test="${glist.size()==0 || detail.get(i).getElidx() != glist.get(gl).getElidx()}">
										<button type="submit" id="applyEvent" class="btn btn-primary"
											onclick="return cancleProcess('${detail.get(i).getElidx()}')">네</button>
										</c:if>
										<button type="button" id="close" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if> --%>
				<hr>

<%-- 
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#apply">참여 하기</button>
				<div class="modal fade" id="apply" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">

					</c:if>
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
			<div class="chk" id="chk${i}" name="chkDate">주소 / 날짜 / 참여여부</div>
		</div>
		<div class="modal modal-center fade" id="apply">
			<div class="modal-dialog modal-sm modal-center">
				<div class="modal-content">
					<div class="modal-body" style="overflow: auto">
						<div class="col-md-12" style="text-align: left">정말 참여하시겠습니까</div>
					</div>
					<div class="modal-footer">
						<button type="submit" id="submitEvent" class="btn btn-primary" onclick="return applyProcess()" data-dismiss="modal">네</button>
						<button type="button" id="close" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	</div>
</section>
--%>

</div>

