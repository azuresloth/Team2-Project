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
	<div class="row mt-2 justify-content-center">
		<div class="col-5">
			<!-- Swiper -->
		    <div class="swiper itemImg">
		      <div class="swiper-wrapper">
		      	<c:forEach items="${itemInfo.imgList}" var="imgInfo">
			        <div class="swiper-slide"><img src="/resources/images/item/sample/${imgInfo.attachedImgName}" width="100%;"></img></div>
		      	</c:forEach>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		</div>
		
		
		<div class="col-5"></div>
	</div>
</body>
 <script>
      var swiper = new Swiper(".itemImg", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</html>