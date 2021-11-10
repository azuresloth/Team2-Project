//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '.update', function() {
		var result = confirm('수정하시겠습니까?');
		if(result){
			alert('수정하였습니다.');
			var itemCode = $(this).prev().val();
			var itemStatus = $(this).parent().children(':first').val();
			var itemStock = $(this).parent().prev().children().val();
			location.href = '/admin/itemUpdate?itemCode=' + itemCode + '&itemStatus=' + itemStatus + '&itemStock=' + itemStock;
		}
    });
	
	$(document).on('click', '.delete', function(){
		var itemCode = $(this).prev().val();
		var result = confirm('삭제하시겠습니까?');
		
		if(result){
			location.href = '/admin/deleteItem?itemCode=' + itemCode;
		}
		
		
	});
	
	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	
	//};
   
})(jQuery);
























