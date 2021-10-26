<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/main_search_result.css?ver=7">
</head>
<body>
	<div class="row justify-content-center">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							상품검색
						</li>
					</ol>
				</div>
			</div>
		
			<form action="/item/mainSearchResult" method="post">
			<div class="row justify-content-center mainSearchArea">
				<div class="col-6">
					<input type="text" name="searchValue" value="${itemVO.searchValue}" class="keywordBox">
				</div>
				
				<div class="col-12 mainSearchResultCnt">
					검색결과 <strong>${itemVO.totalCnt}</strong> 개의 상품이 있습니다.
				</div>
				
				<div class="col-10" style="border: 1px solid black">
					<table class="table mr-0">
					  <tbody>
					    <tr>
					      <th scope="row">상품 분류</th>
					      <td>
					      	<select class="searchSelectBox" name="searchKeyword">
					      		<option value="all">상품 분류 선택</option>
					      		<c:forEach items="${categoryList}" var="categoryInfo">
					      			<option value="${categoryInfo.cateCode}">${categoryInfo.cateName}</option>
					      		</c:forEach>
					      	</select>
					      </td>
					      <td></td>
					      <td></td>
					    </tr>
					    <tr>
					      <th scope="row">가격대</th>
					      <td colspan="3">
					      	<input type="number" name="minPrice"> ~ <input type="number" name="maxPrice"> &nbsp;원
					      </td>
					    </tr>
					    <tr>
					      <th scope="row">정렬 기준</th>
					      <td>
					      	<select class="searchSelectBox" name="orderBy">
					      		<option value="">:: 기준선택 ::</option>
					      		<option value="ITEM_NAME">상품명 순</option>
					      		<option value="REG_DATE DESC">신상품 순</option>
					      		<option value="ITEM_PRICE">낮은 가격 순</option>
					      		<option value="ITEM_PRICE DESC">높은 가격 순</option>
					      	</select>
					      </td>
					      <td></td>
					      <td></td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
				<div class="col-12 ">
					<button class="button blackButton submitButton" onclick="">검색</button>
				</div>
			</div>
				</form>
			
			
			
			<div class="row justify-content-center">
				<div class="col text-center">
					<c:if test="${itemVO.totalCnt eq 0}">
						<strong class="warning">검색결과가 없습니다.</strong>
						<br>
						<strong>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</strong>
					</c:if>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>