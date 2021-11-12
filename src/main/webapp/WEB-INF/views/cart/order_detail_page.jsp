<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							> <a href="/cart/goOrderLookupPage">주문조회</a>
						</li>
						<li>
							> <a href="/cart/goOrderDetailPage">주문상세조회</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-10 ">
			<div class="row mt-2 justify-content-center">
				<div class="col-12 pageTitleDiv botBorder-1b">
					<h4>주문상세조회</h4>
				</div>
				<div class="col-12 mt-3 px-0 pageSubTitleDiv">
					<div class="px-2 pb-1 fs-6 fc1b">주문정보</div>
				</div>
				<div class="col-12 pageInfoTable2Div">
					<table class="pageInfoTable2">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<c:forEach items="${orderList}" var="orderInfo" begin="0" end="0">
							<tr>
								<th>주문번호</th>
								<td>
									${orderInfo.orderCode}
								</td>
							</tr>
							<tr>
								<th>주문일자</th>
								<td>
									${orderInfo.buyDate}
								</td>
							</tr>
							<tr>
								<th>주문자</th>
								<td>
									${sessionScope.loginInfo.id}
								</td>
							</tr>
							<tr>
								<th>주문처리상태</th>
								<td>
									${orderInfo.buyStatus}
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-12 mt-4 px-0 pageSubTitleDiv">
					<div class="px-2 pb-1 fs-6 fc1b">결제정보</div>
				</div>
				<div class="col-12 pageInfoTable2Div">
					<table class="pageInfoTable2">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<c:forEach items="${orderList}" var="orderInfo" begin="0" end="0">
						<tr>
							<th>총 결제금액</th>
							<td>
								<fmt:formatNumber type="number" value="${orderInfo.allTotalPrice}"></fmt:formatNumber>원
							</td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td>
								${orderInfo.paymentPlan}
							</td>
						</tr>
						</c:forEach>
						<c:forEach items="${orderList}" var="orderInfo" begin="0" end="0">
						
						</c:forEach>
					</table>
				</div>
				
				<div class="col-12 mt-4 px-0 pageSubTitleDiv">
					<div class="px-2 pb-1 fs-6 fc1b">주문 상품 정보</div>
				</div>
				<div class="col-12 pageInfoTableDiv">
					<table class="pageInfoTable text-center" style="border-top: none;">
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
							<th>수량</th>
							<th>판매가</th>
							<th>배송비</th>
							<th>주문처리상태</th>
						</tr>
						<c:forEach items="${orderList}" var="orderInfo">
							<tr>
								<td>
									<img alt="" src="/resources/images/item/itemImages/${orderInfo.attachedImgName}" width="75px;">
								</td>
								<td>${orderInfo.itemName}</td>
								<td>
									${orderInfo.buyCnt}개
								</td>
								<td><fmt:formatNumber type="number" value="${orderInfo.totalPrice}"></fmt:formatNumber>원</td>
								<td>[무료]</td>
								<td>
									${orderInfo.buyStatus}
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
			
			<div class="f-right mt-2">
						<button class="button whiteButton smallBtn" onclick="location.href='/item/mainPage'">쇼핑 계속하기</button>
						<button class="button blackButton smallBtn" onclick="location.href='/cart/goOrderLookupPage'">주문 확인하기</button>
					</div>
		</div>
	</div>
	<c:forEach items="${orderList}" var="orderInfo" begin="0" end="0">
						<div>${orderInfo.itemName}안녕${orderInfo.itemCode}</div>
					</c:forEach>
</body>
</html>