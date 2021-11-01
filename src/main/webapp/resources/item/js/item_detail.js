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
	}); 
	

})

/* 함수선언 영역*/
(function($){
	
})(jQuery);