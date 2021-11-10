//화면 로딩 후 바로 실행
$(document).ready(function(){
	/*var str = '';
	
	str += '프로젝트 샘플 파일입니다.\n';
	str += '해당 프로젝트는\n';
	str += 'template, tiles, jquery, bootstrap,\n';
	str += '첨부파일, tranjection, MyBatis 등의\n';
	str += '기능을 사용할 수 있도록 세팅되어있습니다.\n';
	str += '다들 이제부터 고생시작입니다!\n';
	str += '좋은 결과가 있기를!!!\n';
	
	alert(str);*/
	
	//이벤트 처리
	$(document).on('click', '.nameDiv', function() {
    	//클릭한 카테고리의 CATE_CODE\
		var cateCode = $(this).parent().parent().children(':first').text();
		$.ajax({
            url: '/admin/selectSalesByCateAjax', //요청경로
            type: 'post',
            data:{'cateCode':cateCode}, //필요한 데이터 '넘어가는 데이터의 이름': 실제 데이터 2개 이상일경우 ,로 나열
            success: function(result) { //위의 세줄을 해석하고 컨트롤로 간다, 오류가 없다면 success가 실행이 된다.
            	$('#salesDiv').empty();
            	
            	var str = '';
            	str += '	<thead>';
            	str += '		<tr>';
            	str += '			<th scope="col">상품코드</th>';
            	str += '			<th scope="col">상품이름</th>';
            	str += '			<th scope="col">상품의 총 구매가격</th>';
            	str += '			<th scope="col">상품의 총 구매수량</th>';
            	str += '			<th scope="col">상품 구매일</th>';
            	str += '		</tr>';
            	str += '	</thead>';
            	
            	$(result).each(function(index, element){
	            		str += '	<tbody>';
	            		str += '	<tr>';
	            		str += '		<td>' + element.itemCode + '</td>';
	            		str += '		<td>' + element.itemName + '</td>';
	            		str += '		<td>' + element.totalPrice + '</td>';
	            		str += '		<td>' + element.buyCnt + '</td>';
	            		str += '		<td>' + element.buyDate + '</td>';
	            		str += '	</tr>';
	            		str += '	</tbody>';
            	
            	});
       
            	$('#salesDiv').append(str);
            	
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
		
		
		
	});
   
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
	
	
})(jQuery);
























