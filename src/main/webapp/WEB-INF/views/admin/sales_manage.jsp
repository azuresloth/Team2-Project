<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
	<div class="col-6">
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
					<td>${status.index + 1 }</td>
					<td>${categoryListInfo.cateName }</td>
				</tr>
			</c:forEach>
				<tr>
					<td>1</td>
					<td>목걸이</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-6">
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">상품 이름</th>
					<th scope="col">상품의 총 구매가격</th>
					<th scope="col">상품의 총 구매수량</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">목걸이</th>
					<td>200,000</td>
					<td>20</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>