//화면 로딩 후 바로 실행
$(document).ready(function() {
	$(document).on('click', '#id', function() {
		$('#a').remove();
		$('#joinBtn').addClass('disabled');
    });
});
//함수 선언 영역
(function($){
   //비밀번호 확인
	finalJoin = function(){
	var pw = $('#pw').val();
	var pw1 = $('#pw_1').val();
	
	if(pw != pw1){
		alert('비밀번호를 확인하세요');
		$('input[type="pw"]').val('');
		$$('#pw').focus();
		
		return;
		
	}
	$('#joinForm').submit();
};
	
	
	//아이디 중복체크
	checkId = function(){
		var id = $('#id').val();
		
		if(id == ''){
		var a = $('#checkIdDiv').attr('id');
			
			if(a != 'a'){
				$('#checkIdDiv').after('<div id="a" > 아이디를 입력하세요 </div>')
			}
			return;
		}
		
		$.ajax({
            url: '/member/checkId', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(result) {
               //ajax 실행 성공 후 실행할 코드 작성
              
           if(result){
        	   $('#a').remove();
        	   $('#checkIdDiv').after('<div id="a" style="color:red "> 아이디가 중복입니다 </div>');
           }
           else{
        	   $('#a').remove();
        	   $('#checkIdDiv').after('<div id="a" style="color:blue "> 사용가능합니다 </div>');
        	   
        	   $('#joinBtn').removeClass('disabled');
         	 }
            
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
	};
	
	
})(jQuery);