<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	
				<!-- Portfolio -->
					

							<header>
								<h2>FAQ</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>����</th>
					<th>${FAQsDetail.title}</th>
				</tr>

				
				<tr>
					<th>�ۼ���</th>
					<th>${FAQDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${FAQsDetail.content}</td>
					</tr>
			

			</table>

			<a data-dismiss="modal"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�ڷ�" /></a>


				

		