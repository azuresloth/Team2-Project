<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<form action="/member/login" method="post">
				<div>
					<span>로그인</span>
				</div>
				<div>
					<div>
						아이디 : <input type="text">
					</div>
					<div>
						비밀번호 : <input type="password">
					</div>
				</div>

				<div>
					<input type="submit" value="login"> 로그인
				</div>
			</form>
		</div>
	</div>
</body>
</html>