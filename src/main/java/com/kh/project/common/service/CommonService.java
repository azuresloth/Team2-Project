package com.kh.project.common.service;

import java.util.List;

import com.kh.project.common.vo.MenuVO;
import com.kh.project.common.vo.SideMenuVO;


public interface CommonService {
	// 메뉴 목록 조회
	List<MenuVO> selectMenuList();
	
	// 사이드 메뉴 목록 조회
	List<SideMenuVO> selectSideMenuList(String menuCode);
}











