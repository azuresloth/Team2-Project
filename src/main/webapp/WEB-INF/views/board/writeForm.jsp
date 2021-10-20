<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기 폼</h1>
	<form action="/board/write" method="post">
		<div>
			작성자 : <input type="text" required name="writer">
		</div>
		<div>
			제목 : <input type="text" required name="title">
		</div>	
		<div>
			<div>내용 : </div>
			<div><textarea rows="20" cols="50" name="content" required></textarea></div>
		</div>
		<div>
			<input type="submit" value="글등록" class="btn btn-primary">
		</div>
	</form>
</body>
</html>