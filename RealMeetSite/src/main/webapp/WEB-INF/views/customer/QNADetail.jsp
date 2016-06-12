<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				<!-- Portfolio -->
					

							<header>
								<h2>내 문의내역</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>제목</th>
					<th>${QNADetail.title}</th>
				</tr>

				
				<tr>
					<th>작성일</th>
					<th>${QNADetail.regdate}</th>
				</tr>
				
					<tr>
					<td colspan="2">${QNADetail.content}</td>
					</tr>
					<tr>
					<td colspan="2">답변</td>
					</tr>
					
					<tr>
					<td colspan="2">${QNADetail.answer}</td>
					</tr>

			</table>

			<a data-dismiss="modal"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="뒤로" /></a>
