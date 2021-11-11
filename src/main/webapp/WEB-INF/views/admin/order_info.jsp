<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/order_info.js?ver=22"></script>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
.statusName{
	display: table;
	margin: 0 auto;
	text-align: center;
} 
.pagination{
	margin: 0 auto;
	text-align: center;
}
.myContainer{
   	background-color: #fba062;
   	border-radius: 6px;
   	padding: 16px;
}
.form-select{
	display: block; 
}
.statusName{
	width: 110px;
}
.form-select{
	height: 35px;
}
</style>
</head>
<body>
	<div class="container myContainer">
		<form action="/admin/serchDate" method="post">
			<div class="row">
				<div class="col-2 text-center d-flex justify-content-center">
					<span class="align-self-center">날짜검색</span> 
				</div>
				<div class="col-3 d-flex justify-content-start">
					<input type="hidden" id="beforMonth" value="${beforMonth }" >
					<input type="date" id="startDate" class="form-select " name="startDate" 
						<c:if test="${param.startDate eq null }">
						value="${beforMonth }"
						</c:if>
						value="${param.startDate }"
						>
				</div>
				<div class="col-3 d-flex justify-content-start">
					<input type="date" id="endDate" class="form-select " name="endDate" 
						<c:if test="${param.endDate eq null }">
						value="${nowMonth }"
						</c:if>
						value="${param.endDate }"
					>
				</div>
				<div class="col-2">
					<select name="serchStatus" class="form-select  text-center">
						<option value="전체" selected>전체</option>
						<c:forEach items="${statusInfo }" var="status">
						<option value="${status.statusName}" <c:if test="${status.statusName eq orderVO.serchStatus }">selected</c:if>>${status.statusName }</option>
						</c:forEach>
					</select>
				</div>	
				<div class="col-1 btn-group">
					<input type="submit" value="검색" class="form-control btn btn-secondary" >
				</div>
			</div>
		</form>
	</div>
<div>
	<table class="table text-center mt-3 ">
		<thead>
			<tr>
			  <th scope="col">구매자</th>
			  <th scope="col" >주문상품</th>
			  <th scope="col" >결재금액</th>
			  <th scope="col" >결재방식</th>
			  <th scope="col" >배송지</th>
			  <th scope="col" >주문일자</th>
			  <th scope="col" >상태</th>
			  <th scope="col">변경</th>
			</tr>
		</thead>
		<tbody id="orderListDiv">
			<c:choose>
				<c:when test="${empty orderList }">
					<tr>
						<td colspan="8">데이터가 없습니다.</td>
					</tr>						
				</c:when>
				<c:otherwise>
					<c:forEach items="${orderList }" var="orderInfo">
						<tr>
							<td>${orderInfo.id}</td>
							<td>${orderInfo.itemName}</td>
							<td><fmt:formatNumber value="${orderInfo.totalPrice}" pattern="#,###"/></td>
							<td>${orderInfo.paymentPlan}</td>
							<td>${orderInfo.roadAddr} ${orderInfo.detailAddr}</td>
							<td>${orderInfo.buyDate}</td>
							<td >
								<select class="form-select form-select-sm statusName text-start" aria-label=".form-select-sm example">
									<c:forEach items="${statusInfo }" var="status">
										<option value="${status.statusName }" <c:if test="${status.statusName eq orderInfo.buyStatus }">selected</c:if>>${status.statusName }</option>
									</c:forEach>
								</select>
							</td>
							<td >
								<input type="hidden" value="${orderInfo.buyCode }">
								<input type="button" value="변경" class="update btn btn-secondary">
							</td>
						</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<!-- pagination -->
	<% request.setAttribute("url", "/admin/selectOrderInfo"); %>
	<% request.setAttribute("noLinkColor", "#999"); %>
	<div class="container mt-3 pagination">
		<ul class="pagination">
			<!-- << 버튼(처음으로 이동) -->
			<li class="page-item">
				<!-- page 1보다 크면은 -->
				<c:if test="${orderVO.page > 1 }">
					<a class="page-link" href="${url}?page=1&perPageRowNum=${orderVO.perPageRowNum}">
						<i class="fa fa-angle-double-left"></i>
					</a>
				</c:if>
				<!-- page 1 이면 -->
				<c:if test="${orderVO.page == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-double-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- < 버튼(다음 그룹 페이지로이동)-->
			<li class="page-item">
				<c:if test="${orderVO.startPage > 1}">
					<a class="page-link" href="${url }?${orderVO.startPage -1}&perPageRow=${orderVO.perPageRowNum}">
						<i class="fa fa-angle-left"></i>
					</a>
				</c:if>
				<c:if test="${orderVO.startPage == 1 }">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-left" style="color: ${noLinkColor};"></i>
					</a>
				</c:if>
			</li>
			<!-- 숫자를 눌려서 페이지 이동 -->
			<c:forEach begin="${orderVO.startPage }" end="${orderVO.endPage }" var="cnt">
				<li class="page-item <c:if test="${orderVO.page == cnt }">active</c:if>">
					<c:if test="${orderVO.page == cnt }">
						<a class="page-link" style="pointer-events: none; cursor: default;">
							${cnt }
						</a>
					</c:if>
					<c:if test="${orderVO.page != cnt }">
						<a class="page-link"
							<c:if test="${!empty orderVO.startDate and !empty orderVO.endDate }">
								href = "/admin/serchDate?page=${cnt }&perPageRowNum=${orderVO.perPageRowNum }&startDate=${orderVO.startDate }&endDate=${orderVO.endDate }&buyStatus=${orderVO.serchStatus }"
							</c:if>
							href="${url }?page=${cnt}&perPageRowNum=${orderVO.perPageRowNum}&serchStatus=${orderVO.serchStatus}">
							${cnt }
						</a>
					</c:if>
				</li>
			</c:forEach>
			<!-- > 버튼(다음 그룹 페이지로 이동) -->
			<c:if test="${orderVO.endPage < orderVO.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${url }?page=${orderVO.endPage +1}&perPageRowNum=${orderVO.perPageRowNum}">
						<i class="fa fa-angle-right"></i>
					</a>
				</li>
			</c:if>
			<c:if test="${orderVO.endPage == orderVO.totalPage }">
				<li class="page-item">
					<a class="page-link" style="pointer-events: none; cursor: default;">
						<i class="fa fa-angle-right" style="color: ${noLinkColor};"></i>
					</a>
				</li>
			</c:if>
			<!-- > 버튼(마지막 페이지로 이동) -->
			<c:if test="${orderVO.page < orderVO.totalPage }">
				<li class="page-item">
				<a class="page-link" href="${url }?page=${orderVO.totalPage}&perPageRowNum=${orderVO.perPageRowNum}">
					<i class="fa fa-angle-double-right"></i>
				</a>
			</li>
			</c:if>
			<c:if test="${orderVO.page == orderVO.totalPage }">
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