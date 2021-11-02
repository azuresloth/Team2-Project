<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/sales_manage.js?ver=13"></script>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
.nameDiv{
	cursor: pointer;
}
</style>
</head>
<body>
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
	<div class="col-8" id="salesDiv">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">상품 코드</th>
					<th scope="col">상품 이름</th>
					<th scope="col">상품의 총 구매가격</th>
					<th scope="col">상품의 총 구매수량</th>
					<th scope="col">상품 구매일 </th>
				</tr>
				<c:forEach items="${salesList }" var="salesListInfo">
					<tr>
						<td>${salesListInfo.itemCode }</td>
						<td>${salesListInfo.itemName }</td>
						<td><fmt:formatNumber value="${salesListInfo.totalPrice}" pattern="#,###"/></td>
						<td>${salesListInfo.buyCnt }</td>
						<td>${salesListInfo.buyDate }</td>
					</tr>
				</c:forEach>
			</thead>
		</table>
	</div>
</div>
</body>
</html>