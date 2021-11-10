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
<table class="table table-striped text-center">
	<tr>
		<td>이름</td>
		<td>${memberInfo.name }</td>
		<td>아이디</td>
		<td>${memberInfo.id }</td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td>
			${memberInfo.roadAddr }
			${memberInfo.detailAddr }
		</td>
		<td>전화번호</td>
		<td>${memberInfo.tell }</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${memberInfo.gender }</td>
		<td>이메일</td>
		<td>${memberInfo.email }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${memberInfo.birthday }</td>
		<td>가입일</td>
		<td>${memberInfo.joinDate }</td>
	</tr>
</table>
<div class="d-flex justify-content-end">
	<a href="/admin/memberList?menuCode=MENU_002"><input type="button" value="뒤로가기" class="btn btn-secondary"></a>
</div>
</body>
</html>