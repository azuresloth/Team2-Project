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
