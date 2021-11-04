package com.kh.project.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.cart.service.CartService;
import com.kh.project.cart.vo.CartViewVO;
import com.kh.project.common.service.CommonService;
import com.kh.project.item.service.ItemService;
import com.kh.project.item.vo.ItemVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource(name = "itemService")
	private ItemService itemService;
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "cartService")
	private CartService cartService;
	
	// 장바구니에 추가 메소드(추가후 장바구니페이지로 이동할지 물어봄)
	//(상세페이지 에서 1.에이작스로? or 2.페이지이동으로?)
	
	// 장바구니 페이지로 이동
	@PostMapping("/goCartList")
	public String goCartList(Model model, ItemVO itemVO) {

		return "cart/cart_list";
	}
	
	// 구매 페이지로 이동
	//@PostMapping("/goPurchasePage")
	@RequestMapping("/goPurchasePage")
	public String goPurchasePage(Model model, CartViewVO cartViewVO, HttpServletRequest request) {
		String requestURI = request.getRequestURI();
		if(requestURI.equals("/cart/goCartList")) {
			model.addAttribute("cartList", cartService.selectCartViewList(cartViewVO));
			model.addAttribute("requestURI", requestURI);
		}
		else if(requestURI.equals("/item/itemDetail")){
			/* 이부분 상세페이지에서 에이작스로 넘겨서 기존 장바구니에 같은 물건이 있는경우 confirm창으로 기존꺼
			 * 같이구매할지, 삭제할지 if문으로 설정 하고 여기와서 지금 else if문안에 if문 추가해서
			 * 기존꺼 삭제 cartService타고 갈지 결정
			 * CartViewVO checkCart = cartService.directSelectCartViewList(cartViewVO);
			 * if(checkCart != null) {
			 * 
			 * }
			 */
		}
		return "cart/purchase_page";
	}
	
	
	
}
