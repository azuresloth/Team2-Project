<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css">

<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/template/css/template.css?ver=1">
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
	
}
body {
  line-height: 1;
  font-family: 'NanumSquareRound'; 
  font-size: 18px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div style="height: 20px;"></div>
	<div class="row" style="margin-bottom: 20px;">
		<div class="col">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
			<tiles:insertAttribute name="side"/>
		</div>
		<div class="col-9">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
</div>
</body>
</html>

















