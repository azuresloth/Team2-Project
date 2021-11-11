var code;  //이메일전송 인증번호 저장을 위한 코드
//화면 로딩 후 바로 실행
$(document).ready(function() {
	
	
	// 숫자가 아닌 정규식 (인증코드)
    var replaceNotInt = /[^0-9]/gi;
    
    $(document).ready(function(){
        
        $("#verificationCode").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
 
    });
    
    // 숫자가 아닌 정규식 (생년월일)
    var replaceNotInt = /[^0-9]/gi;
    
    $(document).ready(function(){
        
        $("#birthday").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
 
    });
    
    // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    
    $(document).ready(function(){
        
        $("#name").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));

       });

    });       
    
	
	
	//인증번호비교
	$('#verificationCode').blur(function(){
		var inputCode = $('#verificationCode').val(); //입력코드
		var checkResult = $(mail_check_input_box_warn); //비교결과
		var replaceNotInt = /[^0-9]/gi;
		
				
		if(inputCode == code){							//일치할경우
			checkResult.html('인증번호가 일치합니다.');
			checkResult.attr('class' , 'correct');
			checkResult.addClass('success');
			/*$('#joinBtn').removeClass('disabled');*/
		}
		else{											//일치하지않을경우
			checkResult.html('인증번호를 다시 확인하세요.');
			checkResult.attr('class' , 'incorrect');
			checkResult.removeClass('success');
			/*$('#joinBtn').addClass('disabled');*/
			
		}
	});
	//아이디 중복체크 클릭시 
	$(document).on('click', '#id', function() {
		$('#a').remove();
		/*$('#joinBtn').addClass('disabled');*/
		
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
            	if(emailId != ''){
            		if(emailAddr != ''){
            			$(mail_check_input_box_warn).removeClass('success');
            			alert('인증번호가 발송되었습니다.');
                    	$('#verificationCode').attr('disabled',false);
            		}else{
            			alert('인증번호 발송 실패 \n 이메일주소를 확인해주세요.');
                		$('#email1').focus();
            		};
            		
            	}else{
            		alert('인증번호 발송 실패 \n 이메일 아이디를 확인해주세요.');
            		$('#email').focus();
            	};
            	
			},
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      	});
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
        	  /* $('#joinBtn').addClass('disabled');*/
           }
           else{
        	   $('#a').remove();
        	   $('#checkIdDiv').after('<div id="a" style="color:blue "> 사용가능합니다 </div>');
        	   $('#a').addClass('success');
        	 /*  $('#id').attr('readonly', 'readonly');*/
        	/*$('#joinBtn').removeClass('disabled')*/
         	 }
            
            },
            error: function(){
             //ajax 실행 실패 시 실행되는 구간
               alert('실패');
            }
      });
	};
	

	//회원가입 버튼 클릭시(비밀번호확인 / 인증번호 아이디중복체크 통과시 가입처리)
	finalJoin = function(){
		var dateStr = $('#birthday').val();
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
		var today = new Date(); // 날짜 변수 선언 
		var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
		
		console.log(yearNow)
		if (dateStr.length == 8) {
			 // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			 if (1900 > year || year > yearNow){
				alert('출생년도를 확인해주세요');
				return false;
			} 
			else if (1900 <= year || year <= yearNow){
				if (month < 1 || month > 12){
					alert('출생월을 확인해주세요');
					return false;
				}
				else if (month >= 1 || month <= 12){
					if (day < 1 || day > 31){
						alert('출생일을 확인해주세요!');
						return false;
					}
					else if (day >= 1 || day <= 31){
						if ((month==4 || month==6 || month==9 || month==11) && day == 31){
							alert('생년월일을 확인해주세요');
							return false;
						}
						else if (!(month==4 || month==6 || month==9 || month==11) && day != 31){
							if (month == 2) {
								var isLeap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
								 if (day>29 || (day==29 && !isLeap)){
									 alert('생년월일을 확인해주세요');
									 return false;
								 }
							}
						}
					}
				}
			}
		}	
		else{
			alert('올바른 생년월일을 입력해주세요.');
			$('#birthday').focus();
			return false;
		}
		
	var pw = $('#pw').val();
	var pw1 = $('#pw_1').val();
	var success = $('#joinForm').find('.success').length
	
	if(pw != pw1){
		alert('비밀번호를 확인하세요');
		$('input[type="pw"]').val('');
		$('#pw').focus();
		
		return;
	}
	
		if(success == 2){
			$('#joinForm').attr('onsubmit','return true');
			
		}else
			alert('입력하신 정보를 확인하여주십시요');
			return;
			
	};
	
		
	
	
	
	

})(jQuery);

/*
//생년월일 유효성체크
function birthday1() { 
	var dateStr = $('#birthday').val();
	var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
	var today = new Date(); // 날짜 변수 선언 
	var yearNow = today.getFullYear(); // 올해 연도 가져옴
	
	
	console.log(yearNow)
	if (dateStr.length <=8) {
		// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		if (1900 > year || year > yearNow){
			alert('출생년도를 확인해주세요');
		} 
		else if (1900 <= year || year <= yearNow){
			if (month < 1 || month > 12){
				alert('출생월을 확인해주세요');
			}
			else if (month >= 1 || month <= 12){
				if (day < 1 || day > 31){
					alert('출생일을 확인해주세요!');
				}
				else if (day >= 1 || day <= 31){
					if ((month==4 || month==6 || month==9 || month==11) && day == 31){
						alert('생년월일을 확인해주세요');
					}
					else if (!(month==4 || month==6 || month==9 || month==11) && day != 31){
						if (month == 2) {
							var isLeap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
							if (day>29 || (day==29 && !isLeap)){
								alert('생년월일을 확인해주세요');
							}
						}
					}
				}
			}
		}
		
	}
	
}
*/


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