package com.kh.project.cart.service;

import com.kh.project.cart.vo.CartViewVO;

public interface CartService {
	// 장바구니 추가
	void insertCart(CartViewVO cartViewVO);
}
