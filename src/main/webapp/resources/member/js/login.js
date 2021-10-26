/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$(document).on('click', '#id', function() {
		$('.login_warn').remove();
		
    });
});

/* 함수선언 영역*/
(function($){
	/* 로그인 버튼 클릭 */
	login = function(){
	        /*
	        alert("로그인 버튼 작동");
			*/
			/* 로그인 메서드 서버 요청 */
	        /*$('#loginForm').attr("action", "/");*/
	        $('#loginForm').submit();
			
	}
	
	
	
	//아이디찾기
	
	findInfo = function(){
    	var name = $('#name').val();
    	
     };
     
    //지우기
 	
 	
})(jQuery);
