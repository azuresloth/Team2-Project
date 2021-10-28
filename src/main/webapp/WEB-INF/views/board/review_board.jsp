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
	alert(itemCode);
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
				if(result == null){
					str += "아직등록된 상품후기가 없습니다.";
				}else{
					// 데이터가 있으면 태그를 만들어준다.
					str += "<h2> 아작스 작성자 상품 후기</h2>";
					str += "<table>";
					
					$(result).each(function(index,element){
					str += "<tr class='feedbackTr'>";
					/* feedback 코트 */
					str += "<input type='hidden' value=" + element.fbCode + " name='fbCode'>";
					str += "<td class='feedbackTdTitle'>" + element.title + "</td>";
					//시간 관련 함수
					str += "<td class='feedbackTdCreateDate'>" + dateFormet(element.createDate)+ "</td>";
					//str += new Date(element.createDate);
					str += "<td class='feedbackTdId'>작성자 : <span>" + element.id + "</span></td>";
					str += "<td><input type='button' class='btn btn btn-secondary updateBtn'  value='수정'></td>";
					str += "<td><input type='button' class='btn btn btn-secondary' value='삭제'></td>";
					
					str += "</tr>";
					str += "<tr>";
					str += "<td class='feedbackTdAttachedFileName'>";
					str += "<img src='/resources/feedback/images/" + element.attachedFileName + "' height='100px'>";
					str += "</td>";
					str += "<td colspan='3' class='feedbackTdContent'>" + element.content + "</td>";
					str += "</tr>";
					
					});
					str += "</table>";
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
	
	// updateBtn 클릭 시
	$(document).on("click",".updateBtn",function(){
		var id = $(this).parent().prev().children().text();
		alert(id);
	});
	
	
	
	// 상품 사진 포함 후기 등록
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
	        success: function (result) { 
// 	        	 //아이탬 코드 들고오는지 확인
	        	showFeedbackList(result);
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
// 	            alert("실패");      
	         }     
		});  
	});
	
(function($){
	/* 후기등록과 동시에 후기 폼을 닫아주기 */
	feedBackInsertformClose = function(){
		$('#feedBackInsertform').css("display", "none");
	};
	
	dateFormet = function(date){
		result = new Date(date);
		var yyyy = result.getFullYear();
		var mm = result.getMonth() + 1;
		var dd = result.getDate();
		var hh = result.getHours();
		var mi = result.getMinutes();
		return yyyy + "." + mm + "." + dd + "(" + hh + ":" + mi + ")";
	}	
   
})(jQuery);

});  
</script>
</head>
<body>
	<h1>상품 상세 보기 페이지</h1>
	<h2>후기 등록하기</h2>
	<div>
		<input type="button" value="후기등록 열기/닫기" class="btn btn-primary" id="feedBackButton">
	</div>

	<ul class="list-group">
		
		<li class="list-group-item">
			<form action="">
				<div class="row feedbackRow">
					<div class="col-2">
						<img src="http://placehold.it/150x150" />
					</div>
				</div>
			</form>
		</li>
		
	</ul>


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