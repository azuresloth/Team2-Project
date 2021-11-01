<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/category_page.css?ver=1">
</head>
<body>
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col path">
					<ol type="i">
						<li>
							<a href="/item/mainPage">home</a>
						</li>
						<li>
							> <a href="/item/categoryPage?cateCode=${pathInfo.cateCode}">${pathInfo.cateName }</a>
						</li>
					</ol>
				</div>
			</div>
			
			<div class="row justify-content-center mt-3">
				<div class="col-10">
					<!-- Swiper -->
					<div class="itemBannerTitle">
						BEST ITEM
					</div>
					<div class="swiper itemSwiper">
						<div class="swiper-wrapper">
							<c:forEach items="${bestItemList}" var="bestItemInfo">
								<div class="swiper-slide">
									<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}"><img src="/resources/images/item/itemImages/${bestItemInfo.imgList[0].attachedImgName}"></img></a>
									<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}">${bestItemInfo.itemName}</a>
									<div>${bestItemInfo.itemPrice}</div>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-10">
						<div class="itemBannerTitle">
							${pathInfo.cateName} 목록
						</div>
					<div class="row">
						<c:forEach items="${itemList}" var="itemInfo">
							<div class="col-3 mt-5">
								<a href="/item/itemDetail?itemCode=${itemInfo.itemCode}"><img src="/resources/images/item/itemImages/${itemInfo.imgList[0].attachedImgName}" width="100%"></img></a>
								<a href="/item/itemDetail?itemCode=${itemInfo.itemCode}">${itemInfo.itemName}</a>
								<div>${itemInfo.itemPrice}원</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var swiper = new Swiper(".itemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		autoplay : {
			delay : 2000,
			disableOnInteraction : true,
			loop : true,
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