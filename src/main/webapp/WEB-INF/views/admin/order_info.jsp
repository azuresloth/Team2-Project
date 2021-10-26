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
				<td>
					<select name="buyStatus">
						<option value="입금대기">${orderInfo.buyStatus }</option>
						<option value="주문취소">${orderInfo.buyStatus }</option>
						<option value="배송완료">${orderInfo.buyStatus }</option>
					</select>
				</td>
				<td>${orderInfo.buyDate}</td>
				<td>
					<input type="button" value="변경">
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>