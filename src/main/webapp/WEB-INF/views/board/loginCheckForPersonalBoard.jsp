<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginInfo }">
		<script type="text/javascript">
			alert("로그인후 이용 가능합니다.");
			location.href = '/item/mainPage';
		</script>
	</c:if>
	<c:if test="${not empty sessionScope.loginInfo }">
		<script type="text/javascript">
			location.href = '/board/personalBoard';
		</script>
	</c:if>

</body>
</html>