<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/sales_manage.js?ver=14"></script>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
.nameDiv{
	cursor: pointer;
}
.pagination{
	margin: 0 auto;
}
</style>
</head>
<body>
<h2>카테고리당 매출정보</h2>
<div class="row">
	<div class="col-4">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col" >카테고리 코드</th>
					<th scope="col" >카테고리 이름</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${categoryList }" var="categoryListInfo" varStatus="status">
				<tr>
					<td>${categoryListInfo.cateCode }</td>
					<td><div class="nameDiv">${categoryListInfo.cateName }</div></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-8" >
		<table class="table text-center" id="salesDiv">
			<thead>
				<tr>
					<th scope="col">상품 코드</th>
					<th scope="col">상품 이름</th>
					<th scope="col">상품의 총 구매가격</th>
					<th scope="col">상품의 총 구매수량</th>
					<th scope="col">상품 구매일 </th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty salesList }">
						<tr>
							<td colspan="5">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${salesList }" var="salesListInfo">
							<tr>
								<td>${salesListInfo.itemCode }</td>
								<td>${salesListInfo.itemName }</td>
								<td><fmt:formatNumber value="${salesListInfo.totalPrice}" pattern="#,###"/></td>
								<td>${salesListInfo.buyCnt }</td>
								<td>${salesListInfo.buyDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	<!-- pagination -->
	<% request.setAttribute("url", "/admin/salesManage"); %>
	<% request.setAttribute("noLinkColor", "#999"); %>
	<div class="container mt-3 pagination">
		<ul class="pagination">
			<!-- << 버튼(처음으로 이동) -->
			<li class="page-item">
				<!-- page 1보다 크면은 -->
				<c:if test="${salesManageVO.page > 1 }">
					<a class="page-link" href="${url}?page=1&perPageRowNum=${salesManageVO.perPageRowNum}">
						<i class="fa fa-angle-double-left"></i>
					</a>
				</c:if>
				<!-- page 1 이면 -->
				<c:if test="${salesManageVO.page == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- < 버튼(다음 그룹 페이지로이동)-->
			<li class="page-item">
				<c:if test="${salesManageVO.startPage > 1}">
					<a class="page-link" href="${url }?${salesManageVO.startPage -1}&perPageRow=${salesManageVO.perPageRowNum}">
						<i class="fa fa-angle-left"></i>
					</a>
				</c:if>
				<c:if test="${salesManageVO.startPage == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- 숫자를 눌려서 페이지 이동 -->
			<c:forEach begin="${salesManageVO.startPage }" end="${salesManageVO.endPage }" var="cnt">
				<li class="page-item <c:if test="${salesManageVO.page == cnt }">active</c:if>">
					<c:if test="${salesManageVO.page == cnt }">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							${cnt }
						</a>
					</c:if>
				<c:if test="${salesManageVO.page != cnt }">
						<a class="page-link"
							<c:if test="${salesManageVO.cateCode eq null and !salesManageVO.cateCode eq ''}">
								href = "/admin/salesManageByCate?cateCode=${salesManageVO.cateCOde }"
							</c:if>
							href="${url }?page=${cnt}&perPageRowNum=${salesManageVO.perPageRowNum}">
							${cnt }
						</a>
					</c:if>
				</li>
			</c:forEach>
			<!-- > 버튼(다음 그룹 페이지로 이동) -->
			<c:if test="${salesManageVO.endPage < salesManageVO.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${url }?page=${salesManageVO.endPage +1}&perPageRowNum=${salesManageVO.perPageRowNum}">
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</c:if>
			<c:if test="${salesManageVO.endPage == salesManageVO.totalPage }">
				<li class="page-item">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
					</a>
				</li>
			</c:if>
			<!-- > 버튼(마지막 페이지로 이동) -->
			<c:if test="${salesManageVO.page < salesManageVO.totalPage }">
				<li class="page-item">
				<a class="page-link" href="${url }?page=${salesManageVO.totalPage}&perPageRowNum=${salesManageVO.perPageRowNum}">
					<i class="fa fa-angle-double-right"></i>
				</a>
			</li>
			</c:if>
			<c:if test="${salesManageVO.page == salesManageVO.totalPage }">
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
</div>
</body>
</html>