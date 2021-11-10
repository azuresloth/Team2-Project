<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript" src="/resources/admin/month_sales.js?ver=11"></script>
<style type="text/css">
.myContainer{
   	background-color: #fba062;
   	border-radius: 6px;
   	padding: 16px;
   	a
}
.pagination{
	margin: 0 auto;
	text-align: center;
}
.totalPriceDiv{
	margin: 0 auto;
}
</style>
</head>
<body>
<form action="/admin/selectMonthSales" method="post">
	<div class="container myContainer">
		<div class="row">
			<div class="col-2 text-center d-flex justify-content-center">
				<span class="align-self-center">날짜검색</span> 
			</div>
			<div class="col-3 d-flex justify-content-start">
				<input type="date" id="startDate" class="form-select" name="startDate" value="${param.startDate }">
			</div>
			<div class="col-3 d-flex justify-content-start">
				<input type="date" id="endDate" class="form-select" name="endDate" value="${param.endDate }">
			</div>
			<div class="col-1 btn-group">
				<input type="submit" value="검색" class="form-control btn btn-secondary" >
			</div>
		</div>
	</div>
</form>
<div>
	<table class="table text-center mt-3 ">
		<thead>
			<tr>
			  <th scope="col">주문상품</th>
			  <th scope="col">결재방식</th>
			  <th scope="col">주문일자</th>
			  <th scope="col">결재금액</th>
			</tr>
		</thead>
		<tbody id="orderListDiv">
				<c:choose>
					<c:when test="${!empty orderInfoVO.totalRow}">
						<c:forEach items="${orderList }" var="orderInfo">
							<tr>
								<td>${orderInfo.itemName}</td>
								<td>${orderInfo.paymentPlan}</td>
								<td>${orderInfo.buyDate}</td>
								<td>
									<input type="hidden" value="${orderInfo.totalPrice }" class="totalPrice">
									<fmt:formatNumber value="${orderInfo.totalPrice}" pattern="#,###" />원
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">
								데이터가 없습니다
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
		</tbody>
	</table>
	<div class="row">
		<%-- <div class="col-4 d-flex justify-content-center">
			<span>전체 상품의 총 가격</span>
			${allTotalPrice }
		</div> --%>
		<%-- <div class="col-12">
			<div class="d-flex justify-content-end align-self-end" style="text-align: center; float: right;">
				<span>전체 상품의 총 가격 ${allTotalPrice }</span>
				<span style="margin-right: 3rem; margin-left: 4rem;">현재 페이지의 상품 총가격
				<span id="totalPrice" class="d-flex justify-content-end" style="margin-right: 100px;"></span>
				</span>
			</div>
		</div> --%>
		<div class="col-12" style="text-align:right; float: right;">
			<span>전체 상품의 총 가격 ${allTotalPrice } 원</span>
			<span style="margin-right: 3rem; margin-left: 8rem; text-align: right; float: right;">현재 페이지의 상품 총가격
			<span id="totalPrice" ></span>원
			</span>
		</div>
	</div>
	<!-- pagination -->
	<% request.setAttribute("url", "/admin/selectMonthSales"); %>
	<% request.setAttribute("noLinkColor", "#999"); %>
	<div class="container mt-3 pagination">
		<ul class="pagination">
			<!-- << 버튼(처음으로 이동) -->
			<li class="page-item">
				<!-- page 1보다 크면은 -->
				<c:if test="${orderInfoVO.page > 1 }">
					<a class="page-link" href="${url}?page=1&perPageRowNum=${orderInfoVO.perPageRowNum}">
						<i class="fa fa-angle-double-left"></i>
					</a>
				</c:if>
				<!-- page 1 이면 -->
				<c:if test="${orderInfoVO.page == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- < 버튼(다음 그룹 페이지로이동)-->
			<li class="page-item">
				<c:if test="${orderInfoVO.startPage > 1}">
					<a class="page-link" href="${url }?${orderInfoVO.startPage -1}&perPageRow=${orderInfoVO.perPageRowNum}">
						<i class="fa fa-angle-left"></i>
					</a>
				</c:if>
				<c:if test="${orderInfoVO.startPage == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- 숫자를 눌려서 페이지 이동 -->
			<c:forEach begin="${orderInfoVO.startPage }" end="${orderInfoVO.endPage }" var="cnt">
				<li class="page-item <c:if test="${orderInfoVO.page == cnt }">active</c:if>">
					<c:if test="${orderInfoVO.page == cnt }">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							${cnt }
						</a>
					</c:if>
					<c:if test="${orderInfoVO.page != cnt }">
						<a class="page-link"
							<c:if test="${!empty orderInfoVO.startDate and !empty orderInfoVO.endDate }">
								href = "/admin/selectMonthSales?page=${cnt }&perPageRowNum=${orderInfoVO.perPageRowNum }&startDate=${orderInfoVO.startDate }&endDate=${orderInfoVO.endDate }"
							</c:if>
							href="${url }?page=${cnt}&perPageRowNum=${orderInfoVO.perPageRowNum}">
							${cnt }
						</a>
					</c:if>
				</li>
			</c:forEach>
			<!-- > 버튼(다음 그룹 페이지로 이동) -->
			<c:if test="${orderInfoVO.endPage < orderInfoVO.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${url }?page=${orderInfoVO.endPage +1}&perPageRowNum=${orderInfoVO.perPageRowNum}">
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</c:if>
			<c:if test="${orderInfoVO.endPage == orderInfoVO.totalPage }">
				<li class="page-item">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
					</a>
				</li>
			</c:if>
			<!-- > 버튼(마지막 페이지로 이동) -->
			<c:if test="${orderInfoVO.page < orderInfoVO.totalPage }">
				<li class="page-item">
				<a class="page-link" href="${url }?page=${orderInfoVO.totalPage}&perPageRowNum=${orderInfoVO.perPageRowNum}">
					<i class="fa fa-angle-double-right"></i>
				</a>
			</li>
			</c:if>
			<c:if test="${orderInfoVO.page == orderInfoVO.totalPage }">
				<li class="page-item">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-double-right" style="color: ${noLinkColor};"></i>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- container mt-3 의 끝 -->
</div>
</body>
</html>