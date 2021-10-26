<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/order_info.js"></script>
<style type="text/css">
.statusName{
	display: table;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
<div>
	<table class="table">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
<div>
	<table class="table text-center">
		<thead>
			<tr>
			  <th scope="col">구매자</th>
			  <th scope="col">주문상품</th>
			  <th scope="col">결재금액</th>
			  <th scope="col">결재방식</th>
			  <th scope="col">주문일자</th>
			  <th scope="col">상태</th>
			  <th scope="col">변경</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderList }" var="orderInfo">
			<tr>
				<td>${orderInfo.id}</td>
				<td>${orderInfo.itemName}</td>
				<td>${orderInfo.totalPrice}</td>
				<td>${orderInfo.paymentPlan}</td>
				<td>${orderInfo.buyDate}</td>
				<td><input type="hidden" ></td>
				<td>
					<select class="form-select form-select-sm w-60 statusName" aria-label=".form-select-sm example">
						<c:forEach items="${statusInfo }" var="status">
							<option value="${status.statusName }" <c:if test="${status.statusName eq orderInfo.buyStatus }">selected</c:if> >${status.statusName }</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<input type="hidden" value="${orderInfo.buyCode }">
					<input type="button" value="변경" class="update">
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>