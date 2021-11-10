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
<script type="text/javascript" src="/resources/admin/item_manage.js?ver=3"></script>
<style type="text/css">
.select{
	width: 100px;
	display: inline-block;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>상품 관리</h2>
		<div class="row">
			<div class="col">
				<table class="table table-striped text-center">
					<thead>
						<tr>
					        <th>ITEM IMG</th>
					        <th>ITEM NAME</th>
					        <th>ITEM PRICE</th>
					        <th>ITEM STOCK</th>
					        <th>ITEM STATUS</th>
					        <th>DELETE BUTTON</th>
						</tr>
					</thead>
					<c:forEach items="${itemList}" var="itemInfo">
						<tr>
							<td>
								<img src="/resources/images/item/itemImages/${itemInfo.imgList[0].attachedImgName}" width="80px;"></img>
							</td>
							<td>${itemInfo.itemName }</td>
							<td><fmt:formatNumber value="${itemInfo.itemPrice}" pattern="#,###"/></td>
							<td>${itemInfo.itemStock }</td>
							<td>
								<select class="form-select form-select-sm select">
									<option value="0" <c:if test="${itemInfo.itemStatus eq 0 }">selected</c:if>>판매대기</option>
									<option value="1" <c:if test="${itemInfo.itemStatus eq 1 }">selected</c:if>>판매중</option>
									<option value="2" <c:if test="${itemInfo.itemStatus eq 2 }">selected</c:if>>매진</option>
								</select>
								<input type="hidden" value="${itemInfo.itemCode }">
								<input type="button" value="변경" class="btn btn-secondary btn-sm update"> 
							</td>
							<td>
								<input type="hidden" value="${itemInfo.itemCode }">
								<input type="button" value="삭제" class="btn btn-secondary btn-lg delete">
							</td>
						</tr>
					</c:forEach>
				</table>
				<!-- pagination -->
				<% request.setAttribute("url", "/admin/itemManage"); %>
				<% request.setAttribute("noLinkColor", "#999"); %>
				<div class="container mt-3 pagination d-flex justify-content-center">
					<ul class="pagination">
						<!-- << 버튼(처음으로 이동) -->
						<li class="page-item">
							<!-- page 1보다 크면은 -->
							<c:if test="${pageVO.page > 1 }">
								<a class="page-link" href="${url}?page=1&perPageRowNum=${pageVO.perPageRowNum}">
									<i class="fa fa-angle-double-left"></i>
								</a>
							</c:if>
							<!-- page 1 이면 -->
							<c:if test="${pageVO.page == 1 }">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
								</a>
							</c:if>
						</li>
						<!-- < 버튼(다음 그룹 페이지로이동)-->
						<li class="page-item">
							<c:if test="${pageVO.startPage > 1}">
								<a class="page-link" href="${url }?${pageVO.startPage -1}&perPageRow=${pageVO.perPageRowNum}">
									<i class="fa fa-angle-left"></i>
								</a>
							</c:if>
							<c:if test="${pageVO.startPage == 1 }">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
								</a>
							</c:if>
						</li>
						<!-- 숫자를 눌려서 페이지 이동 -->
						<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }" var="cnt">
							<li class="page-item <c:if test="${pageVO.page == cnt }">active</c:if>">
								<c:if test="${pageVO.page == cnt }">
									<a class="page-link" style="pointer-events: none; cursor: default;">
										${cnt }
									</a>
								</c:if>
								<c:if test="${pageVO.page != cnt }">
									<a class="page-link"
										<%-- <c:if test="${!empty pageVO.startDate and !empty orderVO.endDate }">
											href = "/admin/serchDate?page=${cnt }&perPageRowNum=${orderVO.perPageRowNum }&startDate=${orderVO.startDate }&endDate=${orderVO.endDate }"
										</c:if> --%>
										
										href="${url }?page=${cnt}&perPageRowNum=${pageVO.perPageRowNum}">
										${cnt }
									</a>
								</c:if>
							</li>
						</c:forEach>
						<!-- > 버튼(다음 그룹 페이지로 이동) -->
						<c:if test="${pageVO.endPage < pageVO.totalPage }">
							<li class="page-item">
								<a class="page-link" href="${url }?page=${pageVO.endPage +1}&perPageRowNum=${pageVO.perPageRowNum}">
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</c:if>
						<c:if test="${pageVO.endPage == pageVO.totalPage }">
							<li class="page-item">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
								</a>
							</li>
						</c:if>
						<!-- > 버튼(마지막 페이지로 이동) -->
						<c:if test="${pageVO.page < pageVO.totalPage }">
							<li class="page-item">
							<a class="page-link" href="${url }?page=${pageVO.totalPage}&perPageRowNum=${pageVO.perPageRowNum}">
								<i class="fa fa-angle-double-right"></i>
							</a>
						</li>
						</c:if>
						<c:if test="${pageVO.page == pageVO.totalPage }">
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
	</div>
</body>
</html>