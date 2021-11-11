<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/interceptLogin.js?ver3"></script>
<!-- 
<script type="text/javascript">
	
	var result = ${loginResult};
	if(result == '0') {
		alert('로그인 정보가 잘못 되었습니다.  \n아이디 혹은 비밀번호를 확인해 주세요.')
	}
</script>
 -->
<link rel="stylesheet" href="/resources/member/css/login.css">
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							> <a href="/member/interceptLogin">로그인</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<form action="/member/interceptLogin" method="post" id="interceptLoginForm">
	<div class="row px-2 mt-5 justify-content-center" >
		<div class="col-5 justify-content-center text-start memberInfoDiv">
			<input type="hidden" value="${sessionScope.loginInfo.id}" id="checkId">
			<input type="hidden" name="requestURI" value="${requestURI }"> 
				<div id="title">
					<h4 class="memberInfoTitleDiv botBorder-1b pb-2 pe-5 mb-3">로그인</h4>
				</div>
				<div class="ps-0 pb-1 botBorder-ef">
					<div class="botBorder-ef">
						<div class="fs-6 mt-2">아이디</div>  
						<input type="text" name="id" id="id" class="form-control"required autofocus>
					</div>
				</div>	
				<div class="ps-0 pb-1 botBorder-ef">			
					<div class="botBorder-ef">
						<div class="fs-6 mt-2">비밀번호 </div>
						<input type="password" name="pw" id="pw" class="form-control" onkeyup="enterkey()"  required>
					</div>
				</div>
					<c:if test="${loginResult == 0}">
						<div class="login_warn" > 아이디 혹은 비밀번호를 확인해주세요 </div>
					</c:if>
				
				
				<div class="d-grid gap-2 col-12 ">
				  <button class="btn btn-primary d-grid gap-2 col-12 " type="button"  id="loginBtn" onclick="interceptLogin();" >login</button>
				</div>
				<div style="margin-top: 20px;"></div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary me-md-2" type="button"  id="findIdBtn" onclick="findIdForm();">ID 찾기</button>
				  <button class="btn btn-primary" type="button" onclick="findPwForm();" id="findPwBtn">Password 찾기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
