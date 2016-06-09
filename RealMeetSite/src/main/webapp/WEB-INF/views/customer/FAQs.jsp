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
					<th style="text-align: center;">锅龋</th>
					<th style="text-align: center;">力格</th>
					<th style="text-align: center;">累己老</th>
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
				<div class="4u" align="center"><input style="margin-left: 100%;" type="text" name="title" placeholder="力格" /><input style="margin-left:100%; padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="八祸" /></div>
				</form>
				<a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="第肺" /></a>
		</div>
  
  
			
					</section>

				

		