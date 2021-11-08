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
						str += 			"<span>" + element.writer + "</span>";
						str += 			"<span class='pull-right'>";
						str += 				dateFormet(element.createDate);
						str += 			"</span>";
						str += 		"</div>";
						str += 		"<div style='background-color: #e9ecef'>";
						str += 			"<strong>댓글 : </strong>";
						str += 			"<span>" + element.content + "</span>";
						str += 		"</div>";
						str += 		"<div class='pull-right mt-1'>";
//						str += 			"<input type='button' value='수정' onclick='changeUpdateForm(\"" + element.replyCode + "\");'>";
						str += 			"<input type='hidden' value='" + element.replyCode + "'>";
						str += 			"<input type='button' value='수정' class='updateReplyForm'>";
						str += 			"<input type='button' value='삭제' class='deleteReply'>";
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
	$(document).on('click', '.updateReplyForm', function() {
		// 아이디가 일치 한지 먼저 체크 하기
		var loginId = $("#idInput").val();
		var replyId = $(this).parent().parent().children(":first").children().eq(1).text();
		// alert("loginId : " + loginId);
		// alert("replyId : " + replyId);
		// 관리자 일때 확인 하기.
		var isAdmin = $("#loginIsAdmin").val();;
		
		if (isAdmin != 'Y' || isAdmin == ""){
			if(loginId != replyId){
				var msg = (isAdmin == "N") ? "다른사람의 댓글은 수정 할 수없습니다." : "로그인 해주세요.";
				alert(msg);
				return ;
			}
		}
		
		
		
		// alert(replyCode);
		// 내용 데이터 받음
		var content = $(this).parent().prev().children().last().text();
		// alert(content);
		// input 태그를 넣을 태그를 선택
		var str1 = "<input type='text' value='" + content + "' style='width: 93%;'>";
		// input 태그 넣기
		$(this).parent().prev().children().last().remove();
		$(this).parent().prev().children().first().after(str1);
		// 수정 완료 넣기
		// 버튼 줄 다시 그리기
		var btnRow = $(this).parent();
		// 수정을 수정 완료로 변경
		btnRow.children().eq(1).val("수정완료");
		btnRow.children().eq(1).removeClass("updateReplyForm"); 	// 기존에 있는 클래스를 지운다.
		btnRow.children().eq(1).addClass("updateReply");			// 새로운 클래스를 추가 해준다.
		
		// 삭제 버튼의 재활용 하여 속성값을 변경해준다.
		btnRow.children().eq(2).val("수정취소");
		btnRow.children().eq(2).removeClass("deleteReply");// 기존에 있는 value에 있는 삭제를 수정취소로 변경해준다.
		btnRow.children().eq(2).addClass("cancelUpdateReply");
		
//		var str2 = "<input type='button' value='수정완료' class='updateReply'>";
//		str2 += "<input type='button' value='수정취소' class='cancelUpdateReply'>";
//		
//		btnRow.append(str2);
	});
	// 업데이트 폼으로 바꾸어 주기 끝!!!!!!!!!!!!!!!!-----------------------------------
	
	// 업데이트 수정 취소버튼 클릭
	$(document).on('click', '.cancelUpdateReply', function() {
		// alert("확인");
		
		// DB에서 원래 내용 데이터를 가지고 오기
		// replyCode를 가지고 온다.
		var replyCode = $(this).prev().prev().val();
		// alert(replyCode);
		var row = $(this);
		
		// ajax 사용
		$.ajax({
			url : '/reply/cancelUpdateReplyAjax', // 요청경로
			type : 'post',
			data : {'replyCode' : replyCode}, // 필요한 데이터
			// 한글처리
			// 이건 안써도 된다.
//			contentType: "application/x-www-form-urlencoded; charset=UTF-8",

			success : function(result) {
				// ajax 실행 성공 시 실행되는 구간
//				alert(result);
				var str = "<span>" + result + "</span>";
				
				// span을 태그를 넣을 태그를 선택
				// input에 새로운 태그 넣기
				row.parent().prev().children().last().remove();
				row.parent().prev().children().first().after(str);
				
				// 수정 완료 랑 수정 취소 버튼을 원래대로 돌려주기.
				//수정 취소버튼을 수정으로 바꾸어주기
				row.val("삭제");
				row.removeClass("cancelUpdateReply");
				row.addClass("deleteReply");
				// 수정 완료 버튼을 수정으로 바꾸어주기
				row.prev().val("수정");
				row.prev().removeClass("updateReply");
				row.prev().addClass("updateReplyForm");
				
			},
			error : function() {
				// ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
	// 업데이트 수정 취소버튼 클릭 끝!!!!!!!!!!!!!!!!
	
	// 업데이트
	$(document).on('click', '.updateReply', function() {
		// input 태그의 수정한 값을 들고온다.
		var replyCode = $(this).prev().val();
		var content = $(this).parent().prev().children().last().val();
//		alert(replyCode);
//		alert(content);
		
		
		//내용만 바꾸어주기
		var str = "<span>" + content + "</span>";
		
		// 변경되어지는 태그 선택해주기.
		$(this).parent().prev().children().last().remove(); // 지우고
		$(this).parent().prev().children().first().after(str); // 넣기
		
		// 버튼 원래대로 해주기
		$(this).next().val("삭제");
		$(this).next().removeClass("cancelUpdateReply");
		$(this).next().addClass("deleteReply");
		
		$(this).val("수정");
		$(this).removeClass("updateReply");
		$(this).addClass("updateReplyForm");
		// update만 하고 와서 알림창만 띄워주기
		// ajax 사용
		$.ajax({
			url : '/reply/updateReplyAjax', // 요청경로
			type : 'post',
			data : {'replyCode' : replyCode,
				'content' : content }, // 필요한 데이터
				success : function(result) {
					// ajax 실행 성공 시 실행되는 구간
					if(result == 1){
						alert('댓글이 수정되었습니다.');
					}else{
						alert('댓글 수정 중 문제가 발생했습니다.');
					}
				},
				error : function() {
					// ajax 실행 실패 시 실행되는 구간
					alert('실패');
				}
		});
		
	});
	//업데이트 끝!!!!!!!!!!!!!!!!!
	
	// 댓글 지우기
	$(document).on('click', '.deleteReply', function() {
		// 아이디가 일치 한지 먼저 체크 하기
		var loginId = $("#idInput").val();
		var replyId = $(this).parent().parent().children(":first").children().eq(1).text();
		// alert(loginId);
		// alert(replyId);
		var isAdmin = $("#loginIsAdmin").val();;
		
		if (isAdmin != 'Y' || isAdmin == ""){
			if(loginId != replyId){
				var msg = (isAdmin == "N") ? "다른사람의 댓글은 삭제 할 수없습니다." : "로그인 해주세요.";
				alert(msg);
				return ;
			}
		}

		var replyCode = $(this).prev().prev().val();
		var boardNum = $("#boardNumInput").val();
//		alert(boardNum);
		
//		alert(replyCode);
		// ajax 사용
		$.ajax({
			url : '/reply/deleteReplyAjax', // 요청경로
			type : 'post',
			data : {'replyCode' : replyCode}, // 필요한 데이터
			success : function(result) {
				// ajax 실행 성공 시 실행되는 구간
//				alert(result);
				if(result == 1) {
					alert("댓글이 삭제되었습니다.");
					showReplyList(boardNum);
				}else{
					alert("댓글이 삭제중 문제 발생!!!.");
					showReplyList(boardNum);
				}
			},
			error : function() {
				// ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	});
	// 댓글 지우기!!!!
	
	
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