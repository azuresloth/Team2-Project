<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/main_search_result.css?ver=8">
<script type="text/javascript" src="/resources/item/js/main_search_result.js?ver=1"></script>
</head>
<body>
	<div class="row justify-content-center">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a> >
						</li>
						<li>
							상품검색
						</li>
					</ol>
				</div>
			</div>
		
			<form id="detailSearchForm" action="/item/mainSearchResult" method="post" onsubmit="return false">
			<div class="row justify-content-center mainSearchArea">
				<div class="col-6">
					<input type="text" id="detailSearchBar" name="searchValue" value="${itemVO.searchValue}" class="keywordBox">
				</div>
				
				<div class="col-12 mainSearchResultCnt">
					검색결과 <strong>${itemVO.totalCnt}</strong> 개의 상품이 있습니다.
				</div>
				
				<div class="col-6" style="border: 1px solid black;">
					<table class="table mr-0" style="height: 200px;">
					  <tbody>
					    <tr>
					      <th scope="row">상품 분류</th>
					      <td>
					      	<select class="searchSelectBox" name="searchKeyword">
					      		<option value="all">상품 분류 선택</option>
					      		<c:forEach items="${categoryList}" var="categoryInfo">
					      			<option value="${categoryInfo.cateCode}" <c:if test="${itemVO.searchKeyword eq categoryInfo.cateCode}">selected</c:if>>${categoryInfo.cateName}</option>
					      		</c:forEach>
					      	</select>
					      </td>
					      <td></td>
					      <td></td>
					    </tr>
					    <tr>
					      <th scope="row">가격대</th>
					      <td colspan="3">
					      	<input type="number" id="minPrice" name="minPrice" <c:choose><c:when test="${not empty itemVO.minPrice}">value="${itemVO.minPrice}"</c:when><c:otherwise>value="0"</c:otherwise></c:choose>> ~ <input type="number" id="maxPrice" name="maxPrice" <c:choose><c:when test="${not empty itemVO.maxPrice}">value="${itemVO.maxPrice}"</c:when><c:otherwise>value="0"</c:otherwise></c:choose>> &nbsp;원
					      </td>
					    </tr>
					    <tr>
					      <th scope="row">정렬 기준</th>
					      <td>
					      	<select class="searchSelectBox" name="orderBy">
					      		<option value="">:: 기준선택 ::</option>
					      		<option value="ITEM_NAME"<c:if test="${itemVO.orderBy eq 'ITEM_NAME'}">selected</c:if>>상품명 순</option>
					      		<option value="REG_DATE DESC"<c:if test="${itemVO.orderBy eq 'REG_DATE DESC'}">selected</c:if>>신상품 순</option>
					      		<option value="ITEM_PRICE"<c:if test="${itemVO.orderBy eq 'ITEM_PRICE'}">selected</c:if>>낮은 가격 순</option>
					      		<option value="ITEM_PRICE DESC"<c:if test="${itemVO.orderBy eq 'ITEM_PRICE DESC'}">selected</c:if>>높은 가격 순</option>
					      	</select>
					      </td>
					      <td></td>
					      <td></td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
				<div class="col-12 ">
					<button class="button blackButton submitButton" onclick="detailSearchFun();">검색</button>
				</div>
			</div>
				</form>
			
			
			
			<div class="row justify-content-center">
					<c:choose>
						<c:when test="${itemVO.totalCnt eq 0}">
							<div class="col text-center">
							<strong class="warning">검색결과가 없습니다.</strong>
							<br>
							<strong>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</strong>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${itemList}" var="itemInfo">
								<div class="col-3">
									<!-- 사진 -->
									<a href="/item/itemDetail?itemCode=${itemInfo.itemCode}&cateCode=${itemInfo.cateCode}"><img src="/resources/images/item/itemImages/${itemInfo.imgList[0].attachedImgName}" width="100%"></img></a>
									<!-- 이름, 가격 -->
									<a href="/item/itemDetail?itemCode=${itemInfo.itemCode}&cateCode=${itemInfo.cateCode}">${itemInfo.itemName}</a>
									<div>${itemInfo.itemPrice}원</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</div>
			<div class="col-12">
				<!-- pagination -->
				<% request.setAttribute("url", "/admin/salesManage"); %>
				<% request.setAttribute("noLinkColor", "#999"); %>
				<div class="container mt-3 pagination">
					<ul class="pagination">
						<!-- << 버튼(처음으로 이동) -->
						<li class="page-item">
							<!-- page 1보다 크면은 -->
							<c:if test="${itemVO.page > 1 }">
								<a class="page-link" href="${url}?page=1&perPageRowNum=${itemVO.perPageRowNum}">
									<i class="fa fa-angle-double-left"></i>
								</a>
							</c:if>
							<!-- page 1 이면 -->
							<c:if test="${itemVO.page == 1 }">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
								</a>
							</c:if>
						</li>
						<!-- < 버튼(다음 그룹 페이지로이동)-->
						<li class="page-item">
							<c:if test="${itemVO.startPage > 1}">
								<a class="page-link" href="${url }?${itemVO.startPage -1}&perPageRow=${itemVO.perPageRowNum}">
									<i class="fa fa-angle-left"></i>
								</a>
							</c:if>
							<c:if test="${itemVO.startPage == 1 }">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
								</a>
							</c:if>
						</li>
						<!-- 숫자를 눌려서 페이지 이동 -->
						<c:forEach begin="${itemVO.startPage }" end="${itemVO.endPage }" var="cnt">
							<li class="page-item <c:if test="${itemVO.page == cnt }">active</c:if>">
								<c:if test="${itemVO.page == cnt }">
									<a class="page-link" style="pointer-events: none; cursor: default;">
										${cnt }
									</a>
								</c:if>
							<c:if test="${itemVO.page != cnt }">
									<a class="page-link"
										<c:if test="${itemVO.cateCode eq null and !itemVO.cateCode eq ''}">
											href = "/item/mainSearchResult?searchValue=${itemVO.searchValue}"
										</c:if>
										href="${url }?page=${cnt}&perPageRowNum=${itemVO.perPageRowNum}">
										${cnt }
									</a>
								</c:if>
							</li>
						</c:forEach>
						<!-- > 버튼(다음 그룹 페이지로 이동) -->
						<c:if test="${itemVO.endPage < itemVO.totalPage }">
							<li class="page-item">
								<a class="page-link" href="${url }?page=${itemVO.endPage +1}&perPageRowNum=${itemVO.perPageRowNum}">
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</c:if>
						<c:if test="${itemVO.endPage == itemVO.totalPage }">
							<li class="page-item">
								<a class="page-link" style="pointer-events: none; cursor: default;">
									<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
								</a>
							</li>
						</c:if>
						<!-- > 버튼(마지막 페이지로 이동) -->
						<c:if test="${itemVO.page < itemVO.totalPage }">
							<li class="page-item">
							<a class="page-link" href="${url }?page=${itemVO.totalPage}&perPageRowNum=${itemVO.perPageRowNum}">
								<i class="fa fa-angle-double-right"></i>
							</a>
						</li>
						</c:if>
						<c:if test="${itemVO.page == itemVO.totalPage }">
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