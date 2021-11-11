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
</style>
</head>
<body>
<%-- 	<div>${boardVO }</div> --%>
	<h1>개인 게시판 글보기</h1>
	<table>
		<tr>
			<td>제목</td>
			<td>${boardVO.title }</td>
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
			<td colspan="7">${boardVO.content }</td>
		</tr>
	</table>
	<div class="buttonBtn">
		<input class="btn btn-secondary" type="button" value="수정" onclick="location.href='/board/updatePersonalFormBoard?boardNum=${boardVO.boardNum }';">
		<input class="btn btn-secondary" type="button" value="삭제" onclick="location.href='/board/deletePersonalBoard?boardNum=${boardVO.boardNum }';">
		<input class="btn btn-secondary" type="button" value="뒤로가기" onclick="location.href='/board/personalBoard';">
	</div>
</body>
</html>