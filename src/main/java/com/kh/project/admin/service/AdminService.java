package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.SalesManageVO;

public interface AdminService {
	//카테고리 등록
	void insertCategory(CategoryVO categoryVO);
	
	//카테고리 리스트
	List<CategoryVO> selectCategoryList();
	
	//카테고리 삭제
	void deleteCategory(String cateCode);
	//상품 매출 목록 조회
	List<SalesManageVO> selectSales();
	
	int selectNextNumber();
	
	String selectNextItemCode();
	
}
