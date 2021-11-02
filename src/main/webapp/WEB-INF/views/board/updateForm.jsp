<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.updateDiv {
	margin-top: 50px;
}
</style>
</head>
<body>
	<!-- 새로운 글수정 폼 시작 -->
	<div class="row justify-content-center updateDiv">
		<div class="col-9">
			<h1>글수정 폼</h1>
			<form action="/board/update" method="post">
				<!-- 전달하는 데이터 -->
				<input type="hidden" value="${param.page }" name="page"> 
				<input type="hidden" value="${param.perPageRowNum }" name="perPageRowNum">
				<input type="hidden" value="${boardVO.boardNum }" name="boardNum">
				<input type="hidden" value="${param.searchColunm }" name="searchColunm">
				<input type="hidden" value="${param.searchWord }" name="searchWord">
				<!-- 전달하는 데이터 -->
				
				<div class="mb-3 mt-3">
					<label for="writer" class="form-label">작성자:</label> 
					<input type="text" class="form-control" id="writer" value="${boardVO.writer }" readonly="readonly" name="writer">
				</div>
				<div class="mb-3">
					<label for="title" class="form-label">제목:</label> 
					<input type="text" class="form-control" id="title" value="${boardVO.title }" name="title">
				</div>
				<div class="mb-3 mt-3">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="5" id="content" name="content">${boardVO.content }</textarea>
				</div>
				<input type="submit" class="btn btn-primary" value="수정완료">
			</form>
		</div>
	</div>
	<!-- 새로운 글수정 폼 끝 -->
</body>
</html>