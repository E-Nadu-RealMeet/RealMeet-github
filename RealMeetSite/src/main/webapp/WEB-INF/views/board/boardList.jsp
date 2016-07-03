<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
	<div class="container">
			<table  class="table table-striped table-bordered">
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width=""/>
					<col width="100" />
					<col width="160" />
				</colgroup>
				<thead>
				<tr class="success">
					<th style="text-align: center;">NO</th>
					<th style="text-align: center;">CATEGORY</th>
					<th style="text-align: center;">SUBJECT</th>
					<th style="text-align: center;">WRITER</th>
					<th style="text-align: center;">DATE</th>
				</tr>
				</thead>
				<c:forEach var="aa" items="${list}">
					<tr>
						<td>${aa.getBidx()}</td>
						<td class='c1'><b>질문</b></td>
						<td class='subject'><a href="${pageContext.request.contextPath}/board/boardDetail/${aa.getBidx()}?kind=${kind}"><b>${aa.getTitle()}<c:out value="[${aa.getCommentCnt()}]"></c:out></b></a></td>
						<td>${aa.getWriter()}</td>
						<td>${aa.getRegdate()}</td>
					</tr>
				</c:forEach>
				
				

			</table>
			
			<div class="paging_noline">
			
			<!-- 1페이지 아닌경우 preview 이미지 보이기 -->
				<c:if test="${pages != 1}">
				<span><a href="freeBoard?pages=${pages-1}"><img
						src="${pageContext.request.contextPath}/resources/core/images/pre.gif" border='0' /></a></span>
						</c:if>
						<!-- <span>1</span>
						<span><a href=>2</a></span>
						<span><a href=>3</a></span>
						<span><a href=>4</a></span>
						<span><a href=>5</a></span>
						<span><a href=>6</a></span> -->
					<c:forEach var="i" begin="0" end="${endPageNum}">
                        
                        <c:if test="${startPageNum+i <= endPageNum}">
                       		<c:if test="${startPageNum+i == pages }">
                       			<span><a class="strong" href="freeBoard?pages=${startPageNum+i}&field=${field}&query=${query}">${startPageNum+i}</a></span>
                     		</c:if>
                        	
                        	<a href="freeBoard?pages=${startPageNum+i}&field=${field}&query=${query}">${startPageNum+i}</a>
                        </c:if>
                        
                  </c:forEach>
					<span><a href=""><img src="${pageContext.request.contextPath}/resources/core/images/nex.gif" border='0'></a></span>
			</div>
			<div style="float:left;width: 100%;">
			<div class="board_list_search">
			<form name="searchbbs" action="freeBoard" method="get">
			
				<div class="searchbbs">
				<div class="col-sm-3">
					<select name='key' style="height: 50px; font-size:medium;">
						<option ${key=="title"?"selected":""} value='TITLE' >제목</option>
						<option ${key=="writer"?"selected":""} value='WRITER'>작성자</option>
						<option ${key=="content"?"selected":""} value='CONTENT'>내용</option>
					</select>
					</div>
					<div class="col-sm-8">
					<label class="hidden" for="query"></label>
					<input type="text" id="query" name="query" value="${query}" style="height: 18px;">
					</div>
					<input type="image" src="${pageContext.request.contextPath}/resources/core/images/btn_find.gif" value="submit">
				</div>
				
			</form>
			</div>
			<div class="board_list_button ">
				<button onclick="window.location.href='${pageContext.request.contextPath}/board/boardReg?kind=${kind}'" style="float:right;">WRITE</button>
				
			</div>
			</div>
		</div>

