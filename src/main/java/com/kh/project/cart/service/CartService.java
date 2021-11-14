package com.kh.project.cart.service;

import java.util.List;

import com.kh.project.cart.vo.BuyInfoVO;
import com.kh.project.cart.vo.CartViewVO;

public interface CartService {
	// 장바구니에 추가
	void insertCart(CartViewVO cartViewVO);
	
	// 장바구니 조회
	List<CartViewVO> selectCartViewList(CartViewVO cartViewVO);
	
	// 장바구니 총 가격 조회
	int selectCartAllTotalPrice(CartViewVO cartViewVO);
	
	// 바로구매 눌렀을 경우
	CartViewVO directSelectCartViewList(CartViewVO cartViewVO);
	
	// 장바구니에 있는 동일 제품 삭제
	void deleteSameCart(CartViewVO cartViewVO);
	
	// 장바구니 상품 갯수 수정
	void updateCartCnt(CartViewVO cartViewVO);
	
	// 구매 목록 삭제
	void deleteCartItem(String itemCode, String id);
	
	// 일괄 구매 카트 삭제
	void deleteCart(String id);
	
	// 구매 목록 지웟는데 뒤로가기로 왔을때 확인
	int selectCheckPurchaseData(String itemCode, String id);
	
	// 구매후 주문정보에 추가
	int insertBuyInfo(BuyInfoVO buyInfoVO);
	
	// 구매후 구매한 상품 조회
	List<BuyInfoVO> selectRecentBoughtInfo(BuyInfoVO buyInfoVO);
	
	// 구매 날짜 조회
	String selectBuyDate(BuyInfoVO buyInfoVO);
	
	// 회원 주문 정보
	List<BuyInfoVO> selectOrderLookup(BuyInfoVO buyInfoVO);
	
	// 주문 상세 조회
	List<BuyInfoVO> selectOrderDetailList(BuyInfoVO buyInfoVO);
	
	// 주문 코드 조회
	List<String> selectOrderCode(BuyInfoVO buyInfoVO);
	
	// 방금한 상품 리스트 조회
	List<BuyInfoVO> selectRecentBoughtList(String orderCode);
	
	// 리뷰 등록 버튼 오프너
	List<BuyInfoVO> selectItemCodeByReview(BuyInfoVO buyInfoVO);
	
	// 장바구니를 위한 아이템코드 조회
	List<CartViewVO> selectCartItemCode(String id);
	
	// 남은수량까지 장바구니 조회
	CartViewVO selectCartViewWithStockList(CartViewVO cartViewVO);
	
	// 장바구니 수량 변경
	void updateCartItemCnt(CartViewVO cartViewVO);
	
}
