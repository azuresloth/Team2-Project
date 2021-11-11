<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  tr, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
<%-- 	${boardListWrittenById} --%>
	<table>
		<tr>
			<td>게시글 제목</td>
			<td>게시글 조회수</td>
			<td>게시일</td>
			<td></td>
		</tr>
		<!-- 댓글 할줄씩 뿌려주기 -->
		<c:if test="${empty boardListWrittenById }">
			<tr>
				<td colspan="4">작성한 댓글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty boardListWrittenById }">
			<c:forEach items="${boardListWrittenById }" var="board">
				<tr>
					<td>
						<a href="viewPersonalboard?boardNum=${board.boardNum }">${board.title }</a>
					</td>
					<td>${board.readCnt }</td>
					<td>
						<fmt:formatDate value="${board.createDate }" pattern="yyyy.MM.dd(hh:mm)"/>
					</td>
					<td>
						<input class="btn btn-secondary" type="button" value="삭제" 
						onclick="location.href='/board/deletePersonalBoard?boardNum=${board.boardNum }';">
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>