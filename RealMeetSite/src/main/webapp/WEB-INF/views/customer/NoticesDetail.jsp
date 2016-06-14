<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%> 
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/customer.css" /> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/Detail.css" /> --%>



							<header>
								<h2>공지사항</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${NoticesDetail.title}</th>
				</tr>
				
				<tr>
					<th>작성일</th>
					<th>${NoticesDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${NoticesDetail.content}</td>
					</tr>
			

			</table>

			<a data-dismiss="modal" data-target="#NoticesModalDetail"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="뒤로" /></a>

