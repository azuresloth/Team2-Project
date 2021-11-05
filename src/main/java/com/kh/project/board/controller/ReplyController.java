package com.kh.project.board.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		System.out.println("insertReplyAjax.vo : " + vo);
		return replyService.insertReply(vo);
	}
	
	// 댓글 취소를 위한 오리지날 데이터를 받기
	@ResponseBody
	// 아작스 통신을 할때 한글 깨짐 처리 할때 사용한다.
	@RequestMapping(
					value = "/cancelUpdateReplyAjax",
					method = RequestMethod.POST,
					produces ="application/text; charset=utf8")
	// 한글깨짐 때문에 사용 하지 못한다.
//	@PostMapping("/cancelUpdateReplyAjax")
	String cancelUpdateReplyAjax(String replyCode){
		System.out.println("cancelUpdateReplyAjax.replycode : " + replyCode);
		String content = replyService.cancelReplyData(replyCode);
		System.out.println("cancelUpdateReplyAjax.content : " + content);
		
		return content;
	}
	
	// 댓글 수정 처리
	@ResponseBody
	@PostMapping("/updateReplyAjax")
	int updateReplyAjax(ReplyVO vo) {
		System.out.println("updateReplyAjax.vo : " + vo);
		
		return replyService.updateReply(vo);
	}
	
	// 대글 삭제 처리
	@ResponseBody
	@PostMapping("/deleteReplyAjax")
	int deleteReplyAjax(String replyCode) {
		System.out.println("deleteReplyAjax.replyCode : " + replyCode);
		return replyService.deleteReply(replyCode);
	}
	
	
	
	

}
