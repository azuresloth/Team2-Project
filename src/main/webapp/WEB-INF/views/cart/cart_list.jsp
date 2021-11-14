<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/cart/js/cart_list.js?ver=1"></script>
<link rel="stylesheet" href="/resources/cart/css/cart_list.css?ver=1">
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
							> <a href="/cart/goCartList">장바구니</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-10 ">
			<div class="row mt-2 justify-content-center">
				<div class="col-12 botBorder-1b pageTitleDiv">
					<h4>장바구니</h4>
				</div>
				<div class="col-12 mt-3 ps-0 pageSubTitleDiv">
					<div class="px-5 pb-1 fs-6 botBorder-ed orderListDiv">장바구니 목록</div>
				</div>
				
				<div class="col-12 pageInfoTableDiv">
					<table class="pageInfoTable text-center" style="border-top: none;">
						<colgroup>
							<col width="50px">
							<col width="110px">
							<col width="auto">
							<col width="120px">
							<col width="150px">
							<col width="105px">
							<col width="120px">
							<col width="120px">
						</colgroup>
						<tr>
							<th><input type="checkbox" id="motherBox" class="motherBox"><input type="hidden" id="id" name="id" value="${sessionScope.loginInfo.id}"></input></th>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>배송비</th>
							<th>합계</th>
							<th>선택</th>
						</tr>
						<c:if test="${not empty cartList}">
							<c:forEach items="${cartList}" var="cartInfo">
								
							
							<tr>
								<td>
									<input type="checkbox" class="childBox" value="${cartInfo.itemCode}">
									<input type="hidden" name="itemCode" value="${cartInfo.itemCode}">
								</td>
								<td>
									<img alt="" src="/resources/images/item/itemImages/${cartInfo.attachedImgName}" width="75px;">
									<input type="hidden" name="attachedImgName" value="${cartInfo.attachedImgName}">
								</td>
								<td>${cartInfo.itemName}</td>
								<td><fmt:formatNumber type="number" value="${cartInfo.itemPrice}"></fmt:formatNumber>원</td>
								<td style="vertical-align: middle">
									<input type="number" name="buyCnt" value="${cartInfo.itemCnt}" min="0" max="${cartInfo.itemStock}" style="widows: 40px;'">개
									<button class="button blackButton smallBtn mb-0" style="height: 30px; width: 50px;">변경</button>
								</td>
								<td>[무료]</td>
								<td>
									<fmt:formatNumber type="number" value="${cartInfo.totalPrice}"></fmt:formatNumber>원
									<input type="hidden" name="totalPrice" value="${cartInfo.totalPrice}">
								</td>
								<td>
									<button type="button" class="btn btn-outline-secondary btn-sm checkDeleteBtn text-light bg-secondary deleteBtn">삭제하기</button>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="col-12 checkDeleteDiv mt-2">
					<strong>선택상품 </strong><button type="button" class="btn btn-outline-secondary btn-sm checkDeleteBtn" onclick="checkedDelete();">삭제하기</button>
				</div>
				<div class="my-3"></div>
				<div class="col-12 buyTotalPriceTitle">
					<span>결제 예정 금액</span>
				</div>
				<div class="col-12 buyTotalPriceTableDiv">
					<table class="buyTable text-center">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<tr>
							<th>총 주문 금액</th>
							<th>결제</th>
						</tr>
						<tr>
							<td>
								<span>
									<c:if test="${not empty cartList}">
										<fmt:formatNumber type="number" value="${cartAllTotalPrice}"></fmt:formatNumber>원
									</c:if>
									<input type="hidden" name="allTotalPrice" id="allTotalPrice" value="${cartAllTotalPrice}">
									<input type="hidden" name="orderCode" id="orderCode" value="0">
								</span>
							</td>
							<td>
								<button type="button" class="button blackButton2 btn_payment" onclick="location.href='/cart/goPurchasePage?requestURI=${requestURI}'">전체상품 주문</button>
								<button type="button" class="button whiteButton" style="" onclick="testPay();">선택상품 주문</button>
							</td>
						</tr>
					</table>
				</div>
				
				
				<div class="my-4"></div>
				<div class="itemBannerTitle bgi2">
					BEST ITEM
				</div>
					
				<div class="container-fluid mainRow">		
					<div class="row">
						<div class="col-12">
							<!-- Swiper -->
							<div class="swiper itemSwiper">
								<div class="swiper-wrapper">
									<c:forEach items="${bestItemList}" var="bestItemInfo">
										<div class="swiper-slide">
											<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}&cateCode=${bestItemInfo.cateCode}"><img src="/resources/images/item/itemImages/${bestItemInfo.imgList[0].attachedImgName}"></img></a>
											<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}&cateCode=${bestItemInfo.cateCode}">${bestItemInfo.itemName}</a>
											<div>${bestItemInfo.itemPrice}</div>
										</div>
									</c:forEach>
								</div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>

</body>

<script>

	var swiper = new Swiper(".itemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		autoplay : {
			delay : 2000,
			disableOnInteraction : true,
			loop : true,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		breakpoints : {
			640 : {
				slidesPerView : 2,
				spaceBetween : 20,
			},
			768 : {
				slidesPerView : 4,
				spaceBetween : 40,
			},
			1024 : {
				slidesPerView : 5,
				spaceBetween : 50,
			},
		},
	});
</script>
</html>