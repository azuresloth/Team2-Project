/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	var itemCode = $("#itemCodeInput").val();
	// alert(itemCode);
	showFeedbackList(itemCode);
	
	// 후기 등록 폼 태그에 취소를 눌리면
	$(document).on('click', '#cancelFeedbackFormBtn', function() {
		// 콜렙스 태그를 닫아주고
		$(".collapse").collapse("hide");
		//안에 있는 내용을 초기화 시켜 주기
		document.getElementById('fileUploadForm').reset();
	});
	// 후기 등록 폼 태그에 취소를 눌리면 끝!!!!!!!!!!!!!!!!!!!!!

	
	// 후기 등록(사진 포함)
	$("#insertFeedbackBtn").click(function (event) {         
		//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
		event.preventDefault();
		// 아이탬 코드 가져오기
		var itemCode = $("#itemCodeInput").val();
		
		// alert(itemCode); // 아이탬 코드 확인 함
		
	    // Get form
		// 폼태그를 지정해주어야 한다.
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
	        async:false,
	        success: function () { 
	        	// 콜렙스 태그를 닫아주고
	    		$(".collapse").collapse("hide");
	    		//안에 있는 내용을 초기화 시켜 주기
	    		document.getElementById('fileUploadForm').reset();
 	        	//아이탬 코드 넣어주면 후기 리스트를 받아서 후기 리스트 가들어가는 div에 넣어주는 함수.
	    		alert("상품후기를 등록하였습니다.");
	    		
//	    		setTimeout(function() {
//	    			showFeedbackList(itemCode);
//					}, 3000);
	    		
	    		showFeedbackList(itemCode);
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
 	            //alert("실패");      
	         }     
		});  
	});
	// 후기 등록(사진 포함) 끝!!!!!!!!!!!!!!!!!!!!!!!!
	
	// 후기 등록 삭제 처리 시작
	$(document).on('click', '.deleteFeedbackBtn', function() {
		
		// 아이디가 일치 한지 먼저 체크 하기
		var loginId = $("#loginId").val();
		var replyId = $(this).parent().prev().prev().children(":first").children(":first").text();
		// alert("loginId : " + loginId);
		// alert("replyId : " + replyId);
		
		var isAdmin = $("#loginIsAdmin").val();;
		
		if (isAdmin != 'Y' || isAdmin == ""){
			if(loginId != replyId){
				var msg = (isAdmin == "N") ? "다른사람의 댓글은 삭제 할 수없습니다." : "로그인 해주세요.";
				alert(msg);
				return ;
			}
		}
		
		var fbCode = $(this).prev().prev().val();
		// alert(fbCode);
		// showFeedbackList에 사용할 아이탬 코드 가져오기
		var itemCode = $("#itemCodeInput").val();
		//alert(itemCode);
		
		$.ajax({
			url:'/feedback/deleteFeedbackAjax',
			type:'post',
			async:false,
			data:{'fbCode':fbCode},
			// result는 콘트롤러에서 넘어오는 객체이다
			//ajax 실행 성공 후 실행 할 코드 작성
			success:function(result){
				alert("삭제하였습니다.");
				// 아이탬 코드 넣어주기
				
				
	    		showFeedbackList(itemCode);
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
		
	});
	// 후기 등록 삭제 처리 끝!!!!!!!!!!!!!!!!!!!!
	
	// 후기 수정 폼으로 바꾸어 주기
	$(document).on('click', '.updateFormFeedbackBtn', function(event) {
		// 아이디가 일치 한지 먼저 체크 하기
		var loginId = $("#loginId").val();
		var replyId = $(this).parent().prev().prev().children(":first").children(":first").text();
		// alert("loginId : " + loginId);
		// alert("replyId : " + replyId);
		
		var isAdmin = $("#loginIsAdmin").val();;
		
		if (isAdmin != 'Y' || isAdmin == ""){
			if(loginId != replyId){
				var msg = (isAdmin == "N") ? "다른사람의 댓글은 수정 할 수없습니다." : "로그인 해주세요.";
				alert(msg);
				return ;
			}
		}
		
		
		// alert("확인");
		// 제목이랑 내용만 일단 들고오기
		var title = $(this).parent().parent().children().eq(0).children().eq(0).children().first().text();
		var content = $(this).parent().prev().children().eq(0).children().first().text();
		//alert(content);
		// alert(title);
		// 제목 인풋 테크로 변경해주기.
		var str = "제목 : <input type='text' style='width: 80%;' value='" + title + "' name='title'>";
		$(this).parent().parent().children().eq(0).children().eq(0).empty();
		$(this).parent().parent().children().eq(0).children().eq(0).append(str);
		// 내용 인풋 태크로 변경해주기.
		str = "내용 : <input type='text' style='width: 90%;' value='" + content + "' name='content'>";
		$(this).parent().prev().children().eq(0).empty();
		$(this).parent().prev().children().eq(0).append(str);
		// 파일 인풋 태그를 추가 해준다.
		str = "<div><input type='file' name='file'></div>";
		$(this).parent().prev().after(str);
		
		// 버튼을 바꾸어 줄꺼다.
		// 삭제 --> 수정 취소
		$(this).next().val("수정취소");
		$(this).next().removeClass("deleteFeedbackBtn");
		$(this).next().addClass("cancelUpdateFeedbackBtn");
		// 수정 --> 수정 완료
		$(this).val("수정완료");
		$(this).removeClass("updateFormFeedbackBtn");
		$(this).addClass("updateFeedbackBtn");
		
		
		//submit 되어 버린다.!!!
		$(this).attr("type", "submit");
		// 수동으로 막아버리기 임시 방편 일단 되게 만들자.
		event.preventDefault();
		
	});
	// 후기 수정 폼으로 바꾸어 주기 끝!!!!!!!!!!!!!!!!
	
	// 수정 취소를 눌리면 시작
	// 1.(쉬운 버젼) 2. (어려운 버젼) DB에서 원본데이터를 가져와서 하나의 줄만 바꾸어주기. 
	$(document).on('click', '.cancelUpdateFeedbackBtn', function() {
		var fbCode = $(this).prev().prev().val();
		
		
		//alert("확인");
		// 수정완료 --> 수정
		$(this).prev().val("수정");
		$(this).prev().removeClass("updateFeedbackBtn");
		$(this).prev().addClass("updateFormFeedbackBtn")
		// 수정 취소 --> 삭제
		$(this).val("삭제");
		$(this).removeClass("cancelUpdateFeedbackBtn");
		$(this).addClass("deleteFeedbackBtn");
		
		 var itemCode = $("#itemCodeInput").val();
		// alert(itemCode);
		 showFeedbackList(itemCode);
		
	});
	// 수정 취소를 눌리면 끝!!!!!!!!!!!!!!!!!!!!!!!!!
	
	// 후기 등록 수정하기!!!!!!!!!!!!!!!
	$(document).on("click",".updateFeedbackBtn",function(event){
 		
		
 		// showFeedbackList에 사용할 아이탬 코드 받아오기
		var itemCode = $("#itemCodeInput").val();
		//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
		event.preventDefault();
		// Get form 
		// 폼 태그를 선택해주기
	    var form = $(this).parent().parent().parent().parent()[0];  	    
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
	        	alert("후기 수정을 완료 하였습니다.");
	        	// 아이탬 코드 받아오기
	    		var itemCode = $("#itemCodeInput").val();
	    		showFeedbackList(itemCode);
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
// 	            alert("실패");      
	         }     
		});  
	});
	// 후기 등록 수정하기 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
});

