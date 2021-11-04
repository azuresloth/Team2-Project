package com.kh.project.board.service;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.ReplyVO;


@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyVO> replyList(String boardNum) {
		return sqlSession.selectList("replyMapper.replyList", boardNum);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return sqlSession.insert("replyMapper.insertReply", vo);
	}


	

}
//