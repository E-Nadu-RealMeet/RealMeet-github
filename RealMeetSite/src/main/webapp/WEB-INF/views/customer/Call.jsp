<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Prologue by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/main.css" /> --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/customer.css" /> 		
		<script src="${pageContext.request.contextPath}/resources/core/js/customer.js" type="text/javascript"></script>
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>




		<!-- Main -->
		

				<!-- Portfolio -->
					
						
	<div class="modal"></div>
  <div class="modal-content">
  <span class="close">��</span>
							<header>
								<h2>�����ϱ�</h2>
							</header>

<!-- �����ϱ� �⺻ �� -->
							<form method="post" action="insertQNA">
								<div class="row">
									<div class="11u" style="margin-left: 2%"><input type="text" name="title" placeholder="����" /></div>
									<div class="11u$" style="margin-left: 2%">
										<textarea name="content" placeholder="����"></textarea>
									</div>
									<div class="11u$" style="margin-left: 2%">
										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="����" />
									</div>
								</div>
							</form>
				<a href="${pageContext.request.contextPath}/customer/customer"><input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="�ڷ�" /></a>
				</div>
		
					

				


		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/jquery.scrollzer.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/core/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>






			
			
			
			
			
</body>
</html>