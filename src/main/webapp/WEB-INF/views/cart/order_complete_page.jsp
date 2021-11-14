<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/cart/css/order_complete_page.css?ver=0">
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
							> <a>주문완료</a>
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
					<h4>주문완료</h4>
				</div>
				<div class="col-12 text-center justify-content-center orderCompleteDiv">
					<div class="thankDiv">주문해 주셔서 감사합니다.</div>
					<div class="little mt-2">주문내역에 관한 안내는 <a>주문조회</a>를 통하여 확인 가능합니다.</div>
					<div class="little mt-4">주문코드 : <strong class="little">${sessionScope.nowBuyInfo.orderCode}</strong></div>
					<div class="little">주문일자 : <strong class="little">${sessionScope.nowBuyInfo.buyDate}</strong></div>
				</div>
				<div class="col-12 purchaseInfoTitle">
					<span class="lpSpan">결제 정보</span>
				</div>
				<div class="col-12 pageInfoTable2Div">
					<table class="pageInfoTable2">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<tr>
							<th>최종결제금액</th>
							<td><fmt:formatNumber type="number" value="${sessionScope.nowBuyInfo.allTotalPrice}"></fmt:formatNumber>원</td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td>
								<div class="little">카드</div>
								<div class="little">구매자 : ${sessionScope.loginInfo.name}</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="col-12 purchaseInfoTitle">
					<span class="lpSpan">주문 상품 정보</span>
				</div>
				<div class="col-12 purInfoTableDiv">
					<table class="pageInfoTable text-center">
						<colgroup>
							<col width="110px">
							<col width="auto">
							<col width="120px">
							<col width="95px">
							<col width="105px">
							<col width="120px">
						</colgroup>
						<tr>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
						<c:if test="${not empty sessionScope.nowBuyInfo}">
							<tr>
								<td>
									<img alt="" src="/resources/images/item/itemImages/${sessionScope.nowBuyInfo.attachedImgName}" width="75px;">
								</td>
								<td>${nowBuyList[0].itemName}</td>
								<td><fmt:formatNumber type="number" value="${sessionScope.nowBuyInfo.totalPrice / sessionScope.nowBuyInfo.buyCnt}"></fmt:formatNumber>원</td>
								<td>
									${sessionScope.nowBuyInfo.buyCnt}개
								</td>
								<td>[무료]</td>
								<td>
									<fmt:formatNumber type="number" value="${sessionScope.nowBuyInfo.totalPrice}"></fmt:formatNumber>원
								</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="col-12 buyTotalPriceTitle">
					<span>결제 금액</span>
				</div>
				<div class="col-12 buyTableDiv">
					<table class="buyTable text-center">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<tr>
							<th>총 주문 금액</th>
							<th>총 결제 금액</th>
						</tr>
						<tr>
							<td>
								<span>
									<fmt:formatNumber type="number" value="${sessionScope.nowBuyInfo.allTotalPrice}"></fmt:formatNumber>원
									<input type="hidden" name="allTotalPrice" id="allTotalPrice" value="${sessionScope.nowBuyInfo.allTotalPrice}">
									<input type="hidden" name="orderCode" id="orderCode" value="0">
								</span>
							</td>
							<td>
									<fmt:formatNumber type="number" value="${sessionScope.nowBuyInfo.allTotalPrice}"></fmt:formatNumber>원
							</td>
						</tr>
					</table>
				</div>
				
				<div class="col-12 deliveryInfoTitle">
					<span>배송정보</span><span class="requiredCheckSpan"></span>
				</div>
				<div class="col-12 pageInfoTable2Div">
					<table class="pageInfoTable2">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<tr>
							<th>받으시는 분</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryName}
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								${sessionScope.nowBuyInfo.postCode}
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								${sessionScope.nowBuyInfo.roadAddr} ${sessionScope.nowBuyInfo.detailAddr}
							</td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryTell}
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryEmail}
							</td>
						</tr>
						<tr>
							<th>배송메세지</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryMsg}
							</td>
						</tr>
					</table>
					<div class="f-right mt-2">
						<button class="button whiteButton smallBtn" onclick="location.href='/item/mainPage'">쇼핑 계속하기</button>
						<button class="button blackButton smallBtn" onclick="location.href='/cart/goOrderLookupPage'">주문 확인하기</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>