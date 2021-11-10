package com.kh.project.cart.service;

import java.util.List;

import com.kh.project.cart.vo.BuyInfoVO;
import com.kh.project.cart.vo.CartViewVO;

public interface CartService {
	// 장바구니에 추가
	void insertCart(CartViewVO cartViewVO);
	
	// 장바구니 조회
	List<CartViewVO> selectCartViewList(CartViewVO cartViewVO);
	
	// 바로구매 눌렀을 경우
	CartViewVO directSelectCartViewList(CartViewVO cartViewVO);
	
	// 장바구니에 있는 동일 제품 삭제
	void deleteSameCart(CartViewVO cartViewVO);
	
	// 장바구니 상품 갯수 수정
	void updateCartCnt(CartViewVO cartViewVO);
	
	// 구매 목록 삭제
	void deleteCartItem(String itemCode, String id);
	
	// 구매 목록 지웟는데 뒤로가기로 왔을때 확인
	int selectCheckPurchaseData(String itemCode, String id);
	
	// 구매후 주문정보에 추가
	int insertBuyInfo(BuyInfoVO buyInfoVO);
	
	// 구매후 구매한 상품 조회
	List<BuyInfoVO> selectRecentBoughtInfo(BuyInfoVO buyInfoVO);
	
	// 구매 날짜 조회
	String selectBuyDate(BuyInfoVO buyInfoVO);
	
//	// 회원 주문 정보
//	List<BuyInfoVO> selectOrderCode(BuyInfoVO buyInfoVO);
	
	// test.회원 주문 정보
	String sltOdCode(String id);
}
