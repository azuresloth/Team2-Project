<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<table class="table table-striped text-center">
		<thead>
				<tr>
					<th scope="col">회원이름</th>
					<th scope="col">회원 ID</th>
					<th scope="col">회원 가입일자</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<c:forEach items="${memberList }" var="memberInfo">
				<tr>
					<td><a href="/admin/selectMemberDetail?id=${memberInfo.id }">${memberInfo.name }</a></td>
					<td>${memberInfo.id }</td>
					<td>${memberInfo.joinDate} </td>
					<td><input type="button" value="삭제" class="btn btn-primary btn-sm"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>