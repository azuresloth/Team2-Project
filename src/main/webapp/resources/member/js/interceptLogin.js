/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$(document).on('click', '#id', function() {
		$('.login_warn').remove();
		
    });
	
	$(window).bind("pageshow", function (event) {
		var checkId = $('#checkId').val();
		
		if(checkId != ''){
			location.href='/item/mainPage';
		}
	});

});


/* 함수선언 영역*/
(function($){
	/* 로그인 버튼 클릭 */
	interceptLogin = function(){
	        /*
	        alert("로그인 버튼 작동");
			*/
			/* 로그인 메서드 서버 요청 */
	        /*$('#loginForm').attr("action", "/");*/
	        $('#interceptLoginForm').submit();
			
	}
	
	
	
	/*ID 찾기*/
	findIdForm = function(){
 		location.href='/member/findIdForm';
 	}
	
	

     /*Password찾기*/
    findPwForm = function(){
    	location.href='/member/findPwForm'
    }
    
    //enterkey 로그인
    enterkey =  function(){
    	if(window.event.keyCode == 13){
    		interceptLogin();
    	}
    	
    }
   
    
   
 	
})(jQuery);