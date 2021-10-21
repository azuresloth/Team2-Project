<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?var=8"></script>
</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/join" method="post" class="row g-3">
				<div class="">기본정보
				<div class="row">
					<div class="col-md-7">아이디 
						<input type="text" id="id" required name="id" > 
						<input type="button" class="btn btn-info" id="btn"  onclick="checkId();" value="중복확인"> 
					</div>
					<div id="checkIdDiv" class="col-md-3"> 
					</div>
				</div>
					
					 
					<div>비밀번호 <input type="password" id="pw"  required name="pw" > </div>
					<div>비밀번호 확인 <input type="password" required> </div>
					<div>이름  <input type="text" id="name"  name="name" required> </div>
					<div>연락처 <select id="tell1" name="tell">
									<option value="010" selected >010</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select> <input type="text" id="tell2" name="tell" required>-<input type="text" name="tell" id="tell3" required> </div>
					<div>주소 <input type="text" id="addr" name="addr" required></div>
					<div>생년월일 <input type="date" id="birthday" name="birthday" required></div>
				</div>
				<div>
					추가정보
					<div>이메일<input type="text" id="email" name="email">@<select>
																	<option value="naver.com" selected >naver.com</option>				
																	<option value="gmail.com">gmail.com</option>				
																	<option value="daum.net">daum.net</option>				
																	<option> 직접입력 </option> <!-- 선택시 직접입력 가능  -->
															</select>
					</div>
					<div>성별 <input type="radio" value="남" checked name="gender">남 <input type="radio" value="여" name="gender" disabled="disabled">여 </div>
				</div>
				<div class="d-grid gap-1">
				  <button class="btn btn-primary disabled" id="joinBtn" type="submit" value="회원가입"  > 회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>