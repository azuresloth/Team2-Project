<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/interceptLogin.js?ver2"></script>
<!-- 
<script type="text/javascript">
	
	var result = ${loginResult};
	if(result == '0') {
		alert('로그인 정보가 잘못 되었습니다.  \n아이디 혹은 비밀번호를 확인해 주세요.')
	}
</script>
 -->
 <script type="text/javascript">
 	

	 
 
 </script>
<link rel="stylesheet" href="/resources/member/css/login.css">
</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/interceptLogin" method="post" id="interceptLoginForm">
				<input type="hidden" name="requestURI" value="${requestURI }"> 
				<div style="margin-top: 20px;"></div>
				<div>
					<span style="font-size: 20px;">로그인</span>
				</div>
				<div style="margin-top: 20px;"></div>
					<div >
						<div>
							아이디    <input type="text" name="id" id="id" class="form-control"required autofocus>
						</div>
						<div>
							비밀번호  <input type="password" name="pw" id="pw" class="form-control" onkeyup="enterkey()"  required>
						</div>
					</div>
				<c:if test="${loginResult == 0}">
					<div class="login_warn" > 아이디 혹은 비밀번호를 확인해주세요 </div>
				</c:if>
				
				<div style="margin-top: 20px; "></div>
				
				<div class="d-grid gap-2 col-12 ">
				  <button class="btn btn-primary d-grid gap-2 col-12 " type="button"  id="loginBtn" onclick="interceptLogin();" >login</button>
				</div>
			</form>
				<div style="margin-top: 20px;"></div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary me-md-2" type="button"  id="findIdBtn" onclick="findIdForm();">ID 찾기</button>
				  <button class="btn btn-primary" type="button" onclick="findPwForm();" id="findPwBtn">Password 찾기</button>
				</div>
				
								
			
		</div>
	</div>
</body>
</html>
