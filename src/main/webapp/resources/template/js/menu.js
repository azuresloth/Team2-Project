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
	$(document).on('click', '#searchIcon', function() { 
		var searchTest = /\S/;
		searchTest.test(('#mainSearchBar').val())
		if(searchTest.test(('#mainSearchBar').val())) {
	   		$('#mainPageSearchForm').submit() 
		}
		else {
			alert('검색어를 입력해주세요.');
		}
	});
	
});


/* 함수선언 영역*/
(function($){
     aaa = function(){
	
     };
})(jQuery);
