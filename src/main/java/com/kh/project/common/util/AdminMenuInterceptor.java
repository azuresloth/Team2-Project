package com.kh.project.common.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.project.common.service.CommonService;

public class AdminMenuInterceptor extends HandlerInterceptorAdapter{
	@Resource(name = "commonService")
	private CommonService commonService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 어드민 메뉴 조회
		modelAndView.addObject("menuList", commonService.selectMenuList());
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
