<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding= "UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 로그인 창</title >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/core/css/login.css" />
<script src="${pageContext.request.contextPath}/resources/core/js/login.js" type="text/javascript"></script>
</head>
<body>
<div class="modal-content">
     <form action="login" method ="post">
     <ul >
           <li>
               <label> 아이디&nbsp;&nbsp; <input type = "text" size ="20" name="mid" value= ""></label >
           </li>
           <li>
               <label> 비밀번호 <input type = "text" size="20" name="pwd" value= ""></label >
           </li>
     </ul >
           <input type= "submit" value ="로그인" />
     </form >
   </div>  
</body>
</html>
