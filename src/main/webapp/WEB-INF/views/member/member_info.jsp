<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/member_info.js?var=3"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<div>
	<form action="/member/updateInfo" method="post">
		<div id="title">
			<div>회원정보 관리</div>
		</div>
		<div hr style="border: 1px solid silver;" width="90%"></div> <!-- 구분선 -->
		<div id="body">
		<c:choose>
			<c:when test="${not empty memberInfo.id}">
				<div>
					${memberInfo.name }님  저희 쇼핑몰을 이용해주셔서 감사합니다.
					<input type="hidden" name="name" value="${memberInfo.name }">
				</div>
				<div class="row">
					<div>
						<div class="col-2">아이디</div>
						<div class="col-10"><input type="text" name="id" value="${memberInfo.id }" readonly></div>
					</div>
					<div>
						<div>주소</div>
							<div>
								<input type="text" id="sample4_postcode"  name="postCode" value="${memberInfo.postCode }">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기 " ><br>
								<input type="text" id="sample4_roadAddress" value="${memberInfo.roadAddr }" name="roadAddr" >
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소" hidden > 
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" value="${memberInfo.detailAddr }" name="detailAddr">
							    <input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden >
							</div>
					</div>
					<div>
						<div>연락처</div>
						<div><input type="text" name="tell" value="${memberInfo.tell }"> </div>
					</div>
					<div>
						<div>이메일</div>
						<div><input type="text" name="email" value="${memberInfo.email }"></div>
					</div>
				</div>	
			</c:when>
		</c:choose>
			<button type="submit">수정하기</button>	
			<button type="button" id="deleteMember" >회원탈퇴</button>	
		</div>
		</form>
	</div>
</body>
</html>
