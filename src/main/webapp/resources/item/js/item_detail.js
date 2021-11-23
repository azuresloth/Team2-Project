/**
 * 
 */

/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 수량에 따른 값변화
	$(document).on('change keyup', '#cnt', function() { 
		// 수량
		var cnt = $('#cnt').val();
		// 단가
		var price = $('#itemPrice').val();
		
		var totalPrice = cnt * price;
		$('#cntPrice').text(totalPrice.toLocaleString());
		$('#totalPrice').text(totalPrice.toLocaleString());
		$('#totalCnt').text(cnt);
	}); 
	
	$('#itemForm').attr('onsubmit', 'return false');
	
	$(document).on('click', '#purchaseBtn', function() {
		//수량이 0보다 작을경우 못사게 막기
		var cnt = $('#cnt').val();
		var itemStock = $('#itemStock').val();
		if(cnt <= 0 || (itemStock - cnt) < 0) {
			alert('수량을 확인해 주세요.');
			return false;
		}
		
		var loginId = $('#loginId').val();
		var itemCode = $('#itemCode').val();
		
  	 	/*location.href = '/stu/goStuManage?classCode=' + classCode;*/
  	 	$.ajax({
            url: '/cart/checkCartAjax', //요청경로
            type: 'post',
            data:{'id' : loginId, 'itemCode' : itemCode}, //필요한 데이터
            success: function(result) {
               if(result == ''){
            	   goDirectBtn();
               }
               else{
            	   var result = confirm('장바구니에 같은 제품이 존재합니다. \n같이 구매하시겠습니까?');
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
	});
	$(document).on('click', '#insertCartBtn', function() {
		//수량이 0보다 작거나 남은 수량보다 많을경우 막기
		var cnt = $('#cnt').val();
		var itemStock = $('#itemStock').val();
		if(cnt <= 0 || (itemStock - cnt) < 0) {
			alert('수량을 확인해 주세요.');
			return false;
		}
		
		var loginId = $('#loginId').val();
		var itemCode = $('#itemCode').val();
		
  	 	/*location.href = '/stu/goStuManage?classCode=' + classCode;*/
  	 	$.ajax({
            url: '/cart/checkCartAjax', //요청경로
            type: 'post',
            data:{'id' : loginId, 'itemCode' : itemCode}, //필요한 데이터
            success: function(result) {
               if(result == ''){
            	   goCartBtn();
               }
               else{
            	   var result = confirm('장바구니에 같은 제품이 존재합니다. \n장바구니에 추가하시겠습니까?');
            	   if(result){
            		   $('#insOrUpd').val(1);
            		   goCartBtn();
            	   }
            	   else{
            		   $.ajax({
            			   url: '/cart/deleteSameCartAjax',
            			   type: 'post',
            			   async : false,
            			   data:{'id' : loginId, 'itemCode' : itemCode},
            			   success: function() {
            				   goCartBtn();
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
	});
});

/* 함수선언 영역*/
(function($){
	goCartBtn = function(){
		$('#itemForm').attr('action', '/cart/addCartList');
		$('#itemForm').attr('onsubmit', 'return true');
		$('#itemForm').submit()
	};
	goDirectBtn = function(){
		$('#itemForm').attr('onsubmit', 'return true');
		$('#itemForm').attr('action', '/cart/goPurchasePage');
		$('#itemForm').submit()
	};
})(jQuery);