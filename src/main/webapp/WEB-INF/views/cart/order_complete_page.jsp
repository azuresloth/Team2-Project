<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/cart/css/order_complete_page.css?ver=1">
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							> <a>주문완료</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
<	<div class="row justify-content-center">
		<div class="col-10 ">
			<div class="row mt-2 justify-content-center">
				<div class="col-12 purTitleDiv">
					<h4>주문서작성</h4>
				</div>
			</div>
		
		</div>
	</div>
	
	주문코드 : ${buyInfoVO.orderCode}
	최종결제금액 : ${buyInfoVO.allTotalPrice}
	
	 
	결제수단 : 카드
	주문상품 정보 : 표(구매페이지랑 같은 형식)
	배송지 정보 : 그냥 받아와서 글자로 적기
</body>
</html>