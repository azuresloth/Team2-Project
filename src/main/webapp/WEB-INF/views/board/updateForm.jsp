<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글수정 폼</h1>
	<form action="/board/update" method="post">
		<input type="hidden" value="${param.page }" name="page">
		<input type="hidden" value="${param.perPageRowNum }" name="perPageRowNum">
		<input type="hidden" value="${boardVO.boardNum }" name="boardNum"> <!-- 전달하는 데이터 -->
		<input type="hidden" value="${param.searchColunm }" name="searchColunm"> <!-- 전달하는 데이터 -->
		<input type="hidden" value="${param.searchWord }" name="searchWord"> <!-- 전달하는 데이터 -->
		<div>
			작성자 : <input type="text" value="${boardVO.writer }" readonly name="writer">
		</div>
		<div>
			제목 : <input type="text" value="${boardVO.title }" name="title">  <!-- 전달하는 데이터 -->
		</div>	
		<div>
			<div>내용 : </div>
			<div><textarea rows="20" cols="50" name="content">${boardVO.content }</textarea></div>  <!-- 전달하는 데이터 -->
		</div>
		<div>
			<input type="submit" value="수정완료" class="btn btn-primary">
		</div>
	</form>
</body>
</html>