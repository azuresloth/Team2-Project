<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/item_detail.css?ver=3">
<script type="text/javascript" src="/resources/item/js/item_detail.js?ver=1"></script>
<script type="text/javascript" src="/resources/board/js/feedback.js?ver=2"></script>
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
							> <a href="/item/categoryPage?cateCode=${pathInfo.cateCode}">${pathInfo.cateName }</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-2 justify-content-center">
		<div class="col-5 ps-0">
			<!-- Swiper -->
		    <div class="swiper itemImg">
		      <div class="swiper-wrapper">
		      	<c:forEach items="${itemInfo.imgList}" var="imgInfo">
			        <div class="swiper-slide"><img src="/resources/images/item/itemImages/${imgInfo.attachedImgName}" width="100%;"></img></div>
		      	</c:forEach>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		</div>
		
		<div class="col-5 itemInfoDiv">
		<form action="" method="post" onsubmit="return false" id="itemForm">
			<div class="col-12 nameDiv">
				<h2>${itemInfo.itemName}</h2>
				<input type="hidden" name="itemCode" id="itemCode" value="${itemInfo.itemCode}">
			</div>
			<div class="col-12 priceDiv">
				<input type="hidden" id="itemPrice" name="itemPrice" value="${itemInfo.itemPrice}">
				<span class="priceSpan"><fmt:formatNumber type="number" value="${itemInfo.itemPrice}"></fmt:formatNumber>원</span>
			</div>
			<div class="col-12 ">
				<table class="deliveryTable">
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>배송방법</th>
							<td>택배</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-12 introDiv">
				<span class="introSpan">${itemInfo.itemIntro}</span>
			</div>
			<div class="col-12 itemCntDiv">
				<div class="cntDiv">
					수량
				</div>
				<table class="cntTable">
					<colgroup>
						<col width="60%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tr>
						<td>
							<p>${itemInfo.itemName}</p>
						</td>
						<td class="itemCnt">
							<input type="hidden" id="itemStock" value="${itemInfo.itemStock}">
							<input class="itemCnt" id="cnt" type="number" min="1" max="${itemInfo.itemStock}" value="1" name="itemCnt">개
						</td>
						<td class="itemCnt right">
							<span class="priceCnt">
								<span id="cntPrice"><fmt:formatNumber type="number" >${itemInfo.itemPrice}</fmt:formatNumber></span>원
							</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-12 totalPriceDiv">
				<strong>합계 금액</strong>
				<span class="totalPriceSpan">
					<span id="totalPrice" class="totalPrice"><strong><strong id="totalPrice"><fmt:formatNumber type="number" >${itemInfo.itemPrice}</fmt:formatNumber></strong></strong></span><strong>원</strong>
					<span class="totalCnt">(<strong id="totalCnt">1</strong>)개</span>
				</span>
			</div>
			<div class="col-12 justify-content-center text-center mt-2">
				<input type="hidden" name="id" id="loginId" value="${sessionScope.loginInfo.id}">
				<!-- 장바구니에 추가할지 갯수만 수정할지 정할 정보 0: 추가 1: 수정 -->
				<input type="hidden" name="insOrUpd" id="insOrUpd" value="0">
				<!-- requestURI -->
				<input type="hidden" name="requestURI" value="${requestURI}">
				<button type="button" class="btn btn-outline-warning btn-lg cartBtn" id="insertCartBtn">장바구니 추가</button>
				<button type="button" class="btn btn-outline-secondary btn-lg directBtn" id="purchaseBtn">바로구매</button>
			</div>
			</form>
		</div>
		<div class="col-10 botBorder-1b bg-light">
			<div class="p-4 pb-1 fs-3">상품 후기</div>
		</div>
		
		<div class="col-10 mt-2 px-0">
		<!-- 컨트롤러에서 상품구매한적 있는지 조회한후 인트로 받아서 0이아닐경우 IF 로 보여줌 -->
			<c:if test="${not empty sessionScope.loginInfo }">
				<button type="button" class="btn btn-primary ms-4" data-bs-toggle="collapse" data-bs-target="#demo">후기등록 열기/닫기</button>
			</c:if>
			
			<div id="demo" class="collapse">
			<!-- 세로운 디자인의 폼태그 -->
			<div>
				<form method="post" enctype="multipart/form-data" id="fileUploadForm">
					<input type="hidden" value="${itemInfo.itemCode}" name="itemCode" id="itemCodeInput"> <!-- 추후에 아이탬으로변경됨 -->
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text bg-light">제목</span> 
						<input type="text" class="form-control" name="title">
					</div>
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text bg-light">작성자</span> 
						<input type="text" class="form-control bg-light" value="${sessionScope.loginInfo.id }"  readonly name="id" id="loginId">
						<input type="hidden" value="${sessionScope.loginInfo.isAdmin }" id="loginIsAdmin">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text bg-light">내용</span>
						<textarea rows="5" class="form-control" style="resize: none;" name="content"></textarea>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text bg-light">사진 첨부</span> 
						<input type="file" class="form-control bg-light" required name="file">
					</div>
					<div class="text-center">
						<input type="submit" class="btn btn-primary mt-2" value="후기등록" id="insertFeedbackBtn">
						<input type="button" class="btn btn-primary mt-2" value="취소" id="cancelFeedbackFormBtn">
					</div>
				</form>
			</div>
	<!-- 세로운 디자인의 폼태그 끝!!!!!!!!!!!!-->
	</div>
	<!-- 여기를 비워주면서 후기 리스트를 넣어준다. -->
			<div>
				<ul class="list-group" style="font-size: 18px; margin-top: 20px;" id="feedbackListUl" > <!-- 여기에 후기 목록을 뿌려준다. -->
					<li class="list-group-item"> 
						<form method="post" enctype="multipart/form-data" class="updateFileUploadForm">
							<div class="row">
								<div class="col-2">
									<img src="http://placehold.it/150x150"/>
								</div>
								<div class="col-10">
									<div class="row mt-2">
										<div class="col-8">
											제목 : <span>제목자리입니다.</span>
										</div>
										<div class="col-4 text-end">
											작성일 : <span>2021.11.6(14:28)</span>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											작성자 : <span>작성자 자리</span>
										</div>
									</div>
									<div class="row" style="height: 50px;">
										<div class="col-12">
											내용 : <span>내용자리입니다</span>
										</div>
									</div>
									<div style="float: right;">
										<input type="hidden" value="fbCode" name="fbCode"> 
										<input type="button" value="수정" class="btn btn-secondary updateFormFeedbackBtn"> 
										<input type="button" value="삭제" class="btn btn-secondary deleteFeedbackBtn">
									</div>
								</div>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 후기 -->
	<div class="row justify-content-center formDiv">
	</div>
	<!-- 후기 끝 -->
	
	
</body>
 <script>
      var swiper = new Swiper(".itemImg", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</html>