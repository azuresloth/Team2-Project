package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.BuyStatusVO;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.OrderInfoVO;
import com.kh.project.admin.vo.SalesManageVO;
import com.kh.project.item.vo.ItemVO;

public interface AdminService {
	//카테고리 등록
	void insertCategory(CategoryVO categoryVO);
	
	//카테고리 리스트
	List<CategoryVO> selectCategoryList();
	
	//카테고리 삭제
	void deleteCategory(String cateCode);
	//상품 매출 목록 조회
	List<SalesManageVO> selectSales();
	
	//상품등록
	void insertItem(ItemVO itemVO);
	
	//다음 imgCode의 숫자 조회
	int selectNextNumber();
	
	//다음 itemCode의 숫자 조회
	String selectNextItemCode();
	
	//이미지 정보 등록
	void insertImgs(ItemVO itemVO);
	
	//카테고리의 상품의 매출조회
	List<SalesManageVO> selectSalesByCate(SalesManageVO salesManageVO);
	
	//주문정보조회
	List<OrderInfoVO> selectOderInfoList();
	
	//상태 조회
	List<BuyStatusVO> selectStatus();
	
}
