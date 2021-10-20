<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/item_list.css?ver=3">
</head>

<body>
	<div class="row">
		<div class="col-12">
			<!-- Swiper -->
			<div class="swiper mainBannerSwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_1.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_2.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_3.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_4.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_5.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_6.jpg" width="100%;"></img></a></div>
			        <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_7.jpg" width="100%;"></img></a></div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12" style="height: 3rem;">
			
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<!-- Swiper -->
			<div class="itemBannerTitle">
				BEST ITEM
			</div>
			<div class="swiper bestItemSwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${bestItemList}" var="bestItemInfo">
						<div class="swiper-slide">
							<a><img src="/resources/images/item/sample/${bestItemInfo.imgList[0].attachedImgName}"></img></a>
							<a>${bestItemInfo.itemName}</a>
							<div>${bestItemInfo.itemPrice}</div>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>


</body>
<script>
	var swiper = new Swiper(".mainBannerSwiper", {
		slidesPerView : 1,
		spaceBetween : 30,
		loop : true,
		centeredSlides : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});

	var swiper = new Swiper(".bestItemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		loop : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		breakpoints : {
			640 : {
				slidesPerView : 2,
				spaceBetween : 20,
			},
			768 : {
				slidesPerView : 4,
				spaceBetween : 40,
			},
			1024 : {
				slidesPerView : 5,
				spaceBetween : 50,
			},
		},
	});
</script>
</html>