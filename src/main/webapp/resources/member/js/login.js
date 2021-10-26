/* 페이지 로딩 후 실행 */
$(document).ready(function(){

});

/* 함수선언 영역*/
(function($){
	/* 로그인 버튼 클릭 */
    $(".loginBtn").click(function(){
        
        alert("로그인 버튼 작동");
        
    });
	
	//아이디찾기
	
	findInfo = function(){
    	var name = $('#name').val();
    	
     };
     
     //로그인 실패
   goLogin = function(){
	   var id = $('#id').val();
	   var pw = $('#pw').val();
	   
	   	 if(id!=$('#id')){
	   		 $('login_warn').attr(hidden).remove();
	   		
	   		 return;
	   	 }
	   	 else{
	   		
	   		 return;
	   	 }
	   	 
   };

 	
 	
})(jQuery);
