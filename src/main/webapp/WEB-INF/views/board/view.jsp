<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	<!-- feedback.js -->
<title>Insert title here</title>
<script type="text/javascript" src="/resources/feedback/js/feedback.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 후기작성 폼 열고 닫는 버튼 기능
	$('#openFeedBackForm').click(function(e) {
// 		alert("확인");
		e.preventDefault();
	     if($("#feedbackDiv").css("display") == "none"){   
	         $('#feedbackDiv').css("display", "block");   
	     } else {  
	         $('#feedbackDiv').css("display", "none");   
	     }  
	});// 끝

	// 화면에 바로 후기 목록 뿌려주기
	var itemCode = $("#itemCodeTd").text();
// 	alert(itemCode);// 확인함
	
	showFeedbackList = function(itemCode){
		$.ajax({
			url:'/feedback/feedbackListAjax',
			type:'post',
			data:{'itemCode':itemCode},
			// result는 콘트롤러에서 넘어오는 객체이다
			//ajax 실행 성공 후 실행 할 코드 작성
			success:function(result){
// 				$('#scoreDiv').empty();
// 				//태그 비우기
				
// 				//태그 채우기
				var str = "";
				if(result == null){
					str += "아직등록된 상품후기가 없습니다.";
				}else{
					// 데이터가 있으면 태그를 만들어준다.
					str += "<h2> 아작스 작성자 상품 후기</h2>";
					str += "<table>";
					
					$(result).each(function(index,element){
					str += "<tr>";
					str += "<td>" + element.title + "</td>";
					str += "<td>";
 						//시간 관련 함수
					str += dateFormet(element.createDate);
//  					str += new Date(element.createDate);
					str += "</td>";
					str += "<td>작성자 : " + element.id + "</td>";
					str += "<td><input type='button' class='btn btn btn-secondary' value='수정'></td>";
					str += "<td><input type='button' class='btn btn btn-secondary' value='삭제'></td>";
					
					str += "</tr>";
					str += "<tr>";
					str += "<td>";
					str += "<img src='/resources/feedback/images/" + element.attachedFileName + "' height='100px'>";
					str += "</td>";
					str += "<td colspan='3'>" + element.content + "</td>";
					str += "</tr>";
					
					});
					str += "</table>";
				}
				//태그 주입
				$('#feedbackAjax').append(str);
			},
			error:function(){
				//ajax 실행 실패 시 실행되는 구간
				alert("실패");
			}
		});
		
	} // showFeedbackList 끝.
	// 후기 목록 뿌리기 함수 실행
	showFeedbackList(itemCode);
	

//함수 선언 영역
(function($){
	
	dateFormet = function(date){
		result = new Date(date);
		var yyyy = result.getFullYear();
		var mm = result.getMonth() + 1;
		var dd = result.getDate();
		var hh = result.getHours();
		var mi = result.getMinutes();
		return yyyy + "." + mm + "." + dd + "(" + hh + ":" + mi + ")";
	}		
	
	
	
	
   
})(jQuery);

});  


</script>
<style type="text/css">
#boardTable { text-align: center; }
#boardTable tr { border-bottom: 1px solid black;}
#boardTable td { padding: 30px; }
#feedbackDiv { border: 1px solid black; }
</style>
</head>
<body>
	<h1>게시글 보기</h1>
	<table id="boardTable">
		<tr>
			<td>게시글 번호</td>
			<td id="itemCodeTd">${boardVO.boardNum }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${boardVO.readCnt }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>
				<fmt:formatDate value="${boardVO.createDate }" pattern="yyyy 년 M 월 dd 일 (h 시: m 분)"/>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${boardVO.writer }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${boardVO.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${boardVO.content }</td>
		</tr>
	</table>
	<a href="/board/updateForm?boardNum=${boardVO.boardNum }&page=${param.page }&perPageRowNum=${param.perPageRowNum}
		&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">수정</a>
	<a href="/board/delete?boardNum=${boardVO.boardNum }" class="btn btn-primary">삭제</a>
	<a href="/board/boardList?page=${param.page }&perPageRowNum=${param.perPageRowNum}
		&searchColunm=${param.searchColunm }&searchWord=${param.searchWord}" class="btn btn-primary">뒤로가기</a>
	
	<div>
		<div>
			<a class="btn btn-secondary" id="openFeedBackForm" href="#">후기작성폼열기/닫기</a>
		</div>
		<div id="feedbackDiv" style="display: none;">
			<form action="/feedback/insert" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${boardVO.boardNum }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 -->
				<div>제목(상품후기) : <input type="text" name="title"></div>
				<div>작성자(상품후기) : <input type="text" name="id"></div>
				<div>내용 (상품후기) : </div>
				<div><textarea rows="10" cols="50" name="content"></textarea></div>
				<div>사진 첨부(상품후기) : <input type="file" name="file"> </div>	
				<input type="submit" value="후기등록">
			</form>
		</div>
	</div>
	<div>
		<c:if test="${empty feedbackList }">아직등록된 상품후기가 없습니다.</c:if>
		<c:if test="${not empty feedbackList }">
			<h2>작성자 상품 후기</h2>
			<table>
				<c:forEach items="${feedbackList }" var="feedBackVO">
					<tr>
						<td>${feedBackVO.title }</td>
						<td>
							<fmt:formatDate value="${feedBackVO.createDate }" pattern="yyyy 년 M 월 dd 일 (h 시: m 분)"/>
						</td>
						<td>작성자 : ${feedBackVO.id }</td>
					</tr>
					<tr>
						<td>
							<img src="/resources/feedback/images/${feedBackVO.attachedFileName }" height="100px">
						</td>
						<td colspan="2">${feedBackVO.content }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	
	<div id="feedbackAjax">	<!-- 여기에 ajax로 목록 보기가 들어온다. -->
	
	</div>
</body>
</html>


















