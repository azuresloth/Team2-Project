<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table { text-align: center; }
tr { border-bottom: 1px solid black;}
td { padding: 30px; }
</style>
<script type="text/javascript">
//화면 로딩 후 바로 실행
$(document).ready(function(){
	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
})(jQuery);

</script>
</head>
<body>
	<h1>게시글 보기</h1>
	<table>
		<tr>
			<td>게시글 번호</td>
			<td>${boardVO.boardNum }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${boardVO.readCnt }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>
				<fmt:formatDate value="${boardVO.createDate }" pattern="yyyy 년 M 월 dd 일 (h 시: m 분)"/>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${boardVO.writer }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${boardVO.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${boardVO.content }</td>
		</tr>
	</table>
	<a href="/board/updateForm?boardNum=${boardVO.boardNum }&page=${param.page }&perPageRowNum=${param.perPageRowNum}" class="btn btn-primary">수정</a>
	<a href="/board/delete?boardNum=${boardVO.boardNum }" class="btn btn-primary">삭제</a>
	<a href="/board/boardList?page=${param.page }&perPageRowNum=${param.perPageRowNum}" class="btn btn-primary">뒤로가기</a>
</body>
</html>