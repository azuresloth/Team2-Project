<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/item_detail.css?ver=2">
<script type="text/javascript" src="/resources/item/js/item_detail.js?ver=3"></script>
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							> <a href="/item/categoryPage?cateCode=${pathInfo.cateCode}">${pathInfo.cateName }</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-2 justify-content-center">
		<div class="col-5">
			<!-- Swiper -->
		    <div class="swiper itemImg">
		      <div class="swiper-wrapper">
		      	<c:forEach items="${itemInfo.imgList}" var="imgInfo">
			        <div class="swiper-slide"><img src="/resources/images/item/itemImages/${imgInfo.attachedImgName}" width="100%;"></img></div>
		      	</c:forEach>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		</div>
		
		
		<div class="col-5 itemInfoDiv">
		<form action="" method="post" onsubmit="return false" id="itemForm">
			<div class="col-12 nameDiv">
				<h2>${itemInfo.itemName}</h2>
				<input type="hidden" name="itemCode" value="itemInfo.itemName">
			</div>
			<div class="col-12 priceDiv">
				<input type="hidden" id="itemPrice" value="${itemInfo.itemPrice}">
				<span class="priceSpan"><fmt:formatNumber type="number" value="${itemInfo.itemPrice}"></fmt:formatNumber>원</span>
			</div>
			<div class="col-12 ">
				<table class="deliveryTable">
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>배송방법</th>
							<td>택배</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-12 introDiv">
				<span class="introSpan">${itemInfo.itemIntro}</span>
			</div>
			<div class="col-12 itemCntDiv">
				<div class="cntDiv">
					수량
				</div>
				<table class="cntTable">
					<colgroup>
						<col width="60%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tr>
						<td>
							<p>${itemInfo.itemName}</p>
						</td>
						<td class="itemCnt">
							<input class="itemCnt" id="cnt" type="number" min="0" max="${itemInfo.itemStock}" value="1" name="itemCnt">개
						</td>
						<td class="itemCnt right">
							<span class="priceCnt">
								<span id="cntPrice"><fmt:formatNumber type="number" >${itemInfo.itemPrice}</fmt:formatNumber></span>원
							</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-12 totalPriceDiv">
				<strong>합계 금액</strong>
				<span class="totalPriceSpan">
					<span id="totalPrice" class="totalPrice"><strong><strong id="totalPrice"><fmt:formatNumber type="number" >${itemInfo.itemPrice}</fmt:formatNumber></strong></strong></span><strong>원</strong>
					<span class="totalCnt">(<strong id="totalCnt">1</strong>)개</span>
				</span>
			</div>
			<div class="col-12 justify-content-center text-center mt-2">
				<button type="button" class="btn btn-outline-warning btn-lg cartBtn" onclick="goCartBtn();">장바구니 추가</button>
				<button type="button" class="btn btn-outline-secondary btn-lg directBtn" onclick="goDirectBtn();">바로구매</button>
			</div>
			</form>
		</div>
	</div>
</body>
 <script>
      var swiper = new Swiper(".itemImg", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</html>