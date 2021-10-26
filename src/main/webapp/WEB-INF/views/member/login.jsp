<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/login.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
 </script>
 
<link rel="stylesheet" href="/resources/member/css/login.css">
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
						<div>
							아이디    <input type="text" name="id" id="id" class="form-control"required>
						</div>
						<div>
							비밀번호  <input type="password" name="pw" id="pw" class="form-control" required>
						</div>
					</div>
				<c:if test="${result == 0}">
					<div class="login_warn" > 아이디 혹은 비밀번호를 확인해주세요 </div>
				</c:if>
				
				<div style="margin-top: 20px; "></div>
				
				<div class="d-grid gap-2 col-12 mx-auto">
				<input type="submit" value="로그인">
				  <button class="loginBtn" type="button" >login</button>
				  <button class="btn btn-primary" type="button" onclick="findInfo();">ID/Password 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>