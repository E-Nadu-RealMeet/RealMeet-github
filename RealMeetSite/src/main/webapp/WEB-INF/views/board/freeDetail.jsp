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
		href="${pageContext.request.contextPath}/board/freeBoard">목록</a> <a
		class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeUpdate/${aa.getBidx()}">수정</a>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeDel/${aa.getBidx()}">삭제</a>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeReflyReg/${aa.getBidx()}">답글</a>
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
		<form action="../../board/commentReg" method="post">
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>				
					<td class="table-bordered">작성자</td>
					<td class="table-bordered">내용</td>
					<td class="table-bordered">덧글쓰기</td>
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
		</form>
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
				<tr>				
					<td class="table-bordered">작성자</td>
					<td class="table-bordered">내용</td>
					<td class="table-bordered">작성일</td>
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

