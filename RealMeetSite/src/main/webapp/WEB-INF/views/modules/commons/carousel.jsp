<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<Html>
<head>
<meta charset='utf-8'>
<title>[bootstrap] 부트스트랩 – 이미지 슬라이딩 [캐러젤(Carousel)]</title>
<script>
    $(document).ready(function() {
        $('#myCarousel').carousel('cycle');
        $('#myCarousel2').carousel('cycle');
    });
</script>
</head>
<body>
<div class="container">
	<h2>캐러젤</h2>
	<hr>
	<div id="myCarousel2" class="carousel slide vertical">
	  <ol class="carousel-indicators">
	    <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel2" data-slide-to="1" class=""></li>
	    <li data-target="#myCarousel2" data-slide-to="2" class=""></li>
	  </ol>
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img data-src="holder.js/2000x500/text:First slide">
	      <div class="carousel-caption">
		<h3>First slide label</h3>
		<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
	      </div>      
	    </div>
	    <div class="item">
	      <img data-src="holder.js/2000x500/text:Second slide">
	      <div class="carousel-caption">
		<h3>Second slide label</h3>
		<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
	      </div>      
	    </div>
	    <div class="item">
	      <img data-src="holder.js/2000x500/text:Third slide">
	      <div class="carousel-caption">
		<h3>Third slide label</h3>
		<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
	      </div>      
	    </div>
	  </div>
	  <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	<hr>
</div>
</body>
</html>