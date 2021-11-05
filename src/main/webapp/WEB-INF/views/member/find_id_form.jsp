<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/find_id_form.js?var=1"></script>

</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/findId" method="post" id="findIdForm">
			
				<div style="margin-top: 20px;"></div>
				<div>
					<span style="font-size: 20px;">ID찾기</span>
				</div>
				<div style="margin-top: 20px;"></div>
					<div >
						<div>
							이름   <input type="text" name="name" id="name" class="form-control" autocomplete="OFF" required autofocus>
						</div>
						<div>
							이메일  <input type="text" name="email" id="email" class="form-control" autocomplete="OFF" required>
						</div>
					</div>
				
				<div style="margin-top: 20px;"></div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  <button class="btn btn-primary" type="submit"  id="findIdBtn">찾기</button>
				  <!-- <button class="btn btn-primary" type="button" onclick="findPwForm();" id="findPwBtn">Password 찾기</button> -->
				</div>
				
								
			</form>
		</div>
	</div>
</body>
</html>