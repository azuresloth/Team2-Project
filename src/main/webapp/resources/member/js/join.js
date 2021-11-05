var code;  //이메일전송 인증번호 저장을 위한 코드
//화면 로딩 후 바로 실행
$(document).ready(function() {
	
	//인증번호비교
	$('#verificationCode').blur(function(){
		var inputCode = $('#verificationCode').val(); //입력코드
		var checkResult = $(mail_check_input_box_warn); //비교결과
		if(inputCode == code){							//일치할경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class" , "correct");
			$('#joinBtn').removeClass('disabled');
		}
		else{											//일치하지않을경우
			checkResult.html("인증번호를 다시 확인하세요.");
			checkResult.attr("class" , "incorrect");
			$('#joinBtn').addClass('disabled');
			
		}
	});
	//아이디 중복체크 클릭시 
	$(document).on('click', '#id', function() {
		$('#a').remove();
		$('#joinBtn').addClass('disabled');
    });
	
	// 엔터키 방지
	$(document).on('keydown', 'input', function() {
		if(event.keyCode === 13){
			event.preventDefault();
		};
    });
	
	
});
//함수 선언 영역
(function($){
	//이메일 인증번호발송
	mail_check_btn = function(){
		var emailId = $('#email').val();
		var emailAddr = $('#email1').val();
		
		
		var email = emailId + '@'+ emailAddr;
		
		$.ajax({
            url: '/member/mailCheckAjax', //요청경로
            type: 'GET', // 받을 매핑 방식
            data:{'email' : email}, //(컨트롤러에 전해줄)필요한 데이터  {'a' : sing, 'b' : song}
            success: function(data) {
            	code = data;
            	alert('인증번호가 발송되었습니다.');
            	$('#verificationCode').attr('disabled',false);
			},
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});
	};
	
	
   //비밀번호 확인
	finalJoin = function(){
	var pw = $('#pw').val();
	var pw1 = $('#pw_1').val();
	
	if(pw != pw1){
		alert('비밀번호를 확인하세요');
		$('input[type="pw"]').val('');
		$('#pw').focus();
		
		return;
		
	}
	$('#joinForm').attr('onsubmit','return true');
	$('#joinForm').submit();
	};
	
	
	//아이디 중복체크
	checkId = function(){
		var id = $('#id').val();
		
		if(id == ''){
		var a = $('#checkIdDiv').attr('id');
			
			if(a != 'a'){
				$('#a').remove();
				$('#checkIdDiv').after('<div id="a" > 아이디를 입력하세요 </div>')
			}
			return;
		}
		
		$.ajax({
            url: '/member/checkIdAjax', //요청경로
            type: 'post',
            data:{'id':id}, //필요한 데이터
            success: function(result) {
               //ajax 실행 성공 후 실행할 코드 작성
              
           if(result){
        	   $('#a').remove();
        	   $('#checkIdDiv').after('<div id="a" style="color:red "> 아이디가 중복입니다 </div>');
           }
           else{
        	   $('#a').remove();
        	   $('#checkIdDiv').after('<div id="a" style="color:blue "> 사용가능합니다 </div>');
        	   
        	$('#joinBtn').removeClass('disabled')
         	 }
            
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
	};
	
})(jQuery);


//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById("sample4_roadAddress").value = roadAddr;
			document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			
			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if(roadAddr !== ''){
				document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("sample4_extraAddress").value = '';
			}
			
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';
				
			} else if(data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			} else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
		}
	}).open();
	
	
}	