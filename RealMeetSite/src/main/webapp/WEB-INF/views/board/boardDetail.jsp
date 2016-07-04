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

<p class="article-comment margin-small" align="right">
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeBoard">목록</a> 
	<c:if test="${aa.getWriter()==mid}">
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/boardUpdate/${aa.getBidx()}?bWriter=${aa.getWriter()}&kind=${kind}">수정</a>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/board/boardDel/${aa.getBidx()}?bWriter=${aa.getWriter()}&kind=${kind}">삭제</a>
	</c:if>
	<%-- <a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeReflyReg/${aa.getBidx()}">답글</a> --%>
</p>
	<div class="panel panel-default">
		<table id="boardDetail" class="table">
			<tbody>
				<tr>
					<td class="table-bordered">이전글</td>
					<c:if test="${prev != null }">
						<td class="table-bordered"><a href="${pageContext.request.contextPath}/board/boardDetail/${prev.getBidx()}">${prev.getTitle() }</a></td>
					</c:if>
					<c:if test="${prev == null }">
						<td class="table-bordered">이전 글이 없습니다.</td>
					</c:if>
				</tr>
				<tr>
					<td class="table-bordered">다음글</td>
					<c:if test="${next != null }">
						<td class="table-bordered"><a href="${pageContext.request.contextPath}/board/boardDetail/${next.getBidx()}">${next.getTitle() }</a></td>
					</c:if>
					<c:if test="${next == null }">
						<td class="table-bordered">다음 글이 없습니다.</td>
					</c:if>
				</tr>
			</tbody>
		</table>
		<form action="../../board/commentReg" method="post">
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>
					<td colspan="3"><span style="font-weight: bold; font-size:130%">덧글 쓰기</span></td>
				</tr>
				<tr>				
					<td class="table-bordered" style="width: 10em;">작성자</td>
					<td class="table-bordered">내용</td>
					<td class="table-bordered" style="width: 10em;">덧글쓰기</td>
				</tr>
			</thead>
			<tbody class="table-condensed">
				<tr>
					<td class="table-bordered"><input type="text" name="cwriter" id="mid" value="${mid}" readonly="readonly" style=""></td>
					<td class="table-bordered"><input type="text" name="ccomment" id="comment-content"style="width:90%;line-height: 1em;"/></td>
					<td class="table-bordered" id="tdWrite"><button type="submit" id="comment-write"style="padding: 0.5em 2em 0.5em 2em;">Write</button></td>
				</tr>
			</tbody>			
		</table>
		<input type="hidden" name="bidx" value="${aa.getBidx()}">
		<input type="hidden" name="kind" value="${kind}">
		</form>
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>
					<td colspan="3"><span style="font-weight: bold; font-size:130%">덧글 리스트</span></td>
				</tr>
				<tr>				
					<td class="table-bordered" style="width: 10em;">작성자</td>
					<td class="table-bordered">내용</td>
					<td class="table-bordered" style="width: 10em;">작성일</td>
				</tr>
			</thead>
			<tbody class="table-condensed">
				<c:forEach var="c" items="${clist}" varStatus="status">
				<tr>
					<td class="table-bordered"><c:out value="${c.getCwriter() }"></c:out></td>
					<td class="table-bordered"><c:out value="${c.getCcomment() }"></c:out></td>
					<td class="table-bordered"><c:out value="${c.getRegdate() }"></c:out></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${cStartNum!=1}">
			<a href="${aa.getBidx()}?cCurrPage=${cStartNum-5}&cStartNum=${cStartNum-5}&field=${field}&query=${query}"">
			<img src="/RealMeetSite/resources/core/images/pre.gif" border="0">
			</a>
		</c:if>
		<c:forEach var="i" begin="${cStartNum}" end="${cEndNum}">
       		<c:choose>
       			<c:when test="${i == cCurrPage}">
       				<span><a class="strong" href="${aa.getBidx()}?cCurrPage=${i}&cStartNum=${cStartNum}&field=${field}&query=${query}">${i}</a></span>
       			</c:when>
       			<c:otherwise>
       				<a href="${aa.getBidx()}?cCurrPage=${i}&cStartNum=${cStartNum}&field=${field}&query=${query}">${i}</a>
       			</c:otherwise>
       		</c:choose>
      	</c:forEach>
    	<c:if test="${sumCommentPage > cEndNum}">
    		<a href="${aa.getBidx()}?cCurrPage=${cStartNum+5}&cStartNum=${cStartNum+5}&field=${field}&query=${query}">
      		<img src="/RealMeetSite/resources/core/images/nex.gif" border="0">
      		</a>
    	</c:if>
	</div>
</div>

