<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/findPw" method="post" id="findIdForm">
			
				<div style="margin-top: 20px;"></div>
				<div>
					<span style="font-size: 20px;">ID찾기</span>
				</div>
				<div style="margin-top: 20px;"></div>
					<div >
						<div>
							아이디   <input type="text" name="name" id="name" class="form-control" autocomplete="OFF" required >
						</div>
						<div>
							이메일  <input type="text" name="email" id="email" class="form-control" autocomplete="OFF" required>
						</div>
						<div>
							<input type="text" autocomplete="OFF" required disabled> <in>
						</div>
					</div>
				
				<div style="margin-top: 20px;"></div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary" type="submit"  id="findPwBtn">찾기</button>
				</div>
				
								
			</form>
</body>
</html>