<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	<!-- feedback.js -->
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/board/css/view.css?ver=2">
<script type="text/javascript" src="/resources/feedback/js/feedback.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 후기작성 폼 열고 닫는 버튼 기능
	$('#openFeedBackForm').click(function(e) {
// 		alert("확인");
		e.preventDefault();
	     if($("#feedbackDiv").css("display") == "none"){   
	         $('#feedbackDiv').css("display", "block");   
	     } else {  
	         $('#feedbackDiv').css("display", "none");   
	     }  
	});// 끝

	// 화면에 바로 후기 목록 뿌려주기
	var itemCode = $("#itemCodeTd").text();
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
				if(result == null){
					str += "아직등록된 상품후기가 없습니다.";
				}else{
					// 데이터가 있으면 태그를 만들어준다.
					str += "<h2> 아작스 작성자 상품 후기</h2>";
					str += "<table>";
					
					$(result).each(function(index,element){
					str += "<tr>";
					str += "<td>" + element.title + "</td>";
					str += "<td>";
 						//시간 관련 함수
					str += dateFormet(element.createDate);
//  					str += new Date(element.createDate);
					str += "</td>";
					str += "<td>작성자 : " + element.id + "</td>";
					str += "<td><input type='button' class='btn btn btn-secondary' value='수정'></td>";
					str += "<td><input type='button' class='btn btn btn-secondary' value='삭제'></td>";
					
					str += "</tr>";
					str += "<tr>";
					str += "<td>";
					str += "<img src='/resources/feedback/images/" + element.attachedFileName + "' height='100px'>";
					str += "</td>";
					str += "<td colspan='3'>" + element.content + "</td>";
					str += "</tr>";
					
					});
					str += "</table>";
				}
				//태그 주입
				$('#feedbackAjax').append(str);
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
		
	} // showFeedbackList 끝.
	// 후기 목록 뿌리기 함수 실행
	showFeedbackList(itemCode);
	

//함수 선언 영역
(function($){
	
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
	<!-- 새로운 디자인 -->
	<div class="row justify-content-center viewDiv">
		<div class="col-9">
			<div class="row boardTitleDiv ">
				<div class="col-2 d-flex align-items-center justify-content-center">제목</div>
				<div class="col-10 text-start">${boardVO.title }</div>
			</div>
			<div class="row boardInfoDiv">
				<div class="col-2 d-flex align-items-center justify-content-center">작성자</div>
				<div class="col-2 d-flex align-items-center">${boardVO.writer }</div>
				<div class="col-2 d-flex align-items-center justify-content-center">조회수</div>
				<div class="col-2 d-flex align-items-center">${boardVO.readCnt }</div>
				<div class="col-2 d-flex align-items-center justify-content-center">작성일</div>
				<div class="col-2">
					<div>
						<fmt:formatDate value="${boardVO.createDate }" pattern="yyyy년 M월 dd일"/>
					</div>
					<div>
						<fmt:formatDate value="${boardVO.createDate }" pattern="(h시:m분)"/>
					</div>
				</div>
			</div>
			<div class="row boardContentDiv">
				<div class="col-12">${boardVO.content }</div>
			</div>
			<div class="m-2">
				<a href="/board/updateForm?boardNum=${boardVO.boardNum }&page=${param.page }&perPageRowNum=${param.perPageRowNum}
					&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">수정</a>
				<a href="/board/delete?boardNum=${boardVO.boardNum }" class="btn btn-primary">삭제</a>
				<a href="/board/boardList?page=${param.page }&perPageRowNum=${param.perPageRowNum}
					&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">뒤로가기</a>
			</div>
			
			<div class="replyDiv">
				<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#demo">댓글등록</button>
				<div id="demo" class="collapse">
					<div class="input-group mt-3 input-group-sm">
   						<span class="input-group-text">작성자 : </span>
  						<input type="text" class="form-control">
					</div>
					
					<div class="input-group mt-3 input-group-sm">
   						<span class="input-group-text">댓글 : </span>
  						<textarea type="text" class="form-control h-5" rows="5" name="replyContent"></textarea>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-end">
				<div>
					<a class="btn btn-secondary" id="openFeedBackForm" href="#">후기작성폼열기/닫기</a>
				</div>
				<div id="feedbackDiv" style="display: none;">
					<form action="/feedback/insert" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${boardVO.boardNum }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 -->
						<div>제목(상품후기) : <input type="text" name="title"></div>
						<div>작성자(상품후기) : <input type="text" name="id"></div>
						<div>내용 (상품후기) : </div>
						<div><textarea rows="10" cols="50" name="content"></textarea></div>
						<div>사진 첨부(상품후기) : <input type="file" name="file"> </div>	
						<input type="submit" value="후기등록">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 새로운 디자인 끝 -->
	
	
	<div id="feedbackAjax">	<!-- 여기에 ajax로 목록 보기가 들어온다. -->
	
	</div>
		
</body>
</html>


















