<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
/*     border-top: 1px solid #444444; */
    border-collapse: collapse;
  }
  tr, td {
	   border: 1px solid #444444;
/*     border-left: 1px solid #444444; */
    padding: 10px;
  }
table tr:nth-child(2) {
	height: 300px;
}
table tr:first-child td:nth-child(2n-1) {
	background-color: #e1e1e1;
}
table tr:nth-child(2) td:nth-child(2n-1){
	background-color: #e1e1e1;
}
.buttonBtn {
	text-align: center;
	margin-top: 20px;
}
textarea {
	resize: none;
}  
</style>
</head>
<body>
<%-- 	<div>${boardVO }</div> --%>
	<h1>개인 게시판 글 수정</h1>
	<form action="/board/updatePersonalBoard" method="post">
		<input type="hidden" value="${boardVO.boardNum }" name="boardNum">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" value="${boardVO.title }" name="title">
				</td>
				<td>작성자</td>
				<td>${boardVO.writer }</td>
				<td>작성일</td>
				<td>
					<fmt:formatDate value="${boardVO.createDate }" pattern="yyyy.MM.dd(hh:mm)"/>
				</td>
				<td>조회수</td>
				<td>${boardVO.readCnt }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="7">
					<textarea rows="15" cols="100" name="content">${boardVO.content }</textarea>
				</td>
			</tr>
		</table>
		<div class="buttonBtn">
			<input class="btn btn-secondary" type="submit" value="수정완료">
			<input class="btn btn-secondary" type="button" value="뒤로가기" onclick="location.href='/board/viewPersonalboard?boardNum=${boardVO.boardNum }';">
		</div>
	</form>
	 
</body>
</html>