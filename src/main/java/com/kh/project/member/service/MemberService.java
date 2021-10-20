package com.kh.project.member.service;

import com.kh.project.member.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO memberVO);
	
	//로그인
	public String login(MemberVO memberVO);
}
