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
			alert($(this).val());
			/*$.ajax({
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

				}
		}*/
		}
			else if($(this).val() == '1'){
			$('.deliveryInfoTable').find('input').not('input[type="radio"]').val('');
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
})(jQuery);