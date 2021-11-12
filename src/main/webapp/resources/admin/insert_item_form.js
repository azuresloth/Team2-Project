//화면 로딩 후 바로 실행
$(document).ready(function(){

	
	//이벤트 처리
	//$(document).on('click', '#id', function() {
    //});
   
	//ajax 사용
//	$.ajax({
//        url: '', //요청경로
//        type: 'post',
//        data:{}, //필요한 데이터
//        success: function(result) {
//        	//ajax 실행 성공 시 실행되는 구간
//        	alert('성공');
//        },
//        error: function(){
//        	//ajax 실행 실패 시 실행되는 구간
//        	alert('실패');
//        }
//  });
	
	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
	inputNumberFormat = function(obj){
		// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
        var deleteComma = obj.value.replace(/\,/g, "");

        // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
        if(isFinite(deleteComma) == false) {
            alert("문자는 입력하실 수 없습니다.");
            obj.value = "";
            return false;
        }
        iptNumWithComma(obj);
	};
	
	iptNumWithComma = function(str){
		str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	}
	
   
})(jQuery);
























