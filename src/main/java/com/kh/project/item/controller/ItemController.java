package com.kh.project.item.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardService;
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

	//게시판 서비스 때문에 추가함
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	// 상품 목록 페이지로 이동
	@GetMapping("/mainPage")
	public String selectItemList(Model model, ItemVO itemVO) {
		model.addAttribute("itemList", itemService.selectItemList(itemVO));
		model.addAttribute("recentItemList", itemService.selectRecentItemList());
		model.addAttribute("bestItemList", itemService.selectBestItemList(itemVO));
		
		// 공지 사항 메인페이지에 제목과 작성일을 보여주기
		// List<BoardVO> noticeList = boardService.noticeList();
		// System.out.println("selectItemList().noticeList" + noticeList);
		model.addAttribute("noticeList", boardService.noticeList());
		
		return "item/main_page";
	}
	
	// 메인페이지에서 상품 검색
	@PostMapping("/mainSearchResult")
	public String mainSearchResult(Model model, ItemVO itemVO) {
		// 검색 결과
		itemVO.setTotalCnt(itemService.mainPageSearchCnt(itemVO));
		model.addAttribute("itemList", itemService.mainPageSearchList(itemVO));
		
		// 세부 검색을 위한 정보
		model.addAttribute("itemVO", itemVO);
		
		return "item/main_search_result";
	}
	
	// 메뉴 카테고리 페이지
	@GetMapping("/categoryPage")
	public String categoryPage(Model model, ItemVO itemVO) {
		// 베스트 상품
		model.addAttribute("bestItemList", itemService.selectBestItemList(itemVO));
		// 상품 리스트
		model.addAttribute("itemList", itemService.selectItemList(itemVO));
		return "item/category_page";
	}
	
	// 상품 상세 페이지
	@GetMapping("/itemDetail")
	public String itemDetail(Model model, ItemVO itemVO, HttpServletRequest request) {
		model.addAttribute("requestURI", request.getRequestURI());
		model.addAttribute("itemInfo", itemService.selectItemDetail(itemVO));
		return "item/item_detail";
	}
	
	
}
