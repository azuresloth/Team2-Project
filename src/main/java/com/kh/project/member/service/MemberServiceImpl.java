package com.kh.project.member.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

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

}
