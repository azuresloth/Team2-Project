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
<link rel="stylesheet" href="/resources/member/css/join.css?ver=1">

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
							> <a href="/member/goJoin">회원가입</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<form action="/member/join" method="post" class="row g-3" id="joinForm" onsubmit="return false" >
	<div class="row px-2 mt-5 justify-content-center" >
		<div class="col-5 justify-content-center text-start">
				<h4 class="joinTitleDiv botBorder-1b pb-2 pe-5 mb-3">기본정보</h4>
				<div class="ps-0 pb-1 botBorder-ef">
				<div class="fs-6 mt-2">아이디 </div>
				<div class="row">
					
					<div class="col-9 ps-0">
						<input type="text" id="id" required name="id" class="form-control" autofocus> 
					</div>
					<div id="checkIdDiv" class="col px-0"> 
						<input type="button" class="btn btn-primary me-md-2 idCheckBtn" id="btn"  onclick="checkId();" value="중복확인" > 
					</div>
					
				</div>
				</div>
				<div class="ps-0 pb-1 botBorder-ef">
					<div class="fs-6 mt-2">비밀번호 </div>
						<div>
							<input type="password" id="pw"  required name="pw" class="form-control">
						</div>
				</div>
				<div class="ps-0 pb-1 botBorder-ef">			
					<div class="fs-6 mt-2">비밀번호 확인 </div>
						<div>
							<input type="password" id="pw_1" required class="form-control">
						</div> 
				</div>
				<div class="ps-0 pb-1 botBorder-ef">	
					<div class="fs-6 mt-2">이름 </div>
						<div>
							<input type="text" id="name"  name="name" required class="form-control">
						</div>
				</div>		
					<div class="ps-0 pb-1 botBorder-ef">
						<div class="fs-6 mt-2">연락처</div>
						<div class="row">
							<div class="col-4 ps-0 pe-2">
								<select class="form-select" aria-label="Default select example" id="tell1" name="tells">
								  <option value="010" selected >010</option>
								  <option value="016">016</option>
								  <option value="017">017</option>
								  <option value="019">019</option>
								</select>
							</div>
							 
							<div class="col-4 ps-0 pe-2">
						  		<input type="text" class="form-control" id="tell2" name="tells" required maxlength="4">
						  	</div>
						  	<div class="col-4 px-0">
						  		 <input type="text" class="form-control" id="tell3" name="tells" required maxlength="4">
						  	</div>
						</div>
					</div>	
					<div class="ps-0 pb-1 botBorder-ef mb-1">
						<div class="fs-6 mt-2">주소</div>	
						<div class="row">
							<div class="col-4 ps-0">
								<input type="text" class="form-control mb-1" id="sample4_postcode" placeholder="우편번호" name="postCode" >
							</div>
							<div class="col-3">
								<input type="button" class="btn btn-primary py-1 idCheckBtn text-center" onclick="sample4_execDaumPostcode()" value="우편번호 찾기 " ><br>
							</div>
						</div>
					<div class="ps-0 pb-1 botBorder-ef">
						<div>
							<input type="text" class="form-control mb-1" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddr" >
							<input type="text" id="sample4_jibunAddress" placeholder="지번주소" hidden > 
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr">
						    <input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden >
						</div>
					</div>
					<div class="ps-0 pb-1 botBorder-ef">	
						<div class="fs-6 mt-2">생년월일</div>		
						<div class="col-12 fs-6 mt-2">
							<input type="text" name="birthday" id="birthday" placeholder="ex)19920211" required class="form-control"  maxlength="8" >
						</div>
					</div>	
					<div>
						<h4 class="joinTitleDiv botBorder-1b pb-2 pe-5 mb-3">추가정보</h4>
						<div class="ps-0 pb-1 botBorder-ef">
							<div class="fs-6 mt-2">이메일</div>
						</div>
						
						<div class="row emailDiv">
							<div class="col-4 ps-0">
								<input type="text" id="email" name="mailes" class="form-control">
							</div>
							 @
							<div class="col-5 pb-1">
								<input type="text" id="email1" name="mailes" class="form-control" placeholder="ex) naver.com">
							</div> 
							<div class="mail_check_wrap pb-1 botBorder-ef px-0">
								<div class="col">
									<input type="button" class="btn btn-primary me-md-2 emailBtn" id="btn2"  value="인증번호발송" onclick="mail_check_btn()">
								</div>
						<div class="fs-6 mt-2">인증번호입력</div>
								<div>
									<input type="text" class="form-control " id="verificationCode" disabled maxlength="6">
									<span id="mail_check_input_box_warn" ></span>
								</div>
							</div>	
						</div>
						<div class="fs-6 mt-2">성별 </div>
						<div class="pb-2">
							<input type="radio" value="남" checked name="gender"> 남 <input type="radio" value="여" name="gender"> 여
						</div>
					</div>
				<div class="d-grid gap-1">
				  <button class="btn btn-primary " id="joinBtn" type="submit" value="회원가입" onclick="finalJoin();"> 회원가입</button>
				</div>
		</div>
	</div>
</form>
</body>
</html>