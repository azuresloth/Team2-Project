<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/template/css/menu.css?ver=2">
<script type="text/javascript" src="/resources/template/js/menu.js?ver=2"></script>
</head>
<body>
	<div class="row">
		<div class="col text-end firstMenuDiv">
			<ul class="firstMenuUl text-end">
				<li><a href="/board/boardList">고객센터</a></li>
				<li class="nav-item dropdown">
			          <a class=" dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            마이페이지
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
			            <li><a class="dropdown-item" href="#">회원정보</a></li>
			            <li><a class="dropdown-item" href="#">게시물 관리</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">그외 추가 자리</a></li>
			          </ul>
			    </li>
				<li>마이페이지</li>
				<li>주문조회</li>
				<li>장바구니</li>
				<c:choose>
					<c:when test="${not empty sessionScope.loginInfo}">
						<li>로그아웃</li>
						<li>${sessionScope.loginInfo.name}님</li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/goJoin">회원가입</a></li>
						<li><a href="/member/goLogin">로그인</a></li> 
					</c:otherwise>
				</c:choose>
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y'}">
					<li><a href="/admin/adminMenu">관리자 메뉴</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<button class="titleButton" onclick="location.href='/item/itemList'">T2 SHOP</button>
			<!-- <img alt="" src="/resources/images/common/titleLogo.png" width="180px"> -->
			<!-- <a class="titleA" href="/item/itemList"><span class="titleSpan">쇼핑몰</span> 타이틀</a> -->
		</div>
	</div>
	<div class="row">
		<div class="col secondMenuDiv">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 2rem;">
			  <div class="container-fluid bg-light">
			    <a class="navbar" href="/item/newItemList">NEW ITEM</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarScroll">
			      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
			        <c:forEach items="" var="">
			        
			        </c:forEach>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#"> 목걸이</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="#">귀걸이</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle active" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            금속류
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
			            <li><a class="dropdown-item" href="#">골드</a></li>
			            <li><a class="dropdown-item" href="#">실버</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">그외</a></li>
			          </ul>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active">잡화</a>
			        </li>
			      </ul>
			      <form class="d-flex searchArea">
			        <input  type="search" placeholder="" aria-label="">
			        <input type="image" src="/resources/images/layout/btn_search.png" alt="검색" >
			      </form>
			    </div>
			  </div>
			</nav>
		</div>
	</div>
</body>
</html>











