<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				<!-- Portfolio -->
					

							<header>
								<h2>�� ���ǳ���</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>����</th>
					<th>${QNADetail.title}</th>
				</tr>

				
				<tr>
					<th>�ۼ���</th>
					<th>${QNADetail.regdate}</th>
				</tr>
				
					<tr>
					<td colspan="2">${QNADetail.content}</td>
					</tr>
					<tr>
					<td colspan="2">�亯</td>
					</tr>
					
					<tr>
					<td colspan="2">${QNADetail.answer}</td>
					</tr>

			</table>

			<a data-dismiss="modal"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�ڷ�" /></a>
