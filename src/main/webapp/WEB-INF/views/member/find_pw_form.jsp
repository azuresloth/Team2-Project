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
 	<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<div style="margin-top: 20px;"></div>
			<div>
				<span style="font-size: 20px;">PassWord찾기</span>
			</div>
			<div style="margin-top: 20px;"></div>
			<div>
				<div>
					<!-- 이름   <input type="text" name="name" id="name" class="form-control" autocomplete="OFF" required autofocus> -->
					아이디 <input type="text" name="id" id="id" class="form-control" required autofocus>
				</div>
				<div>
					<!-- 이메일  <input type="text" name="email" id="email" class="form-control" autocomplete="OFF" required> -->
					이메일 <input type="text" name="email" id="email" class="form-control" autocomplete="OFF" required>
				</div>
			</div>

			<div style="margin-top: 20px;"></div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary" type="submit" id="findPwBtn" onclick="findPw();">찾기</button>
			</div>
		</div>
	</div>	
</body>
</html>