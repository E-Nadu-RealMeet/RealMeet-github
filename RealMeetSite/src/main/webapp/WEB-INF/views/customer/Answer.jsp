<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/customer.css" />



							<header>
								<h2>�亯�ϱ�</h2>
							</header>
							
							<h3>�亯�� �Խù� : ${QNADetail.title}</h3>
								
					
							<form action="addAnswer" method="post">
									<div class="11u$" style="margin-left: 4%">
										<textarea name="answer" placeholder="�亯����"></textarea>
									</div>
									
									<div class="11u$" style="margin-left: 4%">
										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�亯" />
										<input type="hidden" name="qidx" value="${QNADetail.qidx}">
									</div>
							</form>
		