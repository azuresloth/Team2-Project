package com.kh.project.member.service;

import java.util.List;

import com.kh.project.cart.vo.CartViewVO;
import com.kh.project.member.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO memberVO);
	
	//로그인
	 MemberVO login(MemberVO memberVO);
	 
	 //id중복체크
	 boolean confirmRepetitionId(String id);
	 
	 //id찾기
	 MemberVO findId(MemberVO memberVO);
	 
	 //pw찾기
	 MemberVO findPw(MemberVO memberVO);
	 
	 //pw변경
	 void updatePw(MemberVO memberVO);
	 
	 //회원탈퇴
	 int deleteMember(MemberVO memberVO);
	 
	 // 기존 회원정보 조회(주문시 사용)
	 MemberVO selectBuyMemberInfo(CartViewVO cartViewVO);
}
