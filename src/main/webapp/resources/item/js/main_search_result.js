/**
 * 
 */

/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
});


/* 함수선언 영역*/
(function($){
     detailSearchFun = function(){
		var mainSearchValue = $('#detailSearchBar').val();
		var minPrice = $('#minPrice').val();
		var maxPrice = $('#maxPrice').val();
		alert(minPrice + '!!!' + maxPrice)
		if(minPrice == '' || minPrice == null){
			$('#minPrice').val(0);
		}
		if(maxPrice == '' || maxPrice == null){
			$('#maxPrice').val(0);
		}
		$('#detailSearchForm').attr('onsubmit', 'return false');
		mainSearchValue = mainSearchValue.replace(/\s/gi, '');
		if(mainSearchValue != '') {
			$('#detailSearchForm').attr('onsubmit', 'return true');
			$('#detailSearchBar').val(mainSearchValue);
	   		$('#detailSearchForm').submit() 
		}
		else {
			alert('검색어를 입력해주세요.');
		}
     };
})(jQuery);
