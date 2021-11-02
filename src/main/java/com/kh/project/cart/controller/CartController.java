package com.kh.project.cart.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.vo.BoardVO;
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
	 
	// 상품 목록 페이지로 이동
	@PostMapping("/goCartList")
	public String goCartList(Model model, ItemVO itemVO) {

		return "cart/cart_list";
	}
	
	// 상품 목록 페이지로 이동
	//@PostMapping("/goPurchasePage")
	@RequestMapping("/goPurchasePage")
	public String goPurchasePage(Model model, ItemVO itemVO) {
		
		return "cart/purchase_page";
	}
	
	
	
}
