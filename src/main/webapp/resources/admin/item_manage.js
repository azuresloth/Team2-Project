//화면 로딩 후 바로 실행
$(document).ready(function(){
	//변경버튼 클릭시
	$(document).on('click', '.update', function() {
		var result = confirm('수정하시겠습니까?');
		if(result){
			alert('수정하였습니다.');
			var itemCode = $(this).prev().val();
			var itemStock = $(this).parent().children(':first').val();
			var itemStatus = $(this).parent().prev().children().val();
			location.href = '/admin/itemUpdate?itemCode=' + itemCode + '&itemStatus=' + itemStatus + '&itemStock=' + itemStock;
		}
    });
	//삭제 버튼 클릭시
	$(document).on('click', '.delete', function(){
		var itemCode = $(this).prev().val();
		var result = confirm('삭제하시겠습니까?');
		
		if(result){
			location.href = '/admin/deleteItem?itemCode=' + itemCode;
		}
		
		
	});
	//select박스 값 변경시
	$(document).on('change', '.select', function(){
		
		var isk = $(this).parent().next();
		var itemCode = $(this).parent().next().children().eq(1).val();
		var str = '';
		
		$.ajax({
            url: '/admin/changeStatusAjax', //요청경로
            type: 'post',
            data:{'itemCode':itemCode}, //필요한 데이터 '넘어가는 데이터의 이름': 실제 데이터 2개 이상일경우 ,로 나열
            success: function(result) { //위의 세줄을 해석하고 컨트롤로 간다, 오류가 없다면 success가 실행이 된다.
               //ajax 실행 성공 후 실행할 코드 작성
            	$(isk).empty();
            		alert(result);
            	$(this).empty();
            	str += '<input type="number" value="' + result + '" class="form-control text-start" min="0">'
            	str += '<input type="hidden" value="' + itemCode + '">';
            	str += '<input type="button" value="변경" class="btn btn-secondary btn-sm update">';
            	
            	$(isk).append(str);
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('넌 진짜 나쁜놈이야');
            }
      });
		
	});
	
	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	
	//};
   
})(jQuery);
























