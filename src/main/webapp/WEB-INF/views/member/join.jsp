<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form action="/member/join" method="post">
			<div>기본정보
				<div>아이디 <input type="text" id="id" required > </div>
				<div> <input type="button" value="중복확인" id="btn" > </div>
				<div>비밀번호 <input type="password" id="pw"  required> </div>
				<div>비밀번호 확인 <input type="password" required> </div>
				<div>이름  <input type="text" id="name"   required> </div>
				<div>연락처 <select id="tell1">
								<option value="010" selected >010</option>
								<option value="016">016</option>
								<option value="017">017</option>
							</select> <input type="text" id="tell2" required>-<input type="text" id="tell3" required> </div>
				<div>주소 <input type="text" id="addr" required></div>
				<div>생년월일 <input type="date" id="birthday" required></div>
			</div>
			<div>
				추가정보
				<div>이메일<input type="text" id="email" >@<select>
																<option>naver.com</option>				
																<option>gmail.com</option>				
																<option>daum.net</option>				
																<option> 직접입력 </option> <!-- 선택시 직접입력 가능  -->
														</select>
				</div>
				<div>성별 <input type="radio" value="남" checked>남 <input type="radio" value="여">여 </div>
			</div>
			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>