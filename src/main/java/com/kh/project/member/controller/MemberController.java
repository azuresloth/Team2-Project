package com.kh.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



//Controller 어노테이션을 사용해서
//해당 클래스가 controller 역할을 할 수 있도록 지정
//RequestMapping("/board")를 사용하여 해당 컨트롤러가 
// 어떤 요청에 의해 실행될지를 결정
// 요청 경로가 board로 시작하면 컨트롤러가 지금은 실행

//페이지 요청 경로를 받는 어노테이션
//@RequestMapping : 주로 컨트롤러에 사용
//@GetMapping : 메소드에서만 사용 가능
//@PostMapping : 메소드에서만 사용 가능 
@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	//회원가입 창으로이동
	@GetMapping("/goJoin")
	public String goJoin() {
		return "member/join";
	}

	//로그인 창으로 이동
	@GetMapping("/goLogin")
	public String goLogin() {
		return "member/login";
	}

	//회원탈퇴 
	
	//정보수정
	
	
	
}

