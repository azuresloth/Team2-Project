<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/member/js/join.js?var=26"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
 -->
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
					<div class="row">
						<div>주소</div>	
							<div class="col-6"><input type="text" id="postCode" name="addr" required class="form-control" placeholder="우편번호" style=""></div>
							<div class="col-6"><input type="button"  class="btn btn-primary me-md-2" value="검색" onclick=""></div>
							
							<div class="col-12"><input type="text" id="roadAddr" name="addr" required class="form-control" style="margin-top: 10px;" placeholder="기본주소"></div>
							
							<div class="col-12"><input type="text" id="JibunAddr" name="addr" required class="form-control" placeholder="상세주소" style="margin-top: 10px;"></div>
					</div>		
							<div>생년월일 <input type="date" id="birthday" name="birthday" required class="form-control"></div>
				</div>
				<div>
					추가정보
					<div style="margin-top: 10px;"></div>
					
					이메일
					<div class="row">
						<div class="col-5">
							<input type="text" id="email" name="email" class="form-control">
						</div>
						<div class="col-1"> @</div> 
						<div class="col-6">
							<input type="email" id="email1" name="email1" class="form-control">
						</div>
						
						
						<div style="margin-top: 10px;"></div>
						<div class="row">
							<div class="col-9">
								<input type="text"  required placeholder="우편번호" class="mail_check_input_box"  id="mail_check_input_box_false">
 
															</div>
							<div class="col-3">
								<input type="button" class="btn btn-primary me-md-2" id="btn"  value="인증번호발송">
							</div>
						</div>
					</div>
					<div>성별 <input type="radio" value="남" checked name="gender">남 <input type="radio" value="여" name="gender" disabled="disabled">여 </div>
				</div>
				<div class="d-grid gap-1">
				  <button class="btn btn-primary disabled" id="joinBtn" type="button" value="회원가입" onclick="finalJoin()" > 회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>