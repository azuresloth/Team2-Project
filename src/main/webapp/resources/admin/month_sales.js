//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	
	var totalPrice = 0;
	
	$('.totalPrice').each(function(index, element){
		var price = Number($(element).val());
		totalPrice += price
	});	
	var total = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$('#totalPrice').text(total);
	
	
	var startDate1 = $('#startDate').val(); 
	var endDate1 = $('#endDate').val();
	
	//이벤트 처리
	$(document).on('change', '#startDate', function() {
		var startDate2 = $('#startDate').val();
		var endDate2 = $('#endDate').val();
		if(startDate2 > endDate2){
			$('#startDate').val(startDate1);
			alert('날짜를 확인해 주세요.');
		}
	});
	
	$(document).on('change', '#endDate', function() {
		var startDate2 = $('#startDate').val();
		var endDate2 = $('#endDate').val();
		if(endDate2 < startDate2){
			$('#endDate').val(endDate1);
			alert('날짜를 확인해 주세요.');
		}
	});

	
});

//함수 선언 영역
(function($){
	/*checkDate = function(startDate, endDate){
		
	};*/
   
})(jQuery);
























