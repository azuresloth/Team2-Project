package com.kh.project.item.controller;

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
@RequestMapping("/item")
public class ItemController {
	@Resource(name = "itemService")
	private ItemService itemService;
	@Resource(name = "commonService")
	private CommonService commonService;
	
	// 상품 목록 페이지로 이동
	@GetMapping("/mainPage")
	public String selectItemList(Model model) {
		model.addAttribute("itemList", itemService.selectItemList());
		model.addAttribute("recentItemList", itemService.selectRecentItemList());
		model.addAttribute("bestItemList", itemService.selectBestItemList());
		
		// 카테고리 메뉴 목록조회 후 jsp로 전달
		model.addAttribute("categoryList", itemService.selectCategoryList());
		
		// 어드민일 경우 메뉴 목록 조회후 전달
		model.addAttribute("menuList", commonService.selectMenuList());
		return "item/main_page";
	}
	
	// 메인페이지에서 상품 검색
	@PostMapping("/mainSearchResult")
	public String mainSearchResult(Model model, ItemVO itemVO) {
		// 검색 결과
		itemVO.setTotalCnt(itemService.mainPageSearchCnt(itemVO));
		model.addAttribute("itemList", itemService.mainPageSearchList(itemVO));
		
		// 세부 검색을 위한 정보
		// 카테고리 
		model.addAttribute("categoryList", itemService.selectCategoryList());
		model.addAttribute("itemVO", itemVO);
		
		return "item/main_search_result";
	}
}
