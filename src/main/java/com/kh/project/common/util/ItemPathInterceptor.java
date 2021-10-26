package com.kh.project.common.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.project.item.service.ItemService;
import com.kh.project.item.vo.ItemVO;

public class ItemPathInterceptor extends HandlerInterceptorAdapter{
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// 아이템 페이지들에서 상단 패스 정해주기
		ItemVO itemVO = (ItemVO)modelAndView.getModel().get("itemVO");
		
		modelAndView.addObject("pathInfo", itemService.selectPath(itemVO));
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
