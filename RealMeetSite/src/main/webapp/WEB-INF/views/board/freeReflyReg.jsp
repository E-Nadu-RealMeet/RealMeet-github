<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<div class="container">

	<form action="${pageContext.request.contextPath}/board/freeReflyReg/${aa.getBidx()}" method="post">
	<div class="panel panel-default">
		<table id="boardDetail" class="table table-striped table-hover">
			<thead>
			
				<tr>
					<td class="table-bordered">글번호</td>
					<td>${aa.getBidx()}</td>
					
				</tr>
				<tr>
					<td class="table-bordered">제목</td>
					<td colspan="5" style="padding-right: 5em"><input type="text" name="title" value="${aa.getTitle()}"></td>
				</tr>
				<tr>
					<td class="table-bordered">원문작성자</td>
					<td>${aa.getWriter()}</td>
					<td class="table-bordered">작성자</td>
					<td>${mid}</td>
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
						colspan="6"><textarea rows="10" cols="100" name="content">${aa.getContent()}
--------------------------------------------------------------------------------------------
						</textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
	<input type="hidden" name="blevel" value="${aa.getBlevel()}">
	<input type="hidden" name="writer" value="${mid}">
	<input type="hidden" name="target" value="${aa.getBidx()}">

<p class="article-comment margin-small" align="right">
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/freeBoard">목록</a> 
	
	<button class="btn btn-primary" type="submit">등록</button>
</p>
</form>
	
</div>

