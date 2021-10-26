/* 페이지 로딩 후 실행 */
$(document).ready(function(){

});

/* 함수선언 영역*/
(function($){
    
	//아이디찾기
	
	findInfo = function(){
    	var name = $('#name').val();
    	
     };
     
     
     //로그인시
 	checkId = function(){
 		var id = $('#id').val();
 		var pw = $('#pw').val();
 		
 		if(id == ''){
 			alert('아이디를 입력하세요');
 			if(id ==('#id')){
 				if(pw =='' && pw != ('#pw')){
 					alert('비밀번호를 확인하세요');
 					
 				}
 				
 				
 				
 			}
 			
 			
 			return;
 		}
 	}
/*
 	  $.ajax({
          url: '/member/goLogin', //요청경로
          type: 'post',
          data:{'id':id , 'pw':pw}, //필요한 데이터
          success: function(result) {
             //ajax 실행 성공 후 실행할 코드 작성
            //로그인 성공
         if(result){
      	  
         	
         	//$('#a').remove();
      	  // $('#checkIdDiv').after('<div id="a" style="color:red "> 아이디가 중복입니다 </div>');
         }
         //로그인 실패
         else{
      	 //  $('#a').remove();
      	 //  $('#checkIdDiv').after('<div id="a" style="color:blue "> 사용가능합니다 </div>');
      	   
      	//   $('#joinBtn').removeClass('disabled');
       	 }
          
          },
          error: function(){
           //ajax 실행 실패 시 실행되는 구간
             alert('실패');
          }
    });
    */
 	
})(jQuery);
