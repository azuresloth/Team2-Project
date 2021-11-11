<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/cart/css/order_lookup_page.css?ver=1">
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
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row justify-content-center">
		<div class="col-10 ">
			<div class="row mt-2 justify-content-center">
				<div class="col-12 pageTitleDiv botBorder-1b">
					<h4>주문조회</h4>
				</div>
				<div class="col-12 mt-3 ps-0 pageSubTitleDiv">
					<div class="px-5 pb-1 fs-6 botBorder-ed orderListDiv">주문내역조회</div>
				</div>
				<div class="mt-5 mb-5 border-ed p-4 bg-light">
					<div class="ps-5">
						기간별 조회 :&nbsp;<input class="p-1" type="date" name="startDate">&nbsp;~&nbsp;<input class="p-1" type="date" name="endDate">
						<button class="smallBtn blackButton pt-1 pb-1 ms-1">검 색</button>
					</div>
				</div>
				<div class="text-secondary ps-0 mb-4">주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</div>
			</div>
			<div class="col-12 botBorder-1b">
				<div class="p-4 pb-1">주문 상품 정보</div>
			</div>
			<div class="col-12 pageInfoTableDiv">
				<table class="pageInfoTable text-center">
					<colgroup>
						<col width="200px">
						<col width="120px">
						<col width="auto">
						<col width="95px">
						<col width="105px">
						<col width="120px">
					</colgroup>
					<tr class="fc1b">
						<th>주문일자<br>[주문코드]</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품판매금액</th>
						<th>주문처리상태</th>
					</tr>
					<%-- <c:if test="${not empty lookupList}"> --%>
						<%-- <c:forEach items="${lookupList}" var="lookupInfo">
							<tr>
								<td class="fc66">
									${lookupInfo.buyDate}
									<br>
									<a href="/cart/goOrderDetailPage?orderCode=${lookupInfo.orderCode}" class="fc66">[${lookupInfo.orderCode}]</a>
								</td>
								<td>
									<img alt="" src="/resources/images/item/itemImages/${lookupInfo.attachedImgName}" width="75px;">
								</td>
								<td>${lookupInfo.itemName}</td>
								<td>
									${lookupInfo.buyCnt}개
								</td>
								<td><fmt:formatNumber type="number" value="${lookupInfo.totalPrice}"></fmt:formatNumber>원</td>
								<td>${lookupInfo.buyStatus}</td>
							</tr>
						</c:forEach> --%>
						
						
						<c:forEach items="${orderMap}" var="orderList">
							<%-- ${orderList.value.size() } --%>
							<c:forEach items="${orderList.value }" var="orderInfo" varStatus="status">
								<tr>
									<c:if test="${status.index eq 0 }">
										<td class="fc66" rowspan="${orderList.value.size() }" style="vertical-align: middle;">
											${orderInfo.buyDate}
											<br>
											<a href="/cart/goOrderDetailPage?orderCode=${orderInfo.orderCode}" class="fc66">[${orderInfo.orderCode}]</a>
										</td>
									</c:if>
									<td>
										<img alt="" src="/resources/images/item/itemImages/${orderInfo.attachedImgName}" width="75px;">
									</td>
									<td>${orderInfo.itemName}</td>
									<td>
										${orderInfo.buyCnt}개
									</td>
									<td><fmt:formatNumber type="number" value="${orderInfo.totalPrice}"></fmt:formatNumber>원</td>
									<td>${orderInfo.buyStatus}</td>
								</tr>
							</c:forEach>
						
							<%-- <tr>
								<td class="fc66" colspan="${orderList.size() }">
									${lookupInfo.buyDate}
									<br>
									<a href="/cart/goOrderDetailPage?orderCode=${lookupInfo.orderCode}" class="fc66">[${lookupInfo.orderCode}]</a>
								</td>
								<td>
									<img alt="" src="/resources/images/item/itemImages/${lookupInfo.attachedImgName}" width="75px;">
								</td>
								<td>${lookupInfo.itemName}</td>
								<td>
									${lookupInfo.buyCnt}개
								</td>
								<td><fmt:formatNumber type="number" value="${lookupInfo.totalPrice}"></fmt:formatNumber>원</td>
								<td>${lookupInfo.buyStatus}</td>
							</tr> --%>
						</c:forEach>
						
						
						
					<%-- </c:if> --%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>