<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/cart/css/purchase_page.css?ver=2">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/cart/js/purchase_page.js?ver=1"></script>
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
							<th><input type="checkbox" class="motherBox"></th>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
						
					</table>
				</div>
				<div class="col-12 warningDiv">
					<span class="warningSpan"><img alt="" src="/resources/images/common/warning.png"> 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				<div class="col-12 checkDeleteDiv">
					<strong>선택상품 </strong><button type="button" class="btn btn-outline-secondary btn-sm checkDeleteBtn">삭제하기</button>
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
								<input type="radio" name="deliveryAddrRadio" id="sameAddrRadio"> 회원정보와 동일 <input type="radio" name="deliveryAddrRadio" id="newAddrRadio"> 새로운 배송지
							</td>
						</tr>
						<tr>
							<th>받으시는 분 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" name="deliveryName" required>
							</td>
						</tr>
						<tr>
							<th>주소 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" id="sample4_postcode" placeholder="우편번호" name="deliveryAddrs" required>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" class="longAddrInput" id="sample4_roadAddress" placeholder="도로명주소" name="deliveryAddrs" required><br>
								<input type="text" class="longAddrInput" id="sample4_jibunAddress" placeholder="지번주소" name="deliveryAddrs" required><br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" class="longAddrInput" id="sample4_detailAddress" placeholder="상세주소"> (선택입력가능)
								<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
							</td>
						</tr>
						<tr>
							<th>휴대전화 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<select name="deliveryTells">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="019">019</option>
								</select> - 
								<input type="text" class="tellInput" name="deliveryTells" required> - <input type="text" class="tellInput" name="deliveryTells" required>
							</td>
						</tr>
						<tr>
							<th>이메일 <img src="/resources/images/common/required_check_icon.png"></img></th>
							<td>
								<input type="text" name="deliveryEmails" required> @ <input type="text" name="deliveryEmails" id="emailChoosedBox" required>
								<select id="emailSelectBox">
									<option value="">- 이메일 선택 -</option>
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
							<td><span>10,000</span>원</td>
							<td>
								<button class="button blackButton2 btn_payment">결제하기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(".btn_payment").click(function() {
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		
	  	IMP.init('imp14874010');
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount : 1/*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
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
				    	
				    	/* location.href= $.getContextPath()+"/Cart/Success"; */
				    }
				    alert(msg);
				});
			});
</script>
</html>