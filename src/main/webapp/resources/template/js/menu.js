/**
 * 
 */

/*타이틀 js*/
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);
/*타이틀 js*/

/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
});


/* 함수선언 영역*/
(function($){
     mainSearchFun = function(){
		var mainSearchValue = $('#mainSearchBar').val();
		$('#mainPageSearchForm').attr('onsubmit', 'return false');
		mainSearchValue = mainSearchValue.replace(/\s/gi, '');
		if(mainSearchValue != '') {
			$('#mainPageSearchForm').attr('onsubmit', 'return true');
			$('#mainSearchBar').val(mainSearchValue);
	   		$('#mainPageSearchForm').submit() 
		}
		else {
			alert('검색어를 입력해주세요.');
		}
     };
})(jQuery);
