package com.kh.project.board.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.board.service.ReplyService;
import com.kh.project.board.vo.ReplyVO;


@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Resource(name = "replyService")
	private ReplyService replyService;
	
	// 댓글 리스트 데이터 전달
	@ResponseBody
	@PostMapping("/selectReplyListAjax")
	List<ReplyVO> selectReplyListAjax(String boardNum) {
		System.out.println("selectReplyListAjax.boardNum" + boardNum);
		return replyService.replyList(boardNum);
	}
	
	// 댓글 등록
	@ResponseBody
	@PostMapping("/insertReplyAjax")
	int insertReplyAjax(ReplyVO vo) {
		System.out.println("insertReplyAjax.vo" + vo);
		return replyService.insertReply(vo);
	}

	
	
	
	

}
