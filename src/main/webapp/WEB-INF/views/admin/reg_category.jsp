<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/category/js/reg_category.js?ver=5"></script>
<style type="text/css">
.container{
	margin-left: 250px;
}
.cateDiv{
	background-color: #A8ECAF;
   	border-radius: 6px;
   	padding: 16px;
}
#button-addon2{
	color: white;
}
</style>
</head>
<body>
<div class="container ">
	<div class="row">
	<form action="/admin/regCategory" method="post" id="insert">
		<div class="mb-3 mt-2 col-6 category cateDiv">
			<label for="formGroupExampleInput" class="form-label justify-content-center">카테고리 등록</label> 
			<div class="input-group mb-3">
			  <input type="text" name="cateName" class="form-control" required placeholder="등록할 카테고리의 이름을 입력해주세요" aria-label="등록" aria-describedby="button-addon2">
			  <input class="btn btn-outline-secondary btn-primary" type="button" id="button-addon2" value="등록" onclick="insertCategory();">
			</div>
		</div>
	</form>
	<div class="row cateListDiv">
		<div class="col-6">
			<table class="table text-center">
				<thead>
					<tr>
						<th scope="col">CATE_CODE</th>
						<th scope="col">CATE_NAME</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${categoryList }" var="categoryListInfo">
						<tr>
							<td id="cateCode">${categoryListInfo.cateCode }</td>
							<td>${categoryListInfo.cateName }</td>
							<td>
								<form action="/admin/deleteCategory" method="post" >
									<input type="hidden" name="cateCode" value="${categoryListInfo.cateCode }">
									<input type="submit" class="btn btn-primary" value="삭제" id="delete">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</div>
</body>
</html>