package com.kh.project.cart.service;

import java.util.List;

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
}
