<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/sales_manage"></script>
</head>
<body>
<div class="row">
	<div class="col-4">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">카테고리 이름</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${categoryList }" var="categoryListInfo" varStatus="status">
				<tr>
					<td><input type="hidden" id="cateCode" value="${categoryListInfo.cateName }"></td>
					<td>${status.index + 1 }</td>
					<td><div class="nameDiv">${categoryListInfo.cateName }</div></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-8">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">상품 이름</th>
					<th scope="col">상품의 총 구매가격</th>
					<th scope="col">상품의 총 구매수량</th>
					<th scope="col">상품 구매일 </th>
				</tr>
			</thead>
			<tbody id="salesDiv">
				<c:forEach items="${salesList }" var="salesInfo">
					<tr>
						<td>${salesInfo.itemName }</td>
						<td>${salesInfo.totalPrice }</td>
						<td>${salesInfo.itemCnt }</td>
						<td>${salesInfo.buyDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>