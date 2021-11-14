/**
 * 
 */
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.


// ---------------------------------제이쿼리


/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 수량 변경
	$(document).on('click', '.updateBtn', function() {
		var itemCnt = $(this).parent().children().eq(1).val();
		var itemStock = $(this).parent().children().eq(0).val();
		var cartCode = $(this).parent().parent().children().eq(0).children().eq(0).val();
		if(itemCnt < 1 || (itemCnt - itemStock) > 0){
			alert('상품의 남은 수량보다 많이 설정할 수 없습니다.');
		}
		else{
			$.ajax({
				url: '/cart/updateCartCntAjax',
				type: 'post',
				data: {'cartCode' : cartCode, 'itemCnt' : itemCnt},
				success: function() {
					history.go(0);
				},
				error: function() {
					alert('실패');
				}
			});
		};
	});
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
	
	// 엔터키 방지
	$(document).on('keydown', 'input', function() {
		if(event.keyCode === 13){
			event.preventDefault();
		};
	});
	
	// 상품 삭제
	$(document).on('click', '.deleteBtn', function() {
		
		var sure = confirm('장바구니에서 삭제 하시겠습니까?');
		if(sure){
			var itemCode = $(this).parent().parent().children().eq(0).children().eq(0).val();
			var itemCnt = $(this).parent().parent().children().eq(4).children().eq(0).val();
			var id = $('#id').val();
			$.ajax({
				url: '/cart/cartDeleteAjax',
				type: 'post',
				data: {'itemCode' : itemCode, 'id' : id},
				success: function() {
						history.go(0);
				},
				error: function() {
					alert('실패');
				}
			});
		}
	});
	
	
});

/* 함수선언 영역*/
(function($){
	
	
	// 체크된 상품 삭제하기
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
							history.go(0);
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