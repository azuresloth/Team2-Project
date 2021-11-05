package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.ReplyVO;

public interface ReplyService {
	
	// 댓글 리스트
	List<ReplyVO> replyList(String boardNum);
	
	// 댓글 등록
	int insertReply(ReplyVO vo);
	
	// 댓글 등록 취소를 하기위해 받는 원래 데이터 받기
	String cancelReplyData(String replycode);
	
	// 댓글 수정
	int updateReply(ReplyVO vo);
	
	// 댓글 삭제 
	int deleteReply(String replyCode);
}
