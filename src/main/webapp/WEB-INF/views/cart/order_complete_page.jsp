<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
주문완료창입니다.
<c:if test="${not empty nowBuyList}">
	
	주문코드 : ${buyInfoVO.orderCode}
	최종결제금액 : 0
	<c:forEach items="${nowBuyList}" var="buyInfo">
	+ buyInfo.totalPrice
	</c:forEach>
	
	 
	결제수단 : 카드
	주문상품 정보 : 표(구매페이지랑 같은 형식)
	배송지 정보 : 그냥 받아와서 글자로 적기
</c:if>
</body>
</html>