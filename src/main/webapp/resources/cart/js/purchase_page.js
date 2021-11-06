/**
 * 
 */
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("roadAddress").value = roadAddr;
			document.getElementById("jibunAddress").value = data.jibunAddress;
			
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			/*if(roadAddr !== ''){
				document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("sample4_extraAddress").value = '';
			}*/
			
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';
				
			} else if(data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			} else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
		}
	}).open();
}	


// ---------------------------------제이쿼리


/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	// 구매목록 삭제로 비어있을경우
	$(window).bind("pageshow", function (event) {
		if (event.originalEvent.persisted) { 
			alert('BFCahe로부터 복원됨'); 
			var id = $('#id').val();
			alert(id);
			var codeArr = new Array();
			$('.childBox').each(function() {
				codeArr.push($(this).val());
			});
			$.ajax({
				url: '/cart/checkPurchaseDataAjax',
				type: 'post',
				data: {'itemCodes' : codeArr, 'id' : id},
				/*async: false,*/
				success: function() {
					alert('성공');
					/*if(asdf == 0){
						alert(asdf);
						alert('구매페이지로 갈 수 없습니다.');
						location.href='/item/mainPage';
					}
					else{
						alert(asdf);
					}
*/					
				},
				error: function() {
					alert('실패');
				}
			});
			alert('에이작스 지나감');
		} 
		else { 
		} 
	});
	/*var id = $('#id').val();
	var codeArr = new Array();
	$('.childBox').each(function() {
		codeArr.push($(this).val());
	});
	$.ajax({
		url: '/cart/checkPurchaseDataAjax',
		type: 'post',
		data: {'itemCodes' : codeArr, 'id' : id},
		success: function(result) {
			alert('성공');
			if(result == 0){
				alert(result);
				alert('구매페이지로 갈 수 없습니다.');
				location.href='/item/mainPage';
			}
			else{
				alert(result);
			}
			
		},
		error: function() {
			alert('실패');
		}
	});*/
	
	// 체크박스
	$(document).on('click', '#motherBox', function() {
		// 마더박스의 체크여부
		var isChecked = $('#motherBox').is(':checked');
		
		// 전체체크, 전체해제
		if(isChecked) {
			$('.childBox').prop('checked', true);
		}
		else {
			$('.childBox').prop('checked', false);
		}
	});
	$(document).on('click', '.childBox', function() {
		// 체크박스 개수
		var childCnt = $('.childBox').length;
		// 체크된 박스 개수
		var checkedCnt = $('.childBox:checked').length;
		
		if(childCnt == checkedCnt) {
			$('#motherBox').prop('checked', true);
		}
		else {
			$('#motherBox').prop('checked', false);
		}
	});
	
	// 이메일박스 값 전달
	$(document).on('change', '#emailSelectBox', function() { 
		var email = $('#emailSelectBox').val();
		if(email != '1'){
			$('#emailChoosedBox').val(email);
		}
		if(email != ''){
			$('#emailChoosedBox').attr('readonly', 'readonly');
		}
		if(email == ''){
			$('#emailChoosedBox').prop('readonly', false);
		}
		if(email == '1'){
			$('#emailChoosedBox').val('');
		}
	}); 
	
	// 엔터키 방지
	$(document).on('keydown', 'input', function() {
		if(event.keyCode === 13){
			event.preventDefault();
		};
	});
	
	// 배송정보 라디오 버튼
	$(document).on('change', 'input[name="deliveryAddrRadio"]', function() {
		if($(this).val() == '0'){
			var id = $('#id').val()
			$.ajax({
	            url: '/cart/selectMemberDeliveryInfoAjax', //요청경로
	            type: 'post',
	            data:{'id' : id}, //필요한 데이터
	            success: function(result) {
	            	$('#deliveryName').val(result.deliveryName);
	            	$('#deliveryName').prop('readonly', true);
	            	$('#postcode').val(result.postCode);
	            	$('#postcode').prop('readonly', true);
	            	$('#roadAddress').val(result.roadAddr);
	            	$('#roadAddress').prop('readonly', true);
	            	$('#detailAddress').val(result.detailAddr);
	            	$('#detailAddress').prop('readonly', true);
	            	if($('#basicTell1').val() != null || $('#basicTell1').val() != ''){
	            		$('#basicTell1').val(result.tell1)
	            		$('#basicTell1').text(result.tell1)
	            		$("#tell1 option").not(":selected").prop("disabled", true);
	            	}
	            	$('#tell2').val(result.tell2);
	            	$('#tell2').prop('readonly', true);
	            	$('#tell3').val(result.tell3);
	            	$('#tell3').prop('readonly', true);
	            	$('#email1').val(result.email1);
	            	$('#email1').prop('readonly', true);
	            	$('#emailChoosedBox').val(result.email2);
	            	$('#emailChoosedBox').prop('readonly', true);
	            	$("#emailSelectBox option").not(":selected").prop("disabled", true);
	            	$("#SearchAddr").prop("disabled", true);
				},
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      	});
		}
		if($(this).val() == '1'){
			$('.deliveryInfoTable').find('input').not('input[type="radio"]').val('');
			$('.deliveryInfoTable').find('input').not('input[type="radio"]').prop('readonly', false);
			$("#tell1 option").not(":selected").prop("disabled", false);
			$("#emailSelectBox option").not(":selected").prop("disabled", false);
			$("#SearchAddr").prop("disabled", false);
			$('#basicTell1').remove();
		}
	});
	
	/*$('#itemForm').attr('onsubmit', 'return false');
	
	$(document).on('click', '#purchaseBtn', function() { 
		var loginId = $('#loginId').val();
		var itemCode = $('#itemCode').val();
		
  	 	location.href = '/stu/goStuManage?classCode=' + classCode;
  	 	$.ajax({
            url: '/cart/checkCartAjax', //요청경로
            type: 'post',
            data:{'id' : loginId, 'itemCode' : itemCode}, //필요한 데이터
            success: function(result) {
               if(result == ''){
            	   goDirectBtn();
               }
               else{
            	   var result = confirm('장바구니에 같은 제품이 존재합니다. \n 같이 구매하시겠습니까?');
            	   if(result){
            		   $('#insOrUpd').val(1);
            		   goDirectBtn();
            	   }
            	   else{
            		   $.ajax({
            			   url: '/cart/deleteSameCartAjax',
            			   type: 'post',
            			   async : false,
            			   data:{'id' : loginId, 'itemCode' : itemCode},
            			   success: function() {
            				   goDirectBtn();
            			   },
            			   error: function() {
            				   alert('실패');
            			   }
            		   });
            	   }
               }

			},
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});
	});*/
});

/* 함수선언 영역*/
(function($){
	/*goCartBtn = function(){
		$('#itemForm').attr('onsubmit', 'return true');
		$('#itemForm').attr('action', '/cart/goCartList');
		$('#itemForm').submit()
	};
	goDirectBtn = function(){
		$('#itemForm').attr('onsubmit', 'return true');
		$('#itemForm').attr('action', '/cart/goPurchasePage');
		$('#itemForm').submit()
	};*/
	
	checkedDelete = function() {
		var cnt = $('.childBox:checked').length;
		if(cnt != 0){
			var sure = confirm('선택한 상품을 삭제하시겠습니까?');
			if(sure){
				var id = $('#id').val();
				var arr = new Array();
				$('.childBox:checked').each(function() {
					arr.push($(this).val());
				});
				$(arr).each(function(index, element) {
				});
				$.ajax({
					url: '/cart/checkedDeleteAjax',
					type: 'post',
					data: {'itemCodes' : arr, 'cnt' : cnt, 'id' : id},
					success: function() {
						if($('.childBox').length){
							alert('구매목록에 상품이 없습니다. \n 장바구니로 돌아갑니다.');
							location.href='/cart/goCartList';
						}
						else{
							history.go(0);
						}
					},
					error: function() {
						alert('실패');
					}
				});
			}
		}
		else {
			alert('선택한 상품이 없습니다.');
		}
	};
})(jQuery);