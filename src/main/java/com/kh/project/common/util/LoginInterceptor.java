package com.kh.project.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.project.member.vo.MemberVO;

// 인터셉터 기능의 클래스를 구현하는 방법
// 1. 일단 클래스를 만든다.
// 2. 인터셉터 기능이 구현된 인터페이스를 구현하거나, 클래스를 상속받는다.
//		인터페이스 - HandlerInterceptor
//		클래스 - HandlerInterceptorAdaptor
// 공통 메소드 : preHandle(), postHandle(), afterComplate() -- 가로채는 기능(메소드 마다 가로채는 시점이 다름)
//		- preHandle() : 컨트롤러에서 --'메소드가 실행되기 전'-- 검문 (ex.로그인 검사)				-메소드 실행 전
//		- postHandle() : 컨트롤러에서 메소드를 실행한뒤 --'jsp로 페이지로 이동하기 전 '-- 검문		-페이지 이동 전
//		- afterComplate() : 컨트롤러를 거치고 --'jsp가 열린 직후'-- 검문							-페이지 이동 후
// 원하는 시점에 동작하는 메소드를 재정의(오버라이딩)한다.

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	// 메소드 오버라이딩으로 불러옴
	
	// 로그인 여부를 검사
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 컨트롤러가 아니기 때문에 객체를 jsp때 처럼 생성해줘야 한다.
		HttpSession session = request.getSession();
		Object result = session.getAttribute("loginInfo");
		
		if(result == null) {
			// 실패할경우 바로 로그인창으로 이동
			//
			
			String requestURI = request.getRequestURI(); System.out.println("요천된 경로 : " +
			requestURI);
			
			response.sendRedirect("/member/goInterceptLogin?requestURI=" + requestURI);
			
			//response.sendRedirect("/member/goInterceptLogin");
			return false;
		}
		
		// 리턴을 true, false로 줄수있다.
		// true -> 할거 다하고 원래 요청으로 간다.
		// false -> 막음
		return true;
	}
	
}
