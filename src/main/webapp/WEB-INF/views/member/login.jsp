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
				<div>
					<span>로그인</span>
				</div>
				<div>
					<div>
						아이디   : <input type="text" name="id">
					</div>
					<div>
						비밀번호 : <input type="password" name="pw">
					</div>
				</div>

				<div>
					<input type="submit" value="login">
					<input type="button" value="ID/Password 찾기" onclick="findInfo" >
				</div>
			</form>
		</div>
	</div>
</body>
</html>