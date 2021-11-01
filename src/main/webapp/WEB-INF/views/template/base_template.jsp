<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css?ver=1">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<!-- 아이콘을 위한 링크 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 슬라이드 배너 사용을 위한 링크 -->
<link  rel="stylesheet"  href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<style type="text/css">
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.aaa{
	background-color: aqua;
}
.container-fluid{
	width: 90%;
	margin-top: 20px;
	margin-bottom: 20px;
}
body {
	font-family: 'NanumSquareRound';
	}
.path{
	overflow: left;
    height: 30px;
    line-height: 30px;
    padding: 15px 0 10px;
    color: #333333;
}
.path ol{
	float: left;
}
.path li{
	display: inline-block;
}
.path a{
	text-decoration: none;
    color: #666666;
}
.warning{
	color: #008bcc;
}
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.blackButton, .blackButton2 {
  background-color: #555555;
  color: white;
  border: 2px solid white;
}

.blackButton:hover {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
.blackButton2:hover {
  color: black;
  border: 2px solid #555555;
}


.submitButton{
	display: table;
	margin: 20px auto;
	width: 10rem;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-12">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
<div class="container-fluid">
	<div class="row" style="padding-top: 10px;">
		<div class="col">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
</div>
	<div class="row">
		<div class="col-12">
			<tiles:insertAttribute name="foot"/>
		</div>
	</div>
</body>
</html>

















