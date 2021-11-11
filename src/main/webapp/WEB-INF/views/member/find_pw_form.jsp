<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/find_pw_form.js?var=26"></script>
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
							> <a href="/member/goLogin">로그인</a>
						</li>
						<li>
							> <a href="/member/findPwForm">PassWord찾기</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>	
	<div class="row px-2 mt-5 justify-content-center" >
		<div class="col-5 justify-content-center text-start">
			<h4 class="botBorder-1b pb-2 pe-5 mb-3">PassWord찾기</h4>
			<div>
				<div class="ps-0 pb-1 botBorder-ef">
					<div class="col-2 fs-6 mt-2">아이디</div>
					<input type="text" name="id" id="id" class="form-control" required autofocus>
				</div>
				<div class="ps-0 pb-1 botBorder-ef">
					<div class="col-2 fs-6 mt-2">이메일 </div>
					<input type="text" name="email" id="email" class="form-control" autocomplete="OFF" required>
				</div>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary" type="submit" id="findPwBtn" onclick="findPw();">찾기</button>
			</div>
		</div>
	</div>	
</body>
</html>