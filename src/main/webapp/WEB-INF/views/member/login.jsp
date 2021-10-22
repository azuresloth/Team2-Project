<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/login.js"></script>
</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/login" method="post">
				<div style="margin-top: 20px;"></div>
				<div>
					<span style="font-size: 20px;">로그인</span>
				</div>
				<div style="margin-top: 20px;"></div>
					<div >
						<div >
							아이디    <input type="text" name="id" class="form-control"required>
						</div>
						<div >
							비밀번호  <input type="password" name="pw" class="form-control" required>
						</div>
					</div>
				<div style="margin-top: 10px; "></div>
				<div class="d-grid gap-2 col-12 mx-auto">
				  <button class="btn btn-primary" type="button">login</button>
				  <button class="btn btn-primary" type="button" onclick="findInfo">ID/Password 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>