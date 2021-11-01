//화면 로딩 후 바로 실행
$(document).ready(function(){
   //이벤트 처리
	$(document).on('click', '.update', function() {
		var buyCode = $(this).parent().children(':first').val();
		var statusName = $(this).parent().prev().children().val();
		updateStatus(buyCode, statusName);
	});

   //이벤트 처리
	$(document).on('click', '#serchBtn', function() {
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		$.ajax({
            url: '/admin/serchDateAjax', //요청경로
            type: 'post',
            data:{'startDate':startDate, 'endDate':endDate}, //필요한 데이터 '넘어가는 데이터의 이름': 실제 데이터 2개 이상일경우 ,로 나열
            success: function(result) { //위의 세줄을 해석하고 컨트롤로 간다, 오류가 없다면 success가 실행이 된다.
               //ajax 실행 성공 후 실행할 코드 작성
        		
        		var statusInfo = result.statusInfo;
        		var selectBySerchDateList = result.selectBySerchDateList;

        		var str = '';
            	$(selectBySerchDateList).each(function(index, element1){
            		$('#orderListDiv').empty();
            		str += '<tr>';
            		str += '	<td>' + element1.id + '</td>';
            		str += '	<td>' + element1.itemName + '</td>';
            		str += '	<td>' + element1.totalPrice + '</td>';
            		str += '	<td>' + element1.paymentPlan + '</td>';
            		str += '	<td class="next">' + element1.buyDate + '</td>';
            		str += '	<td class="next">'+ '<select class="form-select form-select-sm w-60 statusName" aria-label=".form-select-sm example">';
								 $(statusInfo).each(function(index, element2){
										if(element2.statusName == element1.buyStatus){
												str += '<option value="'+ element2.statusName + '" selected>' + element2.statusName + '</option>'
										}
										
										else{
											str += '<option value="'+ element2.statusName + '">' + element2.statusName + '</option>'
										}
								});
            		str +=	'</select>'+'</td>';
            		str += '<td><input type="hidden" value="'+ element1.buyCode + '"><input type="button" value="변경" class="update"></td>';
            		str += '</tr>';
            		$('#orderListDiv').append(str);
            	});
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
	});
   
   
   
   
});

//함수 선언 영역
(function($){
	updateStatus = function(buyCode, statusName){
		
		$.ajax({
            url: '/admin/updateStatusAjax', //요청경로
            type: 'post',
            data:{'buyCode':buyCode, 'statusName':statusName}, //필요한 데이터 '넘어가는 데이터의 이름': 실제 데이터 2개 이상일경우 ,로 나열
            success: function(result) { //위의 세줄을 해석하고 컨트롤로 간다, 오류가 없다면 success가 실행이 된다.
               //ajax 실행 성공 후 실행할 코드 작성
            	alert('상태가 수정되었습니다.');
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
	} 
})(jQuery);