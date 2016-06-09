<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


						<section id="portfolio" class="two">
						<div class="container">
							<header>
								<h2>문의하기</h2>
							</header>

<!-- 문의하기 기본 뷰 -->
							<form method="post" action="insertQNA">
								<div class="row">
									<div class="11u" style="margin-left: 2%"><input type="text" name="title" placeholder="제목" /></div>
									<div class="11u$" style="margin-left: 2%">
										<textarea name="content" placeholder="내용"></textarea>
									</div>
									<div class="11u$" style="margin-left: 2%">
										<input style="padding: 0.5em 2.0em 0.5em 2.0em;" type="submit" value="문의" />
									</div>
								</div>
							</form>
		
			
		</div>
  
  
			
					</section>
					

				
