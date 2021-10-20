package com.kh.project.item.service;

import java.util.List;

import com.kh.project.item.vo.ItemVO;

public interface ItemService {
	// 상품 목록 조회
	List<ItemVO> selectItemList();
	
	// 신상품 목록 조회
	List<ItemVO> selectRecentItemList();
	
	// 베스트 상품 목록 조회
	List<ItemVO> selectBestItemList();
}
