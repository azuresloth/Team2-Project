package com.kh.project.member.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.member.service.MemberService;
import com.kh.project.member.vo.MemberVO;



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
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//회원가입 창으로이동
	@GetMapping("/goJoin")
	public String goJoin() {
		return "member/join";
	}
	
	//회원가입
	@PostMapping("/join")
	public String memberJoin(MemberVO memberVO) {
		
		memberService.memberJoin(memberVO);
		
		return "redirect:/item/mainPage";
	}

	//로그인 창으로 이동
	@GetMapping("/goLogin")
	public String goLogin(@RequestParam(required = false, defaultValue = "1") int loginResult, Model model) {
		model.addAttribute("loginResult", loginResult);
		return "member/login";
	}
	//로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session, Model model) {
		MemberVO loginInfo = memberService.login(memberVO);
	
		
		if(loginInfo != null) {
			session.setAttribute("loginInfo", loginInfo);
			
			
			if(loginInfo.getIsAdmin().equals("Y")) {
				
				return "redirect:/admin/adminMenu";
			}
			else {
				return "redirect:/item/mainPage";
			}
		
		}
		else {
			int result = 0;
			model.addAttribute("loginResult", result);
			return "redirect:/member/goLogin";
		}
		
	}
	
	// 인터셉트 로그인 창으로 이동
	@GetMapping("/goInterceptLogin")
	public String goInterceptLogin(@RequestParam(required = false, defaultValue = "1") int loginResult, HttpSession session, Model model, @RequestParam(required = false) String requestURI) {
		model.addAttribute("loginResult", loginResult);
		
		model.addAttribute("requestURI", requestURI); System.out.println("!!!!!!@!@" + requestURI);
		return "member/intercept_login";
		
		
	}
	// 인터셉트 로그인
	@PostMapping("/interceptLogin")
	public String interceptLogin(MemberVO memberVO, HttpSession session, Model model, @RequestParam(required = false) String requestURI) {
		
		//System.out.println("11111111" + requestURI);
		
		MemberVO loginInfo = memberService.login(memberVO);
	
		
		if(loginInfo != null) {
			session.setAttribute("loginInfo", loginInfo);
			
			 
			if(loginInfo.getIsAdmin().equals("Y")) {
				if(requestURI.substring(0, 7).equals("/admin/")) {
					return "member/intercept_login_result";
				}
				else { 
					return "redirect:/admin/adminMenu";
				}
				//return "member/intercept_login_result"; 
			}
			else {  
				if(requestURI.substring(0, 7).equals("/admin/")) {
					return "redirect:/item/mainPage";
				}
				else {
					return "member/intercept_login_result";
				}
//				return "redirect:" + requestURI;  
			}
		
		}
		else {
			int result = 0;
			model.addAttribute("loginResult", result);
			return "redirect:/member/goLogin";
		}
		
	}
	
	//아이디 찾기 화면으로 이동
	@GetMapping("/findIdForm")
	public String goFindId() {
		
		return"member/find_id_form";
	}
	//아이디 찾기
	@PostMapping("/findId")
	public String findId(MemberVO memberVO) {
		memberService.findId(memberVO);
		
		return"member/goLogin";
	}
	//비밀번호 찾기 화면으로 이동
	@GetMapping("/findPwForm")
	public String goFindPw() {
			
		return"member/find_pw_form";
	}
	
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping("/checkIdAjax")
	public boolean checkId(String id) {
		
		return memberService.confirmRepetitionId(id);
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/item/mainPage";
	}
	//회원탈퇴
	@PostMapping("/deleteMember")
	public String deleteMember(MemberVO memberVO) {
		return "redirect:/item/mainPage";
	}
	//개인정보수정
	
	
	
}


