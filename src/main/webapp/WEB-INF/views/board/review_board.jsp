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
	
	// 화면에 바로 후기 목록 뿌려주기
	
	var itemCode = '${param.itemCode }';	//전역변수
// 	alert(itemCode);// 확인함
	
	showFeedbackList = function(itemCode){
		$.ajax({
			url:'/feedback/feedbackListAjax',
			type:'post',
			data:{'itemCode':itemCode},
			// result는 콘트롤러에서 넘어오는 객체이다
			//ajax 실행 성공 후 실행 할 코드 작성
			success:function(result){
// 				$('#scoreDiv').empty();
// 				//태그 비우기
				
// 				//태그 채우기
				var str = "";
				// 결과는 리스트(배열로 들어온다.)
				if(result == ''){
					str += "아직등록된 상품후기가 없습니다.";
				}else{
					// 데이터가 있으면 태그를 만들어준다.
					str += "<div id='feedbackDiv'>";
					str += "<h2> 아작스 작성자 상품 후기</h2>";
					
					$(result).each(function(index,element){
					str += "<div class='feedbackTr' style='border: 1px solid black;'>";
					str += "<input type='hidden' value='"+ element.fbCode +"' name='fbCode'>";
					/* feedback 코트 */
					str += "<div>" + element.title + "</div>";
					//시간 관련 함수
					str += "<div class='feedbackTdCreateDate'>" + dateFormet(element.createDate)+ "</div>";
					//str += new Date(element.createDate);
					str += "<div class='feedbackTdId'>작성자 : <span>" + element.id + "</span></div>";
					str += "<div><input type='button' class='btn btn btn-secondary updateBtn'  value='수정'></div>";
					str += "<div><input type='hidden' value='"+element.fbCode+"'></div>";
					//str += "<div><input type='button' class='btn btn btn-secondary' value='삭제' onclick='deleteFeedback(\'"        +element.fbCode+ "\');'></div>";
					str += "<div><input type='button' class='btn btn btn-secondary' value='삭제' onclick='deleteFeedback(\"" +element.fbCode+ "\");'></div>";
					
					str += "</div>";
					str += "<div style='border: 1px solid black;'>";
					str += "<div class='feedbackTdAttachedFileName'>";
					if(element.attachedFileName != null){
						str += "<img src='/resources/feedback/images/" + element.attachedFileName + "' height='100px'>";
					};
				
					str += "</div>";
					str += "<div class='feedbackTdContent'>" + element.content + "</div>";
					str += "</div>";
					
					});
					str += "</div>";
				}
				//태그 주입
				$('#feedBackInsertform').after(str); // 노드 바로 뒤에 태그를 추가한다.
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
		
	} // showFeedbackList 끝.
	// 후기 목록 뿌리기 함수 실행
	showFeedbackList(itemCode);
	//-------------------------------------------------------------------------
	// updateBtn 클릭 시
	$(document).on("click",".updateBtn",function(){
		var fbCode = $(this).parent().prev().prev().prev().prev().val();
		var title = $(this).parent().prev().prev().prev().text();
		var id = $(this).parent().prev().children().text();
		var date = $(this).parent().prev().prev().text();
		var content = $(this).parent().parent().next().children().eq(1).text();
		
		
		$(this).parent().parent().next().remove();
		var row = $(this).parent().parent();
		row.empty();
		var str = '';
		
		str += '<form  method="post" enctype="multipart/form-data" class="updateFileUploadForm">';
		str += '<input type="hidden" value="'+ fbCode +'" name="fbCode">';
		str += '<div>제목(상품후기수정) : <input type="text" value="' + title + '" name="title"></div>';
		str += '<div>작성자 : <input type="text" readonly value="' + id + '" name="id" ></div>';
		str += '<div>날짜 : <input type="text" readonly value="' + date + '"></div>';
		str += '<div>내용 (상품후기수정) : </div>';
		str += '<div><textarea rows="10" cols="50" name="content">' + content + '</textarea></div>';
		str += '<div>사진 첨부(상품후기수정) : <input type="file" name="file"></div>';
		str += '<input type="submit" value="후기수정" class="updateFeedbackBtn">';
		str += '<input type="button" value="취소" class="cancelFeedbackBtn">';
		str += '</form>';
		/* row 밑에 태그를 붙혀준다. */
 		row.append(str);
		
	});//끝
	
	
	
	// 상품 사진 포함 후기 등록
	$("#btninsertfeedback").click(function (event) {         
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
// 	        	 //아이탬 코드는 전역변수로 설절되어 있음
				$("#feedbackDiv").remove();
	        	showFeedbackList(itemCode);
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
// 	            alert("실패");      
	         }     
		});  
	}); // 후기등록의 끝
	
	/* 후기수정에서 취소 눌리면 다시 목록을 뿌려주기 */
	/* 취소 기능. */
	$(document).on("click",".cancelFeedbackBtn",function(event){
		$("#feedbackDiv").remove();
		showFeedbackList(itemCode);
	});
	
	// 후기 등록 수정하기
	$(document).on("click",".updateFeedbackBtn",function(event){
// 		alert("확인");
		//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
		event.preventDefault();
		// Get form         
	    var form = $(this).parent()[0];  	    
	    // Create an FormData object          
	    var data = new FormData(form);  
	    
	    $.ajax({             
	    	type: "POST",          
	        enctype: 'multipart/form-data',  
	        url: "/feedback/updateAjax",        
	        data: data,          
	        processData: false,    
	        contentType: false,      
	        cache: false,           
	        timeout: 600000,       
	        success: function () { 
// 	        	 //아이탬 코드는 전역변수로 설정되어 있음
	        	$("#feedbackDiv").remove();
	    		showFeedbackList(itemCode);
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
// 	            alert("실패");      
	         }     
		});  
		
		
	});
	
	/* 후기 삭제 처리 */
	deleteFeedback = function(fbCode){
		$.ajax({
			url:'/feedback/deleteFeedbackAjax',
			type:'post',
			data:{'fbCode':fbCode},
			// result는 콘트롤러에서 넘어오는 객체이다
			//ajax 실행 성공 후 실행 할 코드 작성
			success:function(result){
				$("#feedbackDiv").remove();
	    		showFeedbackList(itemCode);
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
	};
	
	
});  // 실행 시 실행되는 구간 끝
	
	
	
	
(function($){
	/* 후기등록과 동시에 후기 폼을 닫아주기 */
	feedBackInsertformClose = function(){
		$('#feedBackInsertform').css("display", "none");
	};
	// 날짜 형식
	dateFormet = function(date){
		result = new Date(date);
		var yyyy = result.getFullYear();
		var mm = result.getMonth() + 1;
		var dd = result.getDate();
		var hh = result.getHours();
		var mi = result.getMinutes();
		return yyyy + "." + mm + "." + dd + "(" + hh + ":" + mi + ")";
	} //날짜 형식 함수 끝	
	
	
   
})(jQuery);

</script>
<script type="text/javascript" src="/resources/board/js/feedback.js"></script>
</head>
<body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<div class="row justify-content-center formDiv">
		<div class="col-9">
	<h1>상품 상세 보기 페이지</h1>
	<h2>후기 등록하기</h2>
	<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#demo">후기등록 열기/닫기</button>
	<div id="demo" class="collapse">
			<!-- 세로운 디자인의 폼태그 -->
			<div>
				<form method="post" enctype="multipart/form-data" id="fileUploadForm">
					<input type="hidden" value="${param.itemCode }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 -->
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text">제목 : </span> 
						<input type="text" class="form-control" name="title">
					</div>
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text">작성자 : </span> 
						<input type="text" class="form-control" name="id">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">내용 : </span>
						<textarea rows="5" class="form-control" style="resize: none;" name="content"></textarea>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">사진 첨부 : </span> 
						<input type="file" class="form-control" required>
					</div>
					<div class="text-center">
						<input type="submit" class="btn btn-primary mt-2" value="후기등록">
						<input type="button" class="btn btn-primary mt-2" value="취소" id="cancelFeedbackForm">
					</div>
				</form>
			</div>
	<!-- 세로운 디자인의 폼태그 끝!!!!!!!!!!!!-->
	</div>

	<div>
		<input type="button" value="후기등록 열기/닫기" class="btn btn-primary" id="feedBackButton">
	</div>


	<div id="feedBackInsertform" style="display: none;">
		<form  method="post" enctype="multipart/form-data" id="fileUploadForm">
			<input type="hidden" value="${param.itemCode }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 -->
			<div>제목(상품후기) : <input type="text" name="title"></div>
			<div>작성자(상품후기) : <input type="text" name="id"></div>
			<div>내용 (상품후기) : </div>
			<div><textarea rows="10" cols="50" name="content"></textarea></div>
			<div>사진 첨부(상품후기) : <input type="file" name="file" required="required"></div>	
			<input type="submit" value="후기등록" onclick="feedBackInsertformClose();" id="btninsertfeedback">
		</form>
	</div>


		</div>
	</div>
</body>
</html>