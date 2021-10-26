package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.FeedbackVO;

public interface FeedbackService {
	
	//후기 리스트 전달
	List<FeedbackVO> feedbackList(String itemCode);
	
	// 후기등록
	void insert(FeedbackVO feedbackVO);
}
