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
<%-- 이안에 데이터가 다넣어 온다.	${userReplyList } --%>
	<table>
		<tr>
			<td>댓글을 작성한곳</td>
			<td>댓글 내용</td>
			<td>댓글 작성일</td>
		</tr>
		<!-- 댓글 할줄씩 뿌려주기 -->
		<c:if test="${empty userReplyList }">
			<tr>
				<td colspan="3">작성한 댓글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty userReplyList }">
			<c:forEach items="${userReplyList }" var="reply">
				<tr>
					<td>
						${reply.boardList[0].writer } 님이 작성한 &lt; ${reply.boardList[0].title } &gt; 댓글을 작성 하였습니다.
					</td>
					<td>${reply.content }</td>
					<td>
						<fmt:formatDate value="${reply.createDate }" pattern="yyyy.MM.dd(hh:mm)"/>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>