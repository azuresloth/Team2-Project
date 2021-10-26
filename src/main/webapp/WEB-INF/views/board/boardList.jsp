<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table { text-align: center; }
tr { border-bottom: 1px solid black;}
td { padding: 30px; }
</style>
</head>
<body>
	<div class="container">
		<h1>공지사항 게시판</h1>
		<!-- 검색 DIV -->
		<form action="/board/boardList" method="post">
			<div class="input-group mb-3">
				<select name="searchColunm">
					<option value="t" <c:if test="${pageVO.searchColunm eq 't' }">selected</c:if> >글제목</option>
					<option value="w" <c:if test="${pageVO.searchColunm eq 'w' }">selected</c:if>>작성자</option>
					<option value="tw" <c:if test="${pageVO.searchColunm eq 'tw' }">selected</c:if>>글제목 + 작성자</option>
				</select>
				<input type="text" class="form-control" placeholder="Search" value="${pageVO.searchWord }" name="searchWord" required="required">
				<div class="input-group-append">
					<input class="btn btn-success" type="submit" value="검색">
				</div>
			</div>
		</form>
		<!-- 검색 DIV 끝-->
		<table>
			<tr>
				<td>번호</td>
				<td>글 제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<!-- 공지사항 추가 하였음 -->
			<c:if test="${empty noticeList }">
				<td colspan="5">아직 등록된 글이 없습니다.</td>
			</c:if>
			<c:if test="${not empty noticeList }">
				<c:forEach items="${noticeList }" var="noticeVO">
				<tr>
					<td>
						<i class='fas fa-bell' style='font-size:48px;color:red'></i>
					</td>
					<td>${noticeVO.title }</td>
					<td>${noticeVO.createDate }</td>
					<td>${noticeVO.writer }</td>
					<td>${noticeVO.readCnt }</td>
				</tr>
				</c:forEach>
			</c:if>
			
			<!-- 일반 게시글 -->
			<c:if test="${empty boardList }">
				<td colspan="5">아직 등록된 글이 없습니다.</td>
			</c:if>
			<c:if test="${not empty boardList }">
				<c:forEach items="${boardList }" var="boardVO" varStatus="status">
					<tr>
						<td>${pageVO.rowNum - status.index }</td>
						<td>
							<a href="/board/view?boardNum=${boardVO.boardNum }&numForReadCnt=1&page=${pageVO.page}&perPageRowNum=${pageVO.perPageRowNum}
							&searchColunm=${pageVO.searchColunm }&searchWord=${pageVO.searchWord}" style="color: blue; font-weight: bold;">
								${boardVO.title }
							</a>
						</td>
						<td>${boardVO.writer }</td>
						<td>
							<fmt:formatDate value="${boardVO.createDate }" pattern="yyyy 년 M 월 dd 일 (h 시 m 분)"/>
						</td>
						<td>${boardVO.readCnt }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div>
			<c:if test="${not empty sessionScope.loginInfo }">
				<a href="/board/writeForm" class="btn btn-primary">글쓰기</a>
			</c:if>
			<a href="/board/boardList" class="btn btn-primary">전체 글보기</a>
		</div>
		<!-- pagination -->
		<% request.setAttribute("url", "/board/boardList"); %>
		<% request.setAttribute("noLinkColor", "#999"); %>
		<div class="container mt-3">
			<ul class="pagination">
				<!-- << 버튼(처음으로 이동) -->
				<li class="page-item">
					<!-- page 1보다 크면은 -->
					<c:if test="${pageVO.page > 1 }">
						<a class="page-link" href="${url }?page=1&perPageRowNum=${pageVO.perPageRowNum}">
							<i class="fa fa-angle-double-left"></i>
						</a>
					</c:if>
					<!-- page 1 이면 -->
					<c:if test="${pageVO.page == 1 }">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
						</a>
					</c:if>
				</li>
				<!-- < 버튼(다음 그룹 페이지로이동)-->
				<li class="page-item">
					<c:if test="${pageVO.startPage > 1}">
						<a class="page-link" href="${url }?${pageVO.startPage -1}&perPageRow=${pageVO.perPageRowNum}">
							<i class="fa fa-angle-left"></i>
						</a>
					</c:if>
					<c:if test="${pageVO.startPage == 1 }">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
						</a>
					</c:if>
				</li>
				<!-- 숫자를 눌려서 페이지 이동 -->
				<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }" var="cnt">
					<li class="page-item <c:if test="${pageVO.page == cnt }">active</c:if>">
						<c:if test="${pageVO.page == cnt }">
							<a class="page-link" style="pointer-events: none; cursor: default;">
								${cnt }
							</a>
						</c:if>
						<c:if test="${pageVO.page != cnt }">
							<a class="page-link" href="${url }?page=${cnt}&perPageRowNum=${pageVO.perPageRowNum}">${cnt }</a>
						</c:if>
					</li>
				</c:forEach>
				<!-- > 버튼(다음 그룹 페이지로 이동) -->
				<c:if test="${pageVO.endPage < pageVO.totalPage }">
					<li class="page-item">
						<a class="page-link" href="${url }?page=${pageVO.endPage +1}&perPageRowNum=${pageVO.perPageRowNum}">
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
				</c:if>
				<c:if test="${pageVO.endPage == pageVO.totalPage }">
					<li class="page-item">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
						</a>
					</li>
				</c:if>
				<!-- > 버튼(마지막 페이지로 이동) -->
				<c:if test="${pageVO.page < pageVO.totalPage }">
					<li class="page-item">
					<a class="page-link" href="${url }?page=${pageVO.totalPage}&perPageRowNum=${pageVO.perPageRowNum}">
						<i class="fa fa-angle-double-right"></i>
					</a>
				</li>
				</c:if>
				<c:if test="${pageVO.page == pageVO.totalPage }">
					<li class="page-item">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							<i class="fa fa-angle-double-right" style="color: ${noLinkColor};"></i>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- container mt-3 의 끝 -->
	</div>
	
	




</body>
</html>