<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<!-- 부트 스트랩 사용을 위한 임포트 -->

<style type="text/css">
table {
	text-align: center;
}

tr {
	border-bottom: 1px solid black;
}

td {
	padding: 30px;
}

h1 {
	text-align: center;
}

.allContainer {
	margin-top: 50px;
}
.rowCommon:hover {
	background-color: #d3d3d3;
}
.rowNotice:hover {
	background-color: #ff8787;
}
</style>
</head>
<body>
	<!-- 새로운 디자인 -->
	<div class="row justify-content-center allContainer">
		<div class="col-9">
			<h1>알림 게시판</h1>
			<!-- 검색 DIV -->
			<form action="/board/boardList" method="post">
				<div class="input-group mb-3">
					<select name="searchColunm">
						<option value="t"
							<c:if test="${pageVO.searchColunm eq 't' }">selected</c:if>>글제목</option>
						<option value="w"
							<c:if test="${pageVO.searchColunm eq 'w' }">selected</c:if>>작성자</option>
						<option value="tw"
							<c:if test="${pageVO.searchColunm eq 'tw' }">selected</c:if>>글제목
							+ 작성자</option>
					</select> <input type="text" class="form-control" placeholder="Search"
						value="${pageVO.searchWord }" name="searchWord"
						required="required">
					<div class="input-group-append">
						<input class="btn btn-primary" type="submit" value="검색">
					</div>
				</div>
			</form>
			<!-- 목록 리스트 -->
			<ul class="list-group">
				<!-- 타이틀 나오게 하기 -->
				<li class="list-group-item">
					<div class="row text-center">
						<div class="col-2">번호</div>
						<div class="col-4">글 제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
						<div class="col-2">조회수</div>
					</div>
				</li>
				<!-- 관리자가 공지사항을 작성하면 목록을 전달해주는 태그 구간 -->
				<c:if test="${empty noticeList }">
					<li class="list-group-item">
						<div class="row text-center">
							<div class="col-12">아직 등록된 공지사항이 없습니다.</div>
						</div>
					</li>
				</c:if>

				<c:if test="${not empty noticeList }">
					<c:forEach items="${noticeList }" var="noticeVO">
						<li class="list-group-item rowNotice">
							<div class="row text-center">
								<div class="col-2 align-self-center">
									<i class='fas fa-bell' style='color: red'></i> &#60;공지사항&#62;
								</div>
								<div class="col-4 align-self-center">
									<a
										href="/board/view?boardNum=${noticeVO.boardNum }&numForReadCnt=1&page=${pageVO.page}&perPageRowNum=${pageVO.perPageRowNum}
									&searchColunm=${pageVO.searchColunm }&searchWord=${pageVO.searchWord}"
										style="color: blue; font-weight: bold;"> ${noticeVO.title }
									</a>
								</div>
								<div class="col-2 align-self-center">${noticeVO.writer }</div>
								<div class="col-2">
									<div class="row d-flex justify-content-center">
										<fmt:formatDate value="${noticeVO.createDate }"
											pattern="yyyy 년 M 월 dd 일" />
									</div>
									<div class="row d-flex justify-content-center">
										<fmt:formatDate value="${noticeVO.createDate }"
											pattern="(h 시 m 분)" />
									</div>
								</div>
								<div class=" col-2 align-self-center">
									<span class="badge bg-primary rounded-pill">${noticeVO.readCnt }</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</c:if>
				<!-- 관리자가 공지사항을 작성하면 목록을 전달해주는 태그 구간 끝!!!!-->

				<!-- 일반 게시글 -->
				<c:if test="${empty boardList }">
					<li class="list-group-item">
						<div class="row text-center">
							<div class="col-12">아직 등록된 게시글이 없습니다.</div>
						</div>
					</li>
				</c:if>

				<c:if test="${not empty boardList }">
					<c:forEach items="${boardList }" var="boardVO" varStatus="status">
						<li class="list-group-item rowCommon">
							<div class="row text-center">
								<div class="col-2 align-self-center">${pageVO.rowNum - status.index }
								</div>
								<div class="col-4 align-self-center">
									<a
										href="/board/view?boardNum=${boardVO.boardNum }&numForReadCnt=1&page=${pageVO.page}&perPageRowNum=${pageVO.perPageRowNum}
									&searchColunm=${pageVO.searchColunm }&searchWord=${pageVO.searchWord}"
										style="color: blue; font-weight: bold;"> ${boardVO.title }
									</a>
								</div>
								<div class="col-2 align-self-center">${boardVO.writer }</div>
								<div class="col-2">
									<div class="row d-flex justify-content-center">
										<fmt:formatDate value="${boardVO.createDate }"
											pattern="yyyy 년 M 월 dd 일" />
									</div>
									<div class="row d-flex justify-content-center">
										<fmt:formatDate value="${boardVO.createDate }"
											pattern="(h 시 m 분)" />
									</div>
								</div>
								<div class=" col-2 align-self-center">
									<span class="badge bg-primary rounded-pill">${boardVO.readCnt }</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</c:if>
				<!-- 일반 게시글 끝 -->
			</ul>
			<div class="d-flex justify-content-end mt-2">
				<c:if test="${not empty sessionScope.loginInfo }">
					<a href="/board/writeForm" class="btn btn-primary mx-3">글쓰기</a>
				</c:if>
				<a href="/board/boardList" class="btn btn-primary">전체 글보기</a>
			</div>

			<!-- pagination -->
			<%
				request.setAttribute("url", "/board/boardList");
			%>
			<%
				request.setAttribute("noLinkColor", "#999");
			%>
			<div class="container mt-3 d-flex justify-content-center">
				<ul class="pagination">
					<!-- << 버튼(처음으로 이동) -->
					<li class="page-item">
						<!-- page 1보다 크면은 --> <c:if test="${pageVO.page > 1 }">
							<a class="page-link"
								href="${url }?page=1&perPageRowNum=${pageVO.perPageRowNum}">
								<i class="fa fa-angle-double-left"></i>
							</a>
						</c:if> <!-- page 1 이면 --> <c:if test="${pageVO.page == 1 }">
							<a class="page-link"
								style="pointer-events: none; cursor: default;"> <i
								class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
							</a>
						</c:if>
					</li>
					<!-- < 버튼(다음 그룹 페이지로이동)-->
					<li class="page-item"><c:if test="${pageVO.startPage > 1}">
							<a class="page-link"
								href="${url }?${pageVO.startPage -1}&perPageRow=${pageVO.perPageRowNum}">
								<i class="fa fa-angle-left"></i>
							</a>
						</c:if> <c:if test="${pageVO.startPage == 1 }">
							<a class="page-link"
								style="pointer-events: none; cursor: default;"> <i
								class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
							</a>
						</c:if></li>
					<!-- 숫자를 눌려서 페이지 이동 -->
					<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
						var="cnt">
						<li
							class="page-item <c:if test="${pageVO.page == cnt }">active</c:if>">
							<c:if test="${pageVO.page == cnt }">
								<a class="page-link"
									style="pointer-events: none; cursor: default;"> ${cnt } </a>
							</c:if> <c:if test="${pageVO.page != cnt }">
								<a class="page-link"
									href="${url }?page=${cnt}&perPageRowNum=${pageVO.perPageRowNum}">${cnt }</a>
							</c:if>
						</li>
					</c:forEach>
					<!-- > 버튼(다음 그룹 페이지로 이동) -->
					<c:if test="${pageVO.endPage < pageVO.totalPage }">
						<li class="page-item"><a class="page-link"
							href="${url }?page=${pageVO.endPage +1}&perPageRowNum=${pageVO.perPageRowNum}">
								<i class="fa fa-angle-right"></i>
						</a></li>
					</c:if>
					<c:if test="${pageVO.endPage == pageVO.totalPage }">
						<li class="page-item"><a class="page-link"
							style="pointer-events: none; cursor: default;"> <i
								class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
						</a></li>
					</c:if>
					<!-- > 버튼(마지막 페이지로 이동) -->
					<c:if test="${pageVO.page < pageVO.totalPage }">
						<li class="page-item"><a class="page-link"
							href="${url }?page=${pageVO.totalPage}&perPageRowNum=${pageVO.perPageRowNum}">
								<i class="fa fa-angle-double-right"></i>
						</a></li>
					</c:if>
					<c:if test="${pageVO.page == pageVO.totalPage }">
						<li class="page-item"><a class="page-link"
							style="pointer-events: none; cursor: default;"> <i
								class="fa fa-angle-double-right" style="color: ${noLinkColor};"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
			<!-- pagination 의 끝 -->
		</div>
		<!-- 검색 DIV 끝-->
	</div>
	<!-- 새로운 디자인 끝-->


</body>
</html>