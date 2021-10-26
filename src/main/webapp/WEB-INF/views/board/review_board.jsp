<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	// 후기작성 폼 열고 닫는 버튼 기능
	$('#feedBackButton').click(function(e) {
// 		alert("확인");
	     if($("#feedBackInsertform").css("display") == "none"){   
	         $('#feedBackInsertform').css("display", "block");   
	     } else {  
	         $('#feedBackInsertform').css("display", "none");   
	     }  
	});// 끝
	$("#btnSubmit").click(function (event) {         
		//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
		event.preventDefault();          
	    // Get form         
	    var form = $('#fileUploadForm')[0];  	    
	    // Create an FormData object          
	    var data = new FormData(form);  	   
	    
	    $.ajax({             
	    	type: "POST",          
	        enctype: 'multipart/form-data',  
	        url: "/feedback/insertAjax",        
	        data: data,          
	        processData: false,    
	        contentType: false,      
	        cache: false,           
	        timeout: 600000,       
	        success: function () { 
	        	alert(1111);           
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
	            alert("fail");      
	         }     
		});  
	});
	
(function($){
	/* 후기등록과 동시에 후기 폼을 닫아주기 */
	feedBackInsertformClose = function(){
		$('#feedBackInsertform').css("display", "none");
	};
   
})(jQuery);

});  
</script>
</head>
<body>
	<h1>상품 상세 보기 페이지</h1>
	<h2>후기 등록하기</h2>
	<div class="feedBackDiv">
		<input type="button" value="후기등록 열기/닫기" class="btn btn-primary" id="feedBackButton">
	</div>
	<div id="feedBackInsertform" style="display: none;">
		
		<form  method="post" enctype="multipart/form-data" id="fileUploadForm">
			<input type="hidden" value="${param.itemCode }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 -->
			<div>제목(상품후기) : <input type="text" name="title"></div>
			<div>작성자(상품후기) : <input type="text" name="id"></div>
			<div>내용 (상품후기) : </div>
			<div><textarea rows="10" cols="50" name="content"></textarea></div>
			<div>사진 첨부(상품후기) : <input type="file" name="file"> </div>	
			<input type="submit" value="후기등록" onclick="feedBackInsertformClose();" id="btnSubmit">
		</form>
	</div>
</body>
</html>