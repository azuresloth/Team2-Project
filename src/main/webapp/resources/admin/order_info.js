//화면 로딩 후 바로 실행
$(document).ready(function(){
   //이벤트 처리
	$(document).on('click', '.update', function() {
		var buyCode = $(this).parent().children(':first').val();
		var statusName = $(this).parent().prev().children().val();
		updateStatus(buyCode, statusName);
	});
   
});

//함수 선언 영역
(function($){
	updateStatus = function(buyCode, statusName){
		
		$.ajax({
            url: '/admin/updateStatus', //요청경로
            type: 'post',
            data:{'classCode':classCode, 'statusName':statusName}, //필요한 데이터 '넘어가는 데이터의 이름': 실제 데이터 2개 이상일경우 ,로 나열
            success: function(result) { //위의 세줄을 해석하고 컨트롤로 간다, 오류가 없다면 success가 실행이 된다.
               //ajax 실행 성공 후 실행할 코드 작성
               alert('성공');
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
	} 
})(jQuery);