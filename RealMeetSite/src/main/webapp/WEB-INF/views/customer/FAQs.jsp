<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">

							<header>
								<h2>FAQ</h2>
							</header>
							
  
  <table border="1" style="width: 75%; text-align: center; margin-left: 12.5%; background-color: white;">

				<tr>
					<th style="text-align: center;">��ȣ</th>
					<th style="text-align: center;">����</th>
					<th style="text-align: center;">�ۼ���</th>
				</tr>


				<c:forEach var="FAQs" items="${FAQs}">
					<tr>
						<td>${FAQs.fidx}</td>
						<td><a href="FAQsDetail/${FAQs.fidx}">${FAQs.title}</a></td>
						<td>${FAQs.regdate}</td>
					</tr>
				</c:forEach>

			</table>
				<form method="get" action="FAQs/${title}">
				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="����" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�˻�" /></div>
				</form>
				<a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�ڷ�" /></a>
		</div>
  
  
			
					</section>

				

		