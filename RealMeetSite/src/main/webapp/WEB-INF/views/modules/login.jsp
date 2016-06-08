<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<div>
	<form action="login" method="post">
		<ul>
			<li><label> 아이디&nbsp;&nbsp; <input type="text" size="20" name="mid" value=""></label></li>
			<li><label> 비밀번호 <input type="text" size="20" name="pwd" value=""></label></li>
		</ul>
		<input type="submit" value="로그인" />
	</form>
</div>
