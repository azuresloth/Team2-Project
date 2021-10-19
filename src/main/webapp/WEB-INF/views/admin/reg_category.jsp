<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.category{
	margin-left: 300px;
}
.container{
	margin-top: 100px;
}
</style>
</head>
<body>
<div class="container justify-content-md-center">
	<div class="row">
	<form action="/admin/regCategory" method="post">
		<div class="mb-3 mt-2 col-6 category">
			<label for="formGroupExampleInput" class="form-label justify-content-center">카테고리 등록</label> 
			<div class="input-group mb-3">
			  <input type="text" name="category" class="form-control" placeholder="등록할 카테고리의 이름을 입력해주세요" aria-label="등록" aria-describedby="button-addon2">
			  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">등록</button>
			</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>