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
		<div id="title">
			<div>회원정보 관리</div>
		</div>
		<div id="body">
		<c:forEach items="${memberInfo }" var="member">
			<div>${member.name }님  저희 쇼핑몰을 이용해주셔서 감사합니다.</div>
			<div>
				<div>아이디</div>
				<div>${member.id }</div>
			</div>
			<div>
				<div>주소</div>
				<div><input type="text" name="postCode"></div>
				<div><input type="text" name="roadAddr"></div>
				<div><input type="text" name="detailAddr"></div>
			</div>
			<div>
				<div>연락처</div>
				<div><input type="text" name="tell"> </div>
			</div>
			<div>
				<div>이메일</div>
				<div><input type="text" name="email"></div>
			</div>	
			</c:forEach>		
		</div>
	</div>
</body>
</html>
