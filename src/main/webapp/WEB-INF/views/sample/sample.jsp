<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/admin/insert_item_form.js?ver=1"></script>
<style type="text/css">
.contentDiv{
   	background-color: #fba062;
   	border-radius: 6px;
   	padding: 16px;
}
.textAreaDiv{
	background-color: #fba062;
    border-radius: 6px;
    padding: 16px;
}
</style>
</head>
<body>
<div class="container">
	<form action="/admin/insertItem" method="post" enctype="multipart/form-data" class="row g-3">
	<div class="row">
		<div class="col contentDiv">
		<div class="row">
			<div class="col">
				<h2>상품 관리</h2>
			</div>
		</div>
			<div class="row">
				<div class="col-md-2">
				    <label for="inputState" class="form-label">Select Category</label>
				    <select id="inputState" class="form-select" name="cateCode">
				      <c:forEach items="${categoryList }" var="category">
				      	<option value="${category.cateCode }">${category.cateName}</option>
				      </c:forEach>
				    </select>
			    </div>
				<div class="col-4">
					<label for="inputItemName" class="form-label">상품명</label>
	    			<input type="text" class="form-control" id="inputItemName" name="itemName">
				</div>
				<div class="col-3">
					<label for="inputItemPrice" class="form-label">상품가격</label>
	    			<input type="text" class="form-control" id="inputItemPrice" name="itemPrice">
				</div>
				<div class="col-2">
					<label for="inputItemStock" class="form-label">상품수량</label>
	    			<input type="text" class="form-control" id="inputItemStock" name="itemStock">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-3">
					<div class="mb-3">
						<label for="formFile" class="form-label">Main Image</label>
						<input class="form-control" name="file1" type="file" id="formFile">
					</div>
				</div>
				<div class="col-3">
					<div class="mb-3">
						<label for="formFileMultiple" class="form-label">Sub Image</label>
						<input class="form-control" name="file2" type="file" id="formFileMultiple" multiple>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-3 textAreaDiv">
		<div class="col">
			<div class="input-group input-group">
		  		<span class="input-group-text">With textarea</span>
		  		<textarea class="form-control h-25" rows="15" name="itemIntro"></textarea>
			</div>
		</div>
	</div>
	<div class="row mt-3 text-center">
		<div class="col-12">
			<div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
				<button type="submit" class="btn btn-primary">상 품 등 록</button>
			</div>
		</div>
	</div>
	</form>
</div>
</body>
</html>