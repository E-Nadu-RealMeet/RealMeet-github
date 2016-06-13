<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

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
					<td>${aa.getNidx()}</td>
					<td class='c1'><b>질문</b></td>
					<td class='subject'><a href="${pageContext.request.contextPath}/board/freeDetail/${aa.getNidx()}"><b>${aa.getTitle()}</b></a></td>
					<td>${aa.getWriter()}</td>
					<td>${aa.getRegdate()}</td>
				</tr>
				</c:forEach>
				
				<c:forEach var="i" items="${qnalist}">
					<tr>
						<td>${i.qno}</td>
						<td class='c1'>${i.kind }</td>
						<%-- <td class='subject'><c:choose>
								<c:when test="${i.writer.equals(user_id)}">
									<a href="qnahit.do?cmd=qnahit&job=${i.qno}">${i.writer}님의
										${i.kind} 입니다</a>
								</c:when>

								<c:otherwise>
									<span id="other">${i.writer}님의 ${i.kind} 입니다<img
										src="/img/icon_sec.gif" />
									</span>
								</c:otherwise>
							</c:choose></td> --%>
						<td>${i.writer}</td>
						<td>${i.regdate}</td>
						<td></td>
					</tr>
				</c:forEach>

			</table>
			<div class="board_list_button ">
				<a href="${pageContext.request.contextPath}/board/freeReg"  align="right" ><div class="board_button" style="margin-right: 100px;">WRITE</div></a>
			</div>
			<div class="paging_noline">
				<span><a href="javascript:alert('처음페이지입니다.');"><img
						src="${pageContext.request.contextPath}/resources/core/images/pre.gif" border='0' /></a></span>
						<span>1</span>
						<span><a href=>2</a></span>
						<span><a href=>3</a></span>
						<span><a href=>4</a></span>
						<span><a href=>5</a></span>
						<span><a href=>6</a></span>
					<%-- <span><a href=""><img src="${pageContext.request.contextPath}/resources/core/images/nex.gif" border='0'></a></span> --%>
					<span><a href=""><img src="${pageContext.request.contextPath}/resources/core/images/nex.gif" border='0'></a></span>
			</div>
			<form name="searchbbs" action="freeBoard" method="get">
			
				<div class="searchbbs" style="width: 500px; margin-left: 30%">
				<div class="col-sm-3">
					<select name='key' style="height: 50px; font-size:medium;">
						<option ${key=="title"?"selected":""} value='TITLE' >제목</option>
						<option ${key=="writer"?"selected":""} value='WRITER'>작성자</option>
						<option ${key=="content"?"selected":""} value='CONTENT'>내용</option>
					</select> 
					</div>
					<div class="col-sm-8">
					<label class="hidden" for="query"></label>
					<input type="text" name="query" value="${query}" style="height: 18px;">
					</div>
					<input type="image" src="${pageContext.request.contextPath}/resources/core/images/btn_find.gif" value="submit">
				</div>
				
			</form>
		</div>

