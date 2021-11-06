<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/cart/css/purchase_page.css?ver=1">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/cart/js/purchase_page.js?ver=2"></script>
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
							> <a>주문서작성</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-10 ">
			<form action="" method="post" onsubmit="return false">
			<div class="row mt-2 justify-content-center">
				<div class="col-12 purTitleDiv">
					<h4>주문서작성</h4>
				</div>
				<div class="col-12 purInfoTableDiv">
					<table class="purInfoTable text-center">
						<colgroup>
							<col width="50px">
							<col width="110px">
							<col width="auto">
							<col width="120px">
							<col width="95px">
							<col width="105px">
							<col width="120px">
						</colgroup>
						<tr>
							<th><input type="checkbox" id="motherBox" class="motherBox"><input type="hidden" id="id" name="id" value="${sessionScope.loginInfo.id}"></input></th>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
						<c:if test="${not empty buyItemInfo}">
							<tr>
								<td><input type="checkbox" class="childBox" value="${buyItemInfo.itemCode }"></td>
								<td><img alt="" src="/resources/images/item/itemImages/${buyItemInfo.attachedImgName}" width="75px;"></td>
								<td>${buyItemInfo.itemName}</td>
								<td><fmt:formatNumber type="number" value="${buyItemInfo.itemPrice}"></fmt:formatNumber>원</td>
								<td>${buyItemInfo.itemCnt}개</td>
								<td>[무료]</td>
								<td><fmt:formatNumber type="number" value="${buyItemInfo.totalPrice}"></fmt:formatNumber>원</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="col-12 warningDiv">
					<span class="warningSpan"><img alt="" src="/resources/images/common/warning.png"> 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				<div class="col-12 checkDeleteDiv">
					<strong>선택상품 </strong><button type="button" class="btn btn-outline-secondary btn-sm checkDeleteBtn" onclick="checkedDelete();">삭제하기</button>
				</div>
				<div class="col-12 deliveryInfoTitle">
					<span>배송정보</span><span class="requiredCheckSpan"><img src="/resources/images/common/required_check_icon.png"></img> 필수입력사항</span>
				</div>
				<div class="col-12 deliveryInfoTableDiv">
					<table class="deliveryInfoTable">
						<colgroup>
							<col width="150px;">
							<col width="auto">
						</colgroup>
						<tr>
							<th>배송지 선택</th>
							<td>
								<input type="radio" name="deliveryAddrRadio" id="sameAddrRadio" value="0"> 회원정보와 동일 <input type="radio" name="deliveryAddrRadio" id="newAddrRadio" value="1"> 새로운 배송지
							</td>
						</tr>
						<tr>
							<th>받으시는 분 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" name="deliveryName" id="deliveryName" required value="${basicDeliveryInfo.name}">
							</td>
						</tr>
						<tr>
							<th>주소 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" id="postcode" placeholder="우편번호" name="postCode" required value="${basicDeliveryInfo.postCode}">
								<button id="SearchAddr" class="addrBtn" type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br>
								<input type="text" class="longAddrInput" id="roadAddress" placeholder="도로명주소" name="roadAddr" required value="${basicDeliveryInfo.roadAddr}"><br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" class="longAddrInput" id="detailAddress" name="detailAddr" placeholder="상세주소" value="${basicDeliveryInfo.detailAddr}"> (선택입력가능)
								<input type="hidden" class="longAddrInput" id="jibunAddress" placeholder="지번주소" name="deliveryAddrs" required><br>
								<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
							</td>
						</tr>
						<tr>
							<th>휴대전화 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<select name="deliveryTells" id="tell1">
									<c:if test="${not empty emailandTellInfo}">
										<option id="basicTell1" value="${emailandTellInfo.tell1}">${emailandTellInfo.tell1}(기존)</option>
									</c:if>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
								</select> - 
								<input type="text" class="tellInput" name="deliveryTells" id="tell2" required <c:if test="${not empty emailandTellInfo}">value="${emailandTellInfo.tell2}"</c:if>>- <input type="text" class="tellInput" name="deliveryTells" id="tell3" required <c:if test="${not empty emailandTellInfo}">value="${emailandTellInfo.tell3}"</c:if>>
							</td>
						</tr>
						<tr>
							<th>이메일 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" name="deliveryEmails" id="email1" required <c:if test="${not empty emailandTellInfo}">value="${emailandTellInfo.email1}"</c:if>> @ <input type="text" name="deliveryEmails" id="emailChoosedBox" required  <c:if test="${not empty emailandTellInfo}">value="${emailandTellInfo.email2}"</c:if>>
								<select id="emailSelectBox">
									<option value="1">- 이메일 선택 -</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="">직접입력</option>
								</select>
									<p>이메일을 통해 주문정보를 보내드립니다.<br>
									이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
							</td>
						</tr>
						<tr>
							<th>배송메세지</th>
							<td>
								<textarea name="deliveryMsg" class="msgTextarea" rows="" cols="70" maxlength="255" placeholder="배송시 남길 메세지를 적어주세요."></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="col-12 buyTotalPriceTitle">
					<span>결제 예정 금액</span>
				</div>
				<div class="col-12 buyTotalPriceTableDiv">
					<table class="buyTotalPriceTable text-center">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<tr>
							<th>총 주문 금액</th>
							<th>결제</th>
						</tr>
						<tr>
							<td>
								<span>
									<c:if test="${not empty buyItemInfo}">
										<fmt:formatNumber type="number" value="${buyItemInfo.totalPrice}"></fmt:formatNumber>원
									</c:if>
								</span>
							</td>
							<td>
								<button class="button blackButton2 btn_payment">결제하기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$(".btn_payment").click(function() {
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		
	  	IMP.init('imp14874010');
	  	//결제시 전달되는 정보
	  	if(${buyItemInfo != null}){
	  		var name = $('#deliveryName').val();
	  		var tell = $('#tell1').val() + '-' + $('#tell2').val() + '-' +$('#tell3').val();
	  		var email = $('#email1').val() + '@' + $('#emailChoosedBox').val();
	  		var addr = $('#roadAddress').val() + ' ' + $('#detailAddress').val();
	  		var postCode = $('#postcode').val();
			IMP.request_pay({
					    pg : 'inicis', 
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '${buyItemInfo.itemName} (${buyItemInfo.itemCnt}개)'/*상품명*/,
					    amount : parseInt(${buyItemInfo.totalPrice} / 10000)/*상품 가격*/, 
					    buyer_email : email/*구매자 이메일*/,
					    buyer_name : name,
					    buyer_tel : tell/*구매자 연락처*/,
					    buyer_addr : addr/*구매자 주소*/,
					    buyer_postcode : postCode/*구매자 우편번호*/
					}, function(rsp) {
						var result = '';
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        
					        result ='0';
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        result ='1';
					    }
					    if(result=='0') {
						    alert(msg);
					    	
					    	/* location.href= $.getContextPath()+"/Cart/Success"; */
					    }
					});
	  	}
			});
</script>
</html>