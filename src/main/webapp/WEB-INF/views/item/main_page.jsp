<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/item/css/main_page.css?ver=12">
</head>

<body>
	<div class="row">
		<div class="col-12 mainBannerDiv">
			<!-- Swiper -->
			<div class="swiper mainBannerSwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_1.jpg" width="100%;"></img></a></div>
			        <!-- <div class="swiper-slide"><a><img src="/resources/images/item/banner/banner_2.jpg" width="100%;"></img></a></div> -->
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
	
	<div class="container-fluid mainRow">
		<div class="row">
			<div class="col-12" style="height: 3rem;">
				
			</div>
		</div>
		
		<div class="row ">
			<div class="row gy-1 sideBannerGrid">
				<div class="col-3">
					<div class="p-1 border">
						<a href="/item/categoryPage"><img src="/resources/images/item/banner/2banner_6(bestItem).jpg" style="width: 100%;"></img></a>
					</div>
				</div>
				<div class="col-3">
					<div class="p-1 border">
						<a href="/item/categoryPage?cateCode=CATE_005"><img src="/resources/images/item/banner/2banner_4(hair).jpg" style="width: 100%;"></img></a>
					</div>
				</div>
				<div class="col-3">
					<div class="p-1 border">
						<a href="/item/categoryPage?cateCode=CATE_004"><img src="/resources/images/item/banner/2banner_5(watchStrap).jpg" style="width: 100%;"></img></a>
					</div>
				</div>
				<div class="col-3">
					<div class="p-1 border bg-light" style="height: 100%;">
						<div>&lt; 공지사항 &gt;</div>
						<div class="mt-2"></div>
						<!-- ${noticeList } 여기에 공지사항이 들어가 있음 최신 순 3개만 띄워 줌-->
						<c:if test="${empty noticeList }">
							<div>공지사항이 없습니다.</div>
						</c:if>
						<c:if test="${not empty noticeList }">
							<c:forEach items="${noticeList}" var="vo"  begin="0" end="2" step="1" varStatus="status">
								<div>
									<span>공지 ${status.count }.</span>
									<!-- 공지사항 상세보기로 보내주기 -->
									<a href="/board/view?boardNum=${vo.boardNum }&numForReadCnt=1" style="color: blue;">${vo.title }</a> 
									<span>
										(<fmt:formatDate value="${vo.createDate }" pattern="yyyy.MM.dd"/>)
									</span>
								</div>
							</c:forEach>
						</c:if>
						<!-- 공지 사항 띄워주는 코드 끝 -->
						
<!-- 						<div>공지 1</div> -->
<!-- 						<div>공지 2</div> -->
<!-- 						<div>공지 3</div> -->
						<a href="/feedback/reviewBoard?itemCode=itemCode_001">임시 후기 게시판 링크</a>
						<a href="/sample/asdf">???</a>
					</div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-12" style="height: 3rem;">
				
			</div>
		</div>
	</div>
	
	<div class="itemBannerTitle bgi2">
		BEST ITEM
	</div>
		
	<div class="container-fluid mainRow">		
		<div class="row">
			<div class="col-12">
				<!-- Swiper -->
				<div class="swiper itemSwiper">
					<div class="swiper-wrapper">
						<c:forEach items="${bestItemList}" var="bestItemInfo">
							<div class="swiper-slide">
								<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}&cateCode=${bestItemInfo.cateCode}"><img src="/resources/images/item/itemImages/${bestItemInfo.imgList[0].attachedImgName}"></img></a>
								<a href="/item/itemDetail?itemCode=${bestItemInfo.itemCode}&cateCode=${bestItemInfo.cateCode}">${bestItemInfo.itemName}</a>
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
	</div>
		
	<div class="itemBannerTitle bgi2">
		NEW ITEM
	</div>
	
	<div class="container-fluid mainRow">
		<div class="row">
			<div class="col-12">
				<!-- Swiper -->
				<div class="swiper itemSwiper">
					<div class="swiper-wrapper">
						<c:forEach items="${recentItemList}" var="recentItemInfo">
							<div class="swiper-slide">
								<a href="/item/itemDetail?itemCode=${recentItemInfo.itemCode}&cateCode=${recentItemInfo.cateCode}"><img src="/resources/images/item/itemImages/${recentItemInfo.imgList[0].attachedImgName}"></img></a>
								<a href="/item/itemDetail?itemCode=${recentItemInfo.itemCode}&cateCode=${recentItemInfo.cateCode}">${recentItemInfo.itemName}</a>
								<div>${recentItemInfo.itemPrice}</div>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>
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
			loop : true,
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