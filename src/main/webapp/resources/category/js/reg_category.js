//화면 로딩 후 바로 실행
$(document).ready(function(){
	//이벤트 처리
	$(document).on('click', '#delete', function() {
		var result = confirm('삭제하겠습니까?');
		if(result){
			alert('삭제하였습니다.')
		}else{
			alert('취소하였습니다.')
		}
	});
   

	
	
});

//함수 선언 영역
(function($){
	insertCategory = function(){
		var result = confirm('등록하시겠습니까?');
		if(result){
			alert('등록하였습니다.')
			$('#insert').submit();
		}
		else{
			$('취소하였습니다.')
		}
	};
	
	
	
	
   
})(jQuery);