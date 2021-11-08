<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/board/js/feedback.js?ver=75"></script>
</head>
<body>
	
	<div class="row justify-content-center formDiv">
		<div class="col-9">
			<c:if test="${not empty sessionScope.loginInfo }">
				<button type="button" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#demo">후기등록 열기/닫기</button>
			</c:if>
			
			<div id="demo" class="collapse">
			<!-- 세로운 디자인의 폼태그 -->
			<div>
				<form method="post" enctype="multipart/form-data" id="fileUploadForm">
					<input type="hidden" value="${param.itemCode }" name="itemCode" id="itemCodeInput"> <!-- 추후에 아이탬으로변경됨 -->
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text">제목 : </span> 
						<input type="text" class="form-control" name="title">
					</div>
					<div class="input-group mt-2 mb-2">
						<span class="input-group-text">작성자 : </span> 
						<input type="text" class="form-control" value="${sessionScope.loginInfo.id }"  readonly name="id" id="loginId">
						<input type="hidden" value="${sessionScope.loginInfo.isAdmin }" id="loginIsAdmin">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">내용 : </span>
						<textarea rows="5" class="form-control" style="resize: none;" name="content"></textarea>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">사진 첨부 : </span> 
						<input type="file" class="form-control" required name="file">
					</div>
					<div class="text-center">
						<input type="submit" class="btn btn-primary mt-2" value="후기등록" id="insertFeedbackBtn">
						<input type="button" class="btn btn-primary mt-2" value="취소" id="cancelFeedbackFormBtn">
					</div>
				</form>
			</div>
	<!-- 세로운 디자인의 폼태그 끝!!!!!!!!!!!!-->
	</div>
	<!-- 여기를 비워주면서 후기 리스트를 넣어준다. -->
			<div>
				<ul class="list-group" style="font-size: 18px; margin-top: 20px;" id="feedbackListUl" > <!-- 여기에 후기 목록을 뿌려준다. -->
					<li class="list-group-item"> 
						<form method="post" enctype="multipart/form-data" class="updateFileUploadForm">
							<div class="row">
								<div class="col-2">
									<img src="http://placehold.it/150x150"/>
								</div>
								<div class="col-10">
									<div class="row mt-2">
										<div class="col-8">
											제목 : <span>제목자리입니다.</span>
										</div>
										<div class="col-4 text-end">
											작성일 : <span>2021.11.6(14:28)</span>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											작성자 : <span>작성자 자리</span>
										</div>
									</div>
									<div class="row" style="height: 50px;">
										<div class="col-12">
											내용 : <span>내용자리입니다</span>
										</div>
									</div>
									<div style="float: right;">
										<input type="hidden" value="fbCode" name="fbCode"> 
										<input type="button" value="수정" class="btn btn-secondary updateFormFeedbackBtn"> 
										<input type="button" value="삭제" class="btn btn-secondary deleteFeedbackBtn">
									</div>
								</div>
							</div>
						</form>
					</li>
				</ul>
			</div>


			<!-- 구식 디자인 후기 등록!!! 나중에 지워 져야함 -->
<!-- 	<div> -->
<!-- 		<input type="button" value="후기등록 열기/닫기" class="btn btn-primary" id="feedBackButton"> -->
<!-- 	</div> -->


<!-- 	<div id="feedBackInsertform" style="display: none;"> -->
<!-- 		<form  method="post" enctype="multipart/form-data" id="fileUploadForm"> -->
<%-- 			<input type="hidden" value="${param.itemCode }" name="itemCode"> <!-- 추후에 아이탬으로변경됨 --> --%>
<!-- 			<div>제목(상품후기) : <input type="text" name="title"></div> -->
<!-- 			<div>작성자(상품후기) : <input type="text" name="id"></div> -->
<!-- 			<div>내용 (상품후기) : </div> -->
<!-- 			<div><textarea rows="10" cols="50" name="content"></textarea></div> -->
<!-- 			<div>사진 첨부(상품후기) : <input type="file" name="file" required="required"></div>	 -->
<!-- 			<input type="submit" value="후기등록" onclick="feedBackInsertformClose();" id="btninsertfeedback"> -->
<!-- 		</form> -->
<!-- 	</div> -->


		</div>
	</div>

</body>
</html>