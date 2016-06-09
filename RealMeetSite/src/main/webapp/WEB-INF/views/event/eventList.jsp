<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <script	src="${pageContext.request.contextPath}/resources/core/js/event/eventList.js?ver=1" type="text/javascript"></script> --%>
<div class="container" id="container">
	<div style="max-width: 1000px; padding: 10px; margin: 10px auto;">
		<div>
			<!-- <div class="dropdown">
						<button class="btn btn-default dropdwon-toggle" type="button" id="dr1" data-toggle="dropdown" aria-expanded="true">
							DropDown
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dr1" style="margin: 0 auto;">
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
						 </ul>
					</div> -->
		</div>

		<button class="btn btn-lg btn-success" type=button>날짜별</button>
		<button class="btn btn-lg" type=button>이름별</button>
		<button class="btn btn-lg btn-success" type=button>지역별</button>
	</div>
</div>
