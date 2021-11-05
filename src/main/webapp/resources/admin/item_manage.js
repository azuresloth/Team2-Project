//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '.update', function() {
		var itemCode = $(this).prev().val();
		var itemStatus = $(this).parent().children(':first').val();
		
		$.ajax({
	        url: '/admin/itemStatusUpdateAjax', //요청경로
	        type: 'post',
	        data:{'itemCode':itemCode, 'itemStatus':itemStatus}, //필요한 데이터
	        success: function(result) {
	        	alert('수정이 완료되었습니다.');
	        },
	        error: function(){
		        	//ajax 실행 실패 시 실행되는 구간
		        	alert('실패');
       			}
		});
		
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
























