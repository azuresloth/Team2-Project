<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 새로운 글쓰기 폼 시작 -->
	<div class="row justify-content-center writeDiv">
		<div class="col-9">
			<h1>글등록 폼</h1>
			<form action="/board/write" method="post">
				<!-- 전달하는 데이터 -->
				<input type="hidden" value="${sessionScope.loginInfo.isAdmin }" name="isAdmin">
				<!-- 전달하는 데이터 -->
				
				<div class="mb-3 mt-3">
					<label for="writer" class="form-label">작성자:</label> 
					<input type="text" class="form-control" id="writer" value="${sessionScope.loginInfo.id }" readonly="readonly" name="writer">
				</div>
				<div class="mb-3">
					<label for="title" class="form-label">제목:</label> 
					<input type="text" class="form-control" id="title" name="title">
				</div>
				<div class="mb-3 mt-3">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="5" id="content" name="content"></textarea>
				</div>
				<input type="submit" class="btn btn-primary" value="글등록">
				<input type="button" class="btn btn-primary" value="뒤로가기" onclick="location.href='/board/boardList';">
			</form>
		</div>
	</div>
	<!-- 새로운 글쓰기 폼 끝 -->
</body>
</html>