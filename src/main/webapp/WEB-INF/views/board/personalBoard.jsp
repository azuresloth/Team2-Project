<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							> <a href="/board/personalBoard">게시물 관리</a>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row justify-content-center mt-2">
		<div class="col-10 ">
			<div class="pageTitleDiv botBorder-1b ps-2">
				<h4>게시물관리</h4>	
			</div>
			<div class="col-12 mt-3 ps-0 pageSubTitleDiv botBorder-ed pb-0">
				<!-- ${boardListWrittenById} 여기에는 개인이 쓴 게시판 글 리스트를 가지고 간다. -->
				<a class="px-5 pb-1 fs-6 botBorder-1b orderListDiv" href="/board/personalBoard">게시글</a>
				<!-- ${boardListWrittenById} 여기에는 개인이 쓴 게시판 글 리스트를 가지고 간다. -->
				<a class="px-5 pb-1 fs-6 orderListDiv" href="/reply/personalReplyList">댓글</a>
			</div>
			
			<jsp:include page="${pathList }.jsp" />
			
		
		</div>
	</div>
	
	
</body>
</html>