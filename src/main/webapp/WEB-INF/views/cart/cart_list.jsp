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
							<col width="95px">
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
								<td>
									${cartInfo.itemCnt}개
									<input type="hidden" name="buyCnt" value="${cartInfo.itemCnt}">
								</td>
								<td>[무료]</td>
								<td>
									<fmt:formatNumber type="number" value="${cartInfo.totalPrice}"></fmt:formatNumber>원
									<input type="hidden" name="totalPrice" value="${cartInfo.totalPrice}">
								</td>
								<td>
									<button type="button" class="btn btn-outline-secondary btn-sm checkDeleteBtn" onclick="checkedDelete();">삭제하기</button>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>