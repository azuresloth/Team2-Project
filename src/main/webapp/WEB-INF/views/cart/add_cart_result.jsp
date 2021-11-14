<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var result = confirm('장바구니에 상품이 추가 되었습니다. \n장바구니로 이동하시겠습니까?');
	
	if(result){
		location.href='/cart/goCartList';
	}
	else{
		history.go(-1);
	}
	
</script>
</head>
<body>

</body>
</html>