<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?var=31"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<div class="row justify-content-center" >
		<div class="col-5">
			<form action="/member/join" method="post" class="row g-3" id="joinForm" >
				<div class="">기본정보
				<div></div>
				아이디 
				<div class="row">
					<div class="col-9">
						<input type="text" id="id" required name="id" class="form-control" > 
					</div>
					<div id="checkIdDiv" class="col-3"> 
						<input type="button" class="btn btn-primary me-md-2" id="btn"  onclick="checkId();" value="중복확인" > 
					</div>
				</div>
					<div>비밀번호 <input type="password" id="pw"  required name="pw" class="form-control" > </div>
					<div>비밀번호 확인 <input type="password" id="pw_1" required class="form-control"> </div>
					<div>이름  <input type="text" id="name"  name="name" required class="form-control"> </div>
					연락처
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
				  		<input type="text" class="form-control " id="tell2" name="tells" required>
				  	</div>
				  	<div class="col-4">
				  		 <input type="text" class="form-control" id="tell3" name="tells" required>
				  	</div>
				</div>	
					<div>주소</div>	
						<input type="text" id="sample4_postcode" placeholder="우편번호" name="postCode">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기 " ><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddr">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" hidden > 
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="detailAddr">
					    <input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden >
					
							
							<div>생년월일 <input type="text" id="birthday" name="birthday" placeholder="ex)19920211" required class="form-control"></div>
				</div>
				<div>
					추가정보
					<div style="margin-top: 10px;"></div>
					
					이메일
					<div class="row">
						<div class="col-5">
							<input type="text" id="email" name="mailes" class="form-control">
						</div>
						<div class="col-1"> @</div> 
						<div class="col-6">
							<input type="text" id="email1" name="mailes" class="form-control" placeholder="ex)naver.com">
						</div> 
						
						
						<div style="margin-top: 10px;"></div>
						<div class="row">
							
							<div class="col-3">
								<input type="button" class="btn btn-primary me-md-2" id="btn2"  value="인증번호발송">
							</div>
						</div>
					</div>
					<div>성별 <input type="radio" value="남" checked name="gender">남 <input type="radio" value="여" name="gender" disabled="disabled">여 </div>
				</div>
				<div class="d-grid gap-1">
				  <button class="btn btn-primary disabled" id="joinBtn" type="submit" value="회원가입"  > 회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>