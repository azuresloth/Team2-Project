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
	
	
	
	/*ID 찾기*/
/*	
	findId = function(){
    	location.href = '';
    	
     };
     */
     /*Password찾기*/
    findPw = function(){
    	
    }
 	
})(jQuery);
