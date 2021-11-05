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
<div class="list-group row-2">
	<c:forEach items="${sideMenuList}" var="sideMenu">
	  	<a href="/admin/${sideMenu.menuPass }" class="list-group-item list-group-item-action <c:if test="${sidePage eq sideMenu.menuPass}"> active </c:if> col-1" aria-current="true">
	  		${sideMenu.sideMenuName }
	  	</a>
	</c:forEach>
</div>
</body>
</html>