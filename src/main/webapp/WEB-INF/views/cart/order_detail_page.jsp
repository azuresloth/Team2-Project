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
					<c:forEach items="${orderList}" var="orderInfo" begin="0" end="0">
						<div>${orderInfo.itemName}안녕${orderInfo.itemCode}</div>
					</c:forEach>
				</div>
				<div class="col-12 pageInfoTable2Div">
					<table class="pageInfoTable2">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<tr>
							<th>주문번호</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryName}
							</td>
						</tr>
						<tr>
							<th>주문일자</th>
							<td>
								${sessionScope.nowBuyInfo.postCode}
							</td>
						</tr>
						<tr>
							<th>주문자</th>
							<td>
								${sessionScope.nowBuyInfo.roadAddr} ${sessionScope.nowBuyInfo.detailAddr}
							</td>
						</tr>
						<tr>
							<th>주문처리상태</th>
							<td>
								${sessionScope.nowBuyInfo.deliveryTell}
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