<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${memberInfo eq null}){
		alert('회원의 정보를 찾을 수 없습니다. \n입력하신 정보를 확인해 주세요');
		location.href="/member/findIdForm";
	}
	else{
		alert('회원님의 아이디는   "${memberInfo.id}"  입니다.');
		location.href="/member/goLogin";
	}
</script>
</head>
<body>

</body>
</html>