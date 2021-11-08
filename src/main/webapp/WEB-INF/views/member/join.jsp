<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?var=46"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/member/css/join.css?ver=1">

</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/join" method="post" class="row g-3" id="joinForm" onsubmit="return false" >
				<div class="">기본정보
				<div></div>
				아이디 
				<div class="row">
					<div class="col-9">
						<input type="text" id="id" required name="id" class="form-control" autofocus> 
					</div>
					<div id="checkIdDiv" class="col"> 
						<input type="button" class="btn btn-primary me-md-2 idCheckBtn" id="btn"  onclick="checkId();" value="중복확인" > 
					</div>
				</div>
					<div>비밀번호 <input type="password" id="pw"  required name="pw" class="form-control" m> </div>
					<div>비밀번호 확인 <input type="password" id="pw_1" required class="form-control"> </div>
					<div>이름  <input type="text" id="name"  name="name" required class="form-control"> </div>
					<div>연락처</div>
				<div class="row">
					<div class="col-4">
					<select class="form-select" aria-label="Default select example" id="tell1" name="tells">
					  <option value="010" selected >010</option>
					  <option value="016">016</option>
					  <option value="017">017</option>
					  <option value="019">019</option>
					</select>
					</div>
					 
					<div class="col-4">
				  		<input type="text" class="form-control " id="tell2" name="tells" required maxlength="4">
				  	</div>
				  	<div class="col-4">
				  		 <input type="text" class="form-control" id="tell3" name="tells" required maxlength="4">
				  	</div>
				</div>	
					<div>주소</div>	
						<input type="text" id="sample4_postcode" placeholder="우편번호" name="postCode" >
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기 " ><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddr" >
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" hidden > 
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr">
					    <input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden >
					
							
					<div class="col-12">
						<input type="text" name="birthday" id="birthday" placeholder="ex)19920211" required class="form-control"  maxlength="8" >
						<button class="btn btn-primary" type="button" onclick="birthday1();">확인</button>
					</div>
				<div>
					<div>추가정보</div>
					<div style="margin-top: 10px;"></div>
					
					<div>이메일</div>
					<div class="row emailDiv">
						<div class="col-4">
							<input type="text" id="email" name="mailes" class="form-control">
						</div>
						 @
						<div class="col-5">
							<input type="text" id="email1" name="mailes" class="form-control" placeholder="ex) naver.com">
						</div> 
						<div class="mail_check_wrap">
							<div class="col">
								<input type="button" class="btn btn-primary me-md-2 emailBtn" id="btn2"  value="인증번호발송" onclick="mail_check_btn()">
							</div>
							 <div>인증번호입력</div>
							<div>
								<input type="text" class="form-control " id="verificationCode" disabled maxlength="6">
								<span id="mail_check_input_box_warn" ></span>
							</div>
						</div>	
					</div>
					<div class="mt-3">성별 &nbsp;<input type="radio" value="남" checked name="gender"> 남 <input type="radio" value="여" name="gender"> 여 </div>
				</div>
				<div class="d-grid gap-1">
				  <button class="btn btn-primary " id="joinBtn" type="submit" value="회원가입" onclick="finalJoin();"> 회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>