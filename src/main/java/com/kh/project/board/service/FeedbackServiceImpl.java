package com.kh.project.board.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.FeedbackVO;


@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FeedbackVO> feedbackList(String itemCode) {
		return sqlSession.selectList("feedbackMapper.feedbackList", itemCode);
	}

	@Override
	public void insert(FeedbackVO feedbackVO) {
		sqlSession.insert("feedbackMapper.insert", feedbackVO);
	}

	@Override
	public void updateFeedback(FeedbackVO feedbackVO) {
		sqlSession.update("feedbackMapper.updateFeedback", feedbackVO);
	}




}
//