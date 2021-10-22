<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/main_page.css?ver=11">
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
		<div class="row gy-1 sideBannerGrid">
			<div class="col-3">
				<div class="p-1 border">
					<a><img src="/resources/images/item/banner/2banner_1.jpg" style="width: 100%;"></img></a>
				</div>
			</div>
			<div class="col-3">
				<div class="p-1 border">
					<a><img src="/resources/images/item/banner/2banner_2.jpg" style="width: 100%;"></img></a>
				</div>
			</div>
			<div class="col-3">
				<div class="p-1 border">
					<a><img src="/resources/images/item/banner/2banner_3.jpg" style="width: 100%;"></img></a>
				</div>
			</div>
			<div class="col-3">
				<div class="p-1 border bg-light" style="height: 100%;">
					공지사항 불러올 장소
					<div class="mt-2"></div>
					<div>공지 1</div>
					<div>공지 2</div>
					<div>공지 3</div>
				</div>
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
			<div class="swiper itemSwiper">
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
	
	<div class="row">
		<div class="col-12" style="height: 3rem;">
			
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<!-- Swiper -->
			<div class="itemBannerTitle">
				NEW ITEM
			</div>
			<div class="swiper itemSwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${recentItemList}" var="recentItemInfo">
						<div class="swiper-slide">
							<a><img src="/resources/images/item/sample/${recentItemInfo.imgList[0].attachedImgName}"></img></a>
							<a>${recentItemInfo.itemName}</a>
							<div>${recentItemInfo.itemPrice}</div>
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
		centeredSlides : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		loop : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});

	var swiper = new Swiper(".itemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		autoplay : {
			delay : 2000,
			disableOnInteraction : true,
			loop : true,
		},
			loop : true,
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