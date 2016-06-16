<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<div class="container">

	<div class="panel panel-default">
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>
					<td class="table-bordered">글번호</td>
					<td>${aa.getBidx() }</td>
				</tr>
				<tr>
					<td class="table-bordered">제목</td>
					<td colspan="5" style="padding-right: 5em">${aa.getTitle()}</td>
				</tr>
				<tr>
					<td class="table-bordered">작성자</td>
					<td>${aa.getWriter()}</td>
					<td class="table-bordered">조회수</td>
					<td>${aa.getReadcount() }</td>
					<td class="table-bordered">작성일</td>
					<td>${aa.getRegdate()}</td>
				</tr>
			</thead>
			<tbody class="table-condensed">
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td
						style="min-height: 32em; height: 16em; vertical-align: middle; overflow: auto;"
						colspan="6">${aa.getContent()}</td>
				</tr>
			</tbody>
		</table>
	</div>

<<<<<<< HEAD
<p class="article-comment margin-small" align="right">
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeBoard">목록</a> <a
		class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeUpdate/${aa.getBidx()}">수정</a>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeDel/${aa.getBidx()}">삭제</a>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeRefly/${aa.getBidx()}">답글</a>
</p>
	<div class="panel panel-default">
		<table id="boardDetail" class="table">
			<tbody>
				<tr>
					<td class="table-bordered">다음글</td>
					<td class="table-bordered">다음 글이 없습니다.</td>
				</tr>
				<tr>
					<td class="table-bordered">이전글</td>
					<td class="table-bordered">이전 글이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>				
					<td class="table-bordered">작성자</td>
					<td class="table-bordered">제목</td>
					<td class="table-bordered"></td>
				</tr>
			</thead>
			<tbody class="table-condensed">
				<tr>
					<td class="table-bordered"><c:out value="${mid}" default=""></c:out></td>
					<td class="table-bordered"><input type="text" style="width:90%;line-height: 1em;"/></td>
					<td class="table-bordered"><button type="submit" style="padding: 0.5em 2em 0.5em 2em;">Write</button></td>
				</tr>
			</tbody>
		</table>
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>				
					<td class="table-bordered">작성자</td>
					<td class="table-bordered">제목</td>
					<td class="table-bordered">작성일</td>
				</tr>
			</thead>
			<tbody class="table-condensed">
				<tr>
					<td class="table-bordered">덧글리스트(작성자)</td>
					<td class="table-bordered">덧글리스트(제목)</td>
					<td class="table-bordered">덧글리스트(작성일)</td>
				</tr>
			</tbody>
		</table>
		<!-- 변수 임시 설정 부분 (이후 삭제) -->
		<c:set var="startPageNum" value="1"/>
		<c:set var="endPageNum" value="5"/>
		<c:forEach var="i" begin="0" end="${endPageNum}">
                        
                        <c:if test="${startPageNum+i <= endPageNum}">
                       		<c:if test="${startPageNum+i == pages }">
                       			<span><a class="strong" href="${aa.getBidx()}?pages=${startPageNum+i}&field=${field}&query=${query}">${startPageNum+i}</a></span>
                     		</c:if>
                        	
                        	<a href="${aa.getBidx()}?pages=${startPageNum+i}&field=${field}&query=${query}">${startPageNum+i}</a>
                        </c:if>
                        
      </c:forEach>
	</div>
</div>
=======
	<!-- Main -->
			<div class="container">
				<h2 align="center">자유 게시판</h2>

				<div class="panel panel-default">

					<div class="row">
						<div class="panel-heading">
							<h5>제목</h5>
						</div>
						<div class="panel-body">
							${aa.getTitle()}
						</div>
					</div>
					<div class="panel-heading">
						<h5>작성일</h5>
					</div>
					<div class="panel-body">
						${aa.getRegdate()}
						
					</div>

					<div class="panel-heading">
						<h5>작성자</h5>
					</div>
					<div class="panel-body">
						${aa.getWriter()} 
						
					</div>

					<div class="panel-heading">
						<h5>조회수</h5>
					</div>
					<div class="panel-body">${aa.getReadcount()}</div>
				</div> 
				<div class="article-content">
					${aa.getContent()}
				</div>
				
				<br>
			<p class="article-comment margin-small" align="right">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/freeBoard">목록</a> 
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/freeUpdate/${aa.getBidx()}">수정</a> 
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/freeDel/${aa.getBidx()}">삭제</a>
			</p>
			</div>
			
			
			<div class="container">
			<c:if test="${not empty cwriter}">
			<form action="${pageContext.request.contextPath}/board/commentReg">
			<div>
			<h4>${cwriter}</h4>
			<textarea rows="4" cols="80" name="content"></textarea>
			<button class="btn btn-primary" type="submit">등록</button>
			<input type="hidden" id="bidx" value="${aa.getBidx()}">
			</div>
			</form>
			</c:if>
			
								
														
				
			
			
			<ul class="media-list" style="text-align: left;">
 				<li class="media">
    				<div class="media-left">
      					<a href="#">
        					<img class="media-object" src="..." alt="">
      					</a>
    				</div>
    				<div class="media-body">
    				<div class="row">
    				<div class="col-md-8">
      					<h4 class="media-heading">Media heading</h4>
      					...
      					
      					</div>
      					<div class="col-md-2" style="text-align: right;">
      					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
      					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
      					</div>
      					</div>
    				</div>
  				</li>
			</ul>
			
			</div>

			
			<!-- <div class="margin-small" style="border-top: 1px solid #dfdfdf;">
				<br>
				<dl class="article-detail-row">
					<dt class="article-detail-title">다음글</dt>
					<dd class="article-detail-data">다음 글이 없습니다.</dd>
				</dl>
				<dl class="article-detail-row">
					<dt class="article-detail-title">이전글</dt>
					<dd class="article-detail-data">이전 글이 없습니다.</dd>
				</dl>
			</div> -->




	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script
		src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
>>>>>>> master

