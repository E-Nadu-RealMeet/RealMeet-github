<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">


							<header>
								<h2>��������</h2>
							</header>
				


			<table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">
				
				
				<tr>
					<th>����</th>
					<th>${NoticesDetail.title}</th>
				</tr>
				
				<tr>
					<th>�ۼ���</th>
					<th>${NoticesDetail.regdate}</th>
				</tr>
				
					<tr>
					<td>${NoticesDetail.content}</td>
					</tr>
			

			</table>

			<a href="../Notices"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�ڷ�" /></a>
			</div>
					</section>

				
