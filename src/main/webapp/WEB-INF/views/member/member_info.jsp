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
<style type="text/css">
	input {
		padding: 2px 0 2px 0;
	}
	.memberInfoTitleDiv{
		width: 100%;
	}
	.withdrawalBtn{
		float: right;
	}
</style>

</head>
<body>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							> <a href="/member/goMemberInfo">회원정보수정</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<form action="/member/updateInfo" method="post">
		<div class="row px-2 mt-5 justify-content-center">
			<div class="col-10 justify-content-center text-start memberInfoDiv">
				<div id="title">
					<h4 class="memberInfoTitleDiv botBorder-1b pb-2 pe-5 mb-3">회원정보 관리</h4>
				</div>
				<div id="body">
				<c:choose>
					<c:when test="${not empty memberInfo.id}">
						<div class="botBorder-ef">
							${memberInfo.name }님  저희 쇼핑몰을 이용해주셔서 감사합니다.
							<input type="hidden" name="name" value="${memberInfo.name }">
						</div>
						<div class="row">
							<div class="ps-0 pb-1 botBorder-ef">
								<div class="col-2 fs-6 mt-2">아이디</div>
								<div class="col-10 "><input type="text" name="id" value="${memberInfo.id }" readonly></div>
							</div>
							<div class="ps-0 pb-1 botBorder-ef">
								<div class="fs-6 mt-2">주소</div>
									<div>
										<input type="text" id="sample4_postcode"  name="postCode" value="${memberInfo.postCode }">
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기 " ><br>
										<input type="text" id="sample4_roadAddress" value="${memberInfo.roadAddr }" name="roadAddr" >
										<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  > 
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" id="sample4_detailAddress" value="${memberInfo.detailAddr }" name="detailAddr">
									    <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  >
									</div>
							</div>
							<div class="ps-0 pb-1 botBorder-ef">
								<div class="fs-6 mt-2">연락처</div>
								<div>
									<select id="tell1" name="tells">
										<c:if test="${not empty memberInfo}">
											<option value="${memberInfo.tells[0]}">${memberInfo.tells[0]}(기존)</option>
										</c:if>
										<option value="010" selected >010</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> -
								  	<input type="text"  id="tell2" name="tells" value="${memberInfo.tells[1]}" required maxlength="4"> -
								  	<input type="text"  id="tell3" name="tells" value="${memberInfo.tells[2]}" required maxlength="4">
								</div>
							</div>
							<div class="ps-0 pb-1 botBorder-ef">
								<div class="fs-6 mt-2">이메일</div>
								<input type="text" id="mail1" name="mailes" class="form-control value="${memberInfo.mailes[0]}"> @
								<input type="text" id="mail2" name="mailes" class="form-control value="${memberInfo.mailes[1]}">
							</div>
						</div>	
					</c:when>
				</c:choose>
					<button type="submit" class="btn btn-primary fs-6 mt-2" >수정하기</button>	
					<button type="button" id="deleteMember" class="btn btn-outline-danger fs-6 mt-2 withdrawalBtn" >회원탈퇴</button>	
				</div>
			</div>
		</div>
	</form>
</body>
</html>
