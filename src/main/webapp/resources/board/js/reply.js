/* 페이지 로딩 후 실행 */
$(document).ready(function() {
	
});

/* 함수선언 영역 */
(function($) {
	// 댓글 리스트 뿌려주기 
	showReplyList = function(boardNum) {
		// ajax 사용
		$.ajax({
			url : '/reply/selectReplyListAjax', // 요청경로
			type : 'post',
			data : {'boardNum' : boardNum}, // 필요한 데이터
			success : function(result) {
				// ajax 실행 성공 시 실행되는 구간
				var str = "";
				
				if(result == ""){
					str += 	"<li class='list-group-item'>";
					str += 		"<div>아직 등록된 댓글이 없습니다.</div>";
					str += 	"</li>";
					
				}
				else{
					$(result).each(function(index,element){
						str += 	"<li class='list-group-item'>";
						str += 		"<div>";
						str += 			"<strong>작성자 : </strong>";
						str += 			element.writer;
						str += 			"<span class='pull-right'>";
						str += 				dateFormet(element.createDate);
						str += 			"</span>";
						str += 		"</div>";
						str += 		"<div style='background-color: #e9ecef'>";
						str += 			"<strong>댓글 : </strong>";
						str += 			element.content;
						str += 		"</div>";
						str += 		"<div class='pull-right mt-1'>";
						str += 			"<input type='button' value='수정' onclick='changeUpdateForm(\"" + element.replyCode + "\");'>";
						str += 			"<input type='button' value='삭제'>";
						str += 		"</div>";
						str += 	"</li>";
					});
				}
				//비우고
				$("#replyListUl").empty();
				//태그 주입
				$("#replyListUl").append(str);
				
			},
			error : function() {
				// ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	};
	// 댓글 리스트 뿌려주기 끝!!!!
	
	// 댓글 등록 처리
	$(document).on('click', '#insertReplyBtn', function() {
		var boardNum = $("#boardNumInput").val();
		var writer = $("#idInput").val();
		var content = $("#contentInput").val();
		 //인써트 할때 값가져오기
		// ajax 사용
		$.ajax({
			url : '/reply/insertReplyAjax', // 요청경로
			type : 'post',
			data : {'boardNum' : boardNum,
					'writer' : writer,
					'content' : content
					}, // 필요한 데이터 변수명에 '(홑 따옴표 붙혀주기)
			success : function(result) {
				if(result == 1){
					alert('댓글이 등록되었습니다.');
				}else{
					alert('등록 실패');
				}
				// collapse 창 닫아 주는 함수
				$(".collapse").collapse("hide");
				//비우고
				$("#contentInput").val("");
				showReplyList(boardNum);
			},
			error : function() {
				// ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
	// 댓글 등록 처리 끝!!!!!!!!!!!!
	
	// 업데이트 폼으로 바꾸어 주기-----------------------------------
	changeUpdateForm = function(replyCode){
		alert(replyCode);
	};
	
	// 업데이트 폼으로 바꾸어 끝!!!!!!!!!!!!!!!!-----------------------------------
	

//	// ajax 사용
//	$.ajax({
//		url : '', // 요청경로
//		type : 'post',
//		data : {}, // 필요한 데이터
//		success : function(result) {
//			// ajax 실행 성공 시 실행되는 구간
//			alert('성공');
//		},
//		error : function() {
//			// ajax 실행 실패 시 실행되는 구간
//			alert('실패');
//		}
//	});
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