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
<div class="list-group row-2">
  	<a href="/admin/adminMenu" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'categoryManage'}"> active </c:if> col-1" aria-current="true">
  		카테고리 관리
  	</a>
  	<a href="/admin/insertItemForm" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'insertItem'}"> active </c:if>">상품등록</a>
  	<a href="/admin/itemManage" class="list-group-item list-group-item-action">상품관리</a>
  	<a href="/admin/salesManage" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'salesManage'}"> active </c:if>">매출관리</a>
  	<a href="/admin/selectMonthSales" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'monthSales'}"> active </c:if>">한달 매출</a>
  	<a href="/admin/selectOrderInfo" class="list-group-item list-group-item-action <c:if test="${sidePage eq 'selectOrderInfo'}"> active </c:if>">주문관리</a>
</div>
</body>
</html>