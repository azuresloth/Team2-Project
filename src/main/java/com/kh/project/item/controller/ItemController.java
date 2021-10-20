package com.kh.project.item.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.item.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Resource(name = "itemService")
	private ItemService itemService;
	
	// 상품 목록 페이지로 이동
	@GetMapping("/itemList")
	public String selectItemList(Model model) {
		
		return "item/item_list";
	}
	
	@GetMapping("/detailItem")
	public String detailItem(String itemCode) {
		return "item/item_detail";
	}
}
