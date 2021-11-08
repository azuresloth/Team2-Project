package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.FeedbackVO;

public interface FeedbackService {
	
	//후기 리스트 전달
	List<FeedbackVO> feedbackList(String itemCode);
	
	// 후기등록
	void insert(FeedbackVO feedbackVO);
	
	// 후기 수정 
	void updateFeedback(FeedbackVO feedbackVO);
	
	// 후기 삭제 
	void deleteFeedback(String fbCode);
	
	// 후기 수정 취소를 위한 정보 제목 내용만 받아가기
	FeedbackVO cancelUpdateFeedbackData(String fbCode);
}
