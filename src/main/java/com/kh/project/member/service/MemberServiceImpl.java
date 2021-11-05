package com.kh.project.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.kh.project.cart.vo.CartViewVO;
import com.kh.project.member.vo.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public void memberJoin(MemberVO memberVO) {
		sqlSession.insert("memberMapper.memberJoin", memberVO);
		
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
		
	}

	@Override
	public boolean confirmRepetitionId(String id) {
		String result = sqlSession.selectOne("memberMapper.confirmRepetitionId", id);
		return result == null? false : true;
	}

	@Override
	public MemberVO findId(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.findId",memberVO);
	}

	@Override
	public MemberVO findPw(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.findPw",memberVO);
	}

	@Override
	public void updatePw(MemberVO memberVO) {
		sqlSession.update("memberMapper.updatePw");
	}

	@Override
	public int deleteMember(MemberVO memberVO) {
		return sqlSession.delete("memberMapper.deleteMember",memberVO);
	}

	@Override
	public MemberVO selectBuyMemberInfo(CartViewVO cartViewVO) {
		return sqlSession.selectOne("memberMapper.selectBuyMemberInfo", cartViewVO);
	}

}