/* 함수선언 영역*/
(function($){
	
	
	
	
	// showFeedbackList 시작.!!!!!!!!!!!!!!!!!!!!!!!!!
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
					str += "<li class='list-group-item'>아직등록된 상품후기가 없습니다.</li>";
				}else{
					// <li>안의 데이터가 하나의 후기 태그를 만들어준다.
					
					$(result).each(function(index,element){
						str += "<li class='list-group-item'> ";
						str += "<form method='post' enctype='multipart/form-data' class='updateFileUploadForm'>";
						str += "<div class='row'>";
						str += "<div class='col-2'>";
						if(element.attachedFileName == null){
						str += "<img src='http://placehold.it/150x150' />";
						}else{
						str += "<img src='/resources/feedback/images/" + element.attachedFileName + "' height='150px' width='150px' />";
						}
						str += "</div>";
						str += "<div class='col-10'>";
						str += "<div class='row mt-2'>";
						str += "<div class='col-8'>";
						str += "제목 : <span>" + element.title + "</span>";
						str += "</div>";
						str += "<div class='col-4 text-end'>";
						str += "작성일 : <span>" + dateFormet(element.createDate) + "</span>";
						str += "</div>";
						str += "</div>";
						str += "<div class='row'>";
						str += "<div class='col-12'>";
						str += "작성자 : <span>" + element.id + "</span>";
						str += "</div>";
						str += "</div>";
						str += "<div class='row' style='height: 50px;'>";
						str += "<div class='col-12'>";
						str += "내용 : <span>" + element.content + "</span>";
						str += "</div>";
						str += "</div>";
						str += "<div style='float: right;'>";
						str += "<input type='hidden' value='" + element.fbCode + "' name='fbCode'>";
						str += "<input type='button' value='수정' class='btn btn-secondary updateFormFeedbackBtn'>";
						str += "<input type='button' value='삭제' class='btn btn-secondary deleteFeedbackBtn' style='margin-left: 10px;'>";
						str += "</div>";
						str += "</div>";
						str += "</div>";
						str += "</form>";
						str += "</li>";
					});
					
				}
				//태그 주입
				$("#feedbackListUl").empty();
				$('#feedbackListUl').append(str); // 노드 바로 뒤에 태그를 추가한다.
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
		
	} 
	// showFeedbackList 끝.!!!!!!!!!!!!!!!!!!!!!!!!!
	
	// 날짜 형식
	dateFormet = function(date){
		result = new Date(date);
		var yyyy = result.getFullYear();
		var mm = result.getMonth() + 1;
		var dd = result.getDate();
		var hh = result.getHours();
		var mi = result.getMinutes();
		return yyyy + "." + mm + "." + dd + "(" + hh + ":" + mi + ")";
	} 
	//날짜 형식 함수 끝
	

})(jQuery);












