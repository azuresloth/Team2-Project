package com.kh.project.common.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.project.item.service.ItemService;

public class CategoryMenuInterceptor extends HandlerInterceptorAdapter{
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// 카테고리 메뉴 목록조회
		modelAndView.addObject("categoryList", itemService.selectCategoryList());
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
