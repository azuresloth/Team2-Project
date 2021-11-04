package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.ReplyVO;

public interface ReplyService {
	
	// 댓글 리스트
	List<ReplyVO> replyList(String boardNum);
	
	// 댓글 등록
	int insertReply(ReplyVO vo);
}
