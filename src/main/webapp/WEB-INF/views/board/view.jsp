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
<script type="text/javascript" src="/resources/board/js/reply.js"></script>
<script type="text/javascript">
/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	// 자바 스크립트 에서 이런식으로 받는다.
	var boardNum = '${boardVO.boardNum}';
	showReplyList(boardNum);
});

/* 함수선언 영역*/
(function($){
     
   //이벤트 처리
 	//$(document).on('click', '#id', function() {
     //});
    
 	//ajax 사용
// 	$.ajax({
//         url: '', //요청경로
//         type: 'post',
//         data:{}, //필요한 데이터
//         success: function(result) {
//         	//ajax 실행 성공 시 실행되는 구간
//         	alert('성공');
//         },
//         error: function(){
//         	//ajax 실행 실패 시 실행되는 구간
//         	alert('실패');
//         }
 //  });
})(jQuery);
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
				<!-- 임시로 아이디가 게시판 등록한 사람과 로그인 한사람이 같으면 수정 삭제를 버튼이 나오도록 하였음 -->
				<c:if test="${sessionScope.loginInfo.id eq boardVO.writer }">
					<a href="/board/updateForm?boardNum=${boardVO.boardNum }&page=${param.page }&perPageRowNum=${param.perPageRowNum}
						&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">수정</a>
					<a href="/board/delete?boardNum=${boardVO.boardNum }" class="btn btn-primary">삭제</a>
				</c:if>
				<a href="/board/boardList?page=${param.page }&perPageRowNum=${param.perPageRowNum}
					&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">뒤로가기</a>
			</div>



			<!-- 댓글 등록하기 -->
			<div class="text-end replyDiv">
				<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#demo">댓글등록 창 열기</button>
					<input type="hidden" value="${param.boardNum }" id="boardNumInput">
					<div id="demo" class="collapse">
						<div class="input-group mt-3 input-group-sm">
	   						<span class="input-group-text">작성자 : </span>
	  						<input type="text" class="form-control" value="${sessionScope.loginInfo.id }" readonly id="idInput">
						</div>
						
						<div class="input-group mt-3 input-group-sm">
	   						<span class="input-group-text">댓글 : </span>
	  						<textarea class="form-control h-5" rows="5" style="resize: none;" id="contentInput"></textarea>
						</div>
						<input class="btn btn-primary mt-2" type="button" value="댓글 등록" id="insertReplyBtn">
					</div>
			</div>
			<!-- 댓글 등록 하기 끝!!!! -->
			
						<!-- 여기에 ajax로 목록 보기가 들어온다. -->
			<div class="mt-2">
				<input type="hidden" value="${boardVO.boardNum}" id="boardNumInput">
				<ul class="list-group" id="replyListUl">
					<!-- 아작스로 뿌려주는곳 -->
					<li class="list-group-item">
						<div>
							<strong>작성자 : </strong>
							하하하
							<span class="pull-right">
								2021-11-04
							</span>
						</div>
						<div style="background-color: #e9ecef">
							<strong>댓글 : </strong>
							댓글 내용 
						</div>
						<div class="pull-right mt-1">
							<input type="button" value="수정">
							<input type="button" value="삭제">
						</div>
					</li>
					<!-- 아작스로 뿌려주는곳 끝-->
				</ul>
			</div>
			<!-- 여기에 ajax로 목록 보기가 들어온다. 끝!!!!!!!!!!!! -->
			
			
		</div>
	</div>
	<!-- 새로운 디자인 끝 -->
	
		
</body>
</html>


















