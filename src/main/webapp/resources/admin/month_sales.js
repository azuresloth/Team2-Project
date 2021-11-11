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
	var endDate1 = '';
	//이벤트 처리
	$(document).on('change', '#startDate', function() {
		alert('야발');
		var startDate2 = $('#startDate').val();
		var endDate2 = $('#endDate').val();
		if(startDate2 > endDate2){
			$('#startDate').val(startDate1);
			alert('됫니?');
		}
	});
	$(document).on('change', '#endDate', function() {
		alert('야발');
		var startDate2 = $('#startDate').val();
		var endDate2 = $('#endDate').val();
		if(endDate2 < startDate2){
			$('#endtDate').val(endDate2);
			alert('됫다?');
		}
	});

	
});

//함수 선언 영역
(function($){
	/*checkDate = function(startDate, endDate){
		
	};*/
   
})(jQuery);
























