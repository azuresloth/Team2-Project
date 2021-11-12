<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/template/css/menu.css?ver=0">
<script type="text/javascript" src="/resources/template/js/menu.js?ver=38"></script>
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
			          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown" style="z-index: 1001;">
			            <li><a class="dropdown-item" href="/member/goMemberInfo?id=${sessionScope.loginInfo.id }">회원정보수정</a></li>
			            <!-- 로그인한거를 체크하기 위해 기존꺼를 수정 함 -->
			            <!-- <li><a class="dropdown-item" href="/board/personalBoard">게시물 관리</a></li> -->
			            <li><a class="dropdown-item" href="/board/loginCheckForPersonalBoard">게시물 관리</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">추가 예정</a></li>
			          </ul>
			    </li>
				<li><a href="/cart/goOrderLookupPage">주문조회</a></li>
				<li>장바구니</li>
				<c:choose>
					<c:when test="${not empty sessionScope.loginInfo}">
						<li><a href="/member/logout">로그아웃</a></li>
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
		<div class="col text-center titleDiv">
			<button class="titleButton" onclick="location.href='/item/mainPage'">T2 SHOP</button>
			<!-- <img alt="" src="/resources/images/common/titleLogo.png" width="180px"> -->
			<!-- <a class="titleA" href="/item/itemList"><span class="titleSpan">쇼핑몰</span> 타이틀</a> -->
		</div>
	</div>
	<div class="row ">
		<div class="col secondMenuDiv">
			<nav class="navbar navbar-expand-lg navbar-light bg-light menuNavbar">
			  <div class="container-fluid bg-light">
			  	<c:if test="${empty sessionScope.loginInfo or empty menuList }">
				    <a class="navbar" href="/item/bestItemList">BEST ITEM</a>
			  	</c:if>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse mainMenuNavbar bg-light" id="navbarScroll" style="z-index: 1000; padding-left: 1rem;">
			      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
			        <c:choose>
			        	<c:when test="${empty sessionScope.loginInfo or empty menuList }">
			        	<!-- 관리자가 아닐때 -->
			        		<c:if test="${not empty categoryList}">
			        			<c:forEach items="${categoryList}" var="categoryInfo">
			        				<c:if test="${categoryInfo.catePass eq '*Drop' }">
			        					<li class="nav-item dropdown">
								          <a class="nav-link dropdown-toggle active" href="/item/categoryPage?cateCode=${categoryInfo.cateCode}" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								            	${categoryInfo.cateName}
								          </a>
								          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								            <li><a class="dropdown-item" href="#">골드</a></li>
								            <li><a class="dropdown-item" href="#">실버</a></li>
								            <li><hr class="dropdown-divider"></li>
								            <li><a class="dropdown-item" href="#">그외</a></li>
								          </ul>
								        </li>
			        				</c:if>
			        				<c:if test="${categoryInfo.catePass ne '*Drop' }">
			       						<li class="nav-item">
					        				<a class="nav-link active" aria-current="page" href="/item/categoryPage?cateCode=${categoryInfo.cateCode}"> ${categoryInfo.cateName}</a>
					   					</li>
			        				</c:if>
			        			</c:forEach>
			        		</c:if>
				   				<li class="nav-item">
				     				<a class="nav-link active" aria-current="page" href="/board/boardList">커뮤니티</a>
				      			</li>
			        	</c:when>
			        	<c:otherwise>
			        		<c:if test="${not empty menuList }">
				        		<c:forEach items="${menuList}" var="menuInfo">
					        		<li class="nav-item">
					  			        <a class="nav-link active" aria-current="page" href="/admin/${menuInfo.menuPass}?menuCode=${menuInfo.menuCode}">${menuInfo.menuName}</a>
							        </li>
				        		</c:forEach>
				   				<li class="nav-item">
				     				<a class="nav-link active" aria-current="page" href="/board/boardList">커뮤니티</a>
				      			</li>
			        		</c:if>
			        	</c:otherwise>
			        </c:choose>
			      </ul>
			      <form class="d-flex searchArea" id="mainPageSearchForm" action="/item/mainSearchResult" method="post" onsubmit="return false">
			        <input  type="search" placeholder="상품검색" aria-label="" id="mainSearchBar" name="searchValue">
			        <input type="hidden" value="x">
			        <input type="image" src="/resources/images/layout/btn_search.png" id="searchIcon" alt="검색" onclick="mainSearchFun();" >
			      </form>
			    </div>
			  </div>
			</nav>
		</div>
		<div class="col-12 menuBorderDiv"></div>
	</div>
</body>
</html>











