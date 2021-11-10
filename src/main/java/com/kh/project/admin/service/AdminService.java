package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.BuyStatusVO;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.admin.vo.OrderInfoVO;
import com.kh.project.admin.vo.SalesManageVO;
import com.kh.project.admin.vo.SideMenuVO;
import com.kh.project.board.vo.PageVO;
import com.kh.project.item.vo.ItemVO;
import com.kh.project.member.vo.MemberVO;

public interface AdminService {
	//카테고리 등록
	void insertCategory(CategoryVO categoryVO);
	
	//카테고리 리스트
	List<CategoryVO> selectCategoryList();
	
	//카테고리 삭제
	void deleteCategory(String cateCode);
	//상품 매출 목록 조회
	List<SalesManageVO> selectSales(SalesManageVO salesManageVO);
	
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
	List<OrderInfoVO> selectOderInfoList(OrderInfoVO orderInfoVO);
	
	//상태 조회
	List<BuyStatusVO> selectStatus();
	
	//상태업데이트
	void updateStatus(OrderInfoVO orderInfoVO);
	//기간 내의 팔린 상품 정보 조회
	List<OrderInfoVO> serchDate(OrderInfoVO orderInfoVO);
	
	//item조회
	List<ItemVO> selectItem(PageVO pageVO);
	
	//item상품 판매상태 수정
	void updateItemStatus(ItemVO itemVO);
	
	//상품 삭제
	void deleteItem(String itemCode);
	
	//sideMune조회
	List<SideMenuVO> selectSideMenu(SideMenuVO sideMenuVO);
	
	//회원 목록조회
	List<MemberVO> selectMember();
	
	//회원상세 조회
	MemberVO selectMemberDetail(String id);
	
	//한달 총 상품의 
	int selectAllTotalPrice(OrderInfoVO orderInfoVO);
	
	//itemStock 조회
	int sisk(String itemCode);
}
