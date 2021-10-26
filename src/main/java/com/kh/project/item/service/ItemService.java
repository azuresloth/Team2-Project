package com.kh.project.item.service;

import java.util.List;

import com.kh.project.item.vo.CategoryVO;
import com.kh.project.item.vo.ItemVO;

public interface ItemService {
	// 패스 정해주기
	CategoryVO selectPath(ItemVO itemVO);
	
	// 상품 목록 조회
	List<ItemVO> selectItemList();
	
	// 신상품 목록 조회
	List<ItemVO> selectRecentItemList();
	
	// 베스트 상품 목록 조회
	List<ItemVO> selectBestItemList(ItemVO itemVO);
	
	// 카테고리 메뉴 조회
	List<CategoryVO> selectCategoryList();
	
	// 메인페이지 상품 검색
	List<ItemVO> mainPageSearchList(ItemVO itemVO);
	// 메인페이지 상품 검색결과 갯수
	int mainPageSearchCnt(ItemVO itemVO);
	
	// 상품 상세조회
	ItemVO selectItemDetail(ItemVO itemVO);
}
