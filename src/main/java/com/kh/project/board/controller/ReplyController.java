package com.kh.project.board.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.board.service.ReplyService;
import com.kh.project.board.vo.ReplyVO;
import com.kh.project.member.vo.MemberVO;


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
	
	// 댓글 삭제 처리
	@ResponseBody
	@PostMapping("/deleteReplyAjax")
	int deleteReplyAjax(String replyCode) {
		System.out.println("deleteReplyAjax.replyCode : " + replyCode);
		return replyService.deleteReply(replyCode);
	}
	
	// 개인이 쓴 댓글 글을 관리 할수 있게 해준다.
	@GetMapping("/personalReplyList")
	public String personalBoard(HttpSession session,Model model) {
		// 로그인 한 아이디를 가지고 오기
		String loginId = ((MemberVO)session.getAttribute("loginInfo")).getId();
		System.out.println("personalBoard.id() : ------------------------------------------------------" + loginId);
		
		// 로그인 한 아이디로 게시판에 글쓴거만 가지고오기.
		List<ReplyVO> userReplyList = replyService.userReplyList(loginId);
		System.out.println("personalBoard().List<ReplyVO>" + userReplyList);
		// jsp에 사용자가 작성한 댓글 모두 보여주기
		model.addAttribute("userReplyList", userReplyList);
		
		// 이동할 jsp 주소 전달해준다.
		model.addAttribute("pathList", "personalReplyList");
		return "board/personalBoard";
		// 이동하는 곳 잘이해 하고 있기
		//여기에 jsp를 뿌려준다는걸 이해하고 있어야 한다.
	}
	
	//댓글 삭제 하기
	@GetMapping("/deletePersonalReply")
	public String deletePersonalReply(String replyCode) {
		//댓글 삭제 후
		replyService.deleteReply(replyCode);
		// 댓글 뿌려주는 콘트롤러로 이동
		return "redirect:/reply/personalReplyList";
	}
	

}
