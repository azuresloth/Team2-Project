/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	
});


/* 함수선언 영역*/
(function($){
	
	//이메일 인증번호발송
	findPw = function(){
		var email = $('#email').val();
		var id = $('#id').val();
		
		
		
		$.ajax({
            url: '/member/pwCheckAjax', //요청경로
            type: 'post', // 받을 매핑 방식
            data:{'email' : email, 'id' : id}, //(컨트롤러에 전해줄)필요한 데이터  {'a' : sing, 'b' : song}
            /*contentType: 'application/x-www-form-urlencoded; charset=euc-kr',*/
            success: function(result) {
            	if(result == '이메일을 다시 입력해주세요.'){
            		alert('입력하신 이메일을 확인해주세요.');
            		$('#email').focus();
            	}
            	else {
            		alert('입력하신 이메일로 비밀번호가 발송되었습니다.  '+result);
            		location.href='/member/goLogin';
            	}
            	
			},
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});
	};
    
   
    
   
 	
})(jQuery);