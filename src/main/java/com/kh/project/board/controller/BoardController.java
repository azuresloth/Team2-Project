package com.kh.project.board.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.service.FeedbackService;
import com.kh.project.board.vo.BoardVO;
import com.kh.project.board.vo.PageVO;
import com.kh.project.board.vo.SearchVO;
import com.kh.project.member.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	// 상품 후기 때문에 추가
	@Resource(name = "feedbackService")
	private FeedbackService feedbackService;
	
	//공지사항 게시판
	@RequestMapping("/boardList")
	//@ModelAttribute PageVO pageVO 를 사용하면 매개 변수를 담은 객체를 jsp까지 전달해준다.
	// pageVO는 searchVO를 상속함.
	public String boardList(Model model, @ModelAttribute PageVO pageVO) {

		System.out.println("boardList().pageVO : " + pageVO);
		// 1.공지 사항 게시글
		model.addAttribute("noticeList", boardService.noticeList());
		
		// 2.일반 게시글
		model.addAttribute("boardList", boardService.boardList(pageVO));
		
		return "board/boardList"; 
	}
	
	//글쓰기 폼으로 이동
	@GetMapping("/writeForm")
	public String writeForm() {
		
		return "board/writeForm";
	}
	
	//글 등록처리
	@PostMapping("/write")
	public String write(BoardVO boardVO) {
	
		//확인용
		System.out.println("write().boardVO" + boardVO);
		boardService.write(boardVO);
		return "redirect:/board/boardList";
	}
	
	// 글 보기
	@GetMapping("/view")
	public String view(Model model, String boardNum, int numForReadCnt) {
		
		model.addAttribute("boardVO", boardService.view(boardNum, numForReadCnt));
		
		System.out.println("boardNum : " + boardNum + ", numForReadCnt : " + numForReadCnt);
		
		return "board/view";
	}
	
	// 글 수정 폼으로 이동
	@GetMapping("/updateForm")
	public String updateForm(Model model, String boardNum, SearchVO searchVO) {
		System.out.println("updateForm().boardNum : " + boardNum);
		System.out.println("updateForm().searchVO : " + searchVO);
		
		model.addAttribute("boardVO", boardService.view(boardNum, 0)); 
		return "board/updateForm";
	}
	
	// 글 수정 처리
	@PostMapping("/update")
	public String update(BoardVO boardVO, int page, int perPageRowNum, String searchColunm, String searchWord) throws UnsupportedEncodingException {
		boardService.update(boardVO);
		
		System.out.println("update().boardVO : " + boardVO);
		System.out.println("update().page : " + page);
		System.out.println("update().perPageRowNum : " + perPageRowNum);
		System.out.println("update().searchColunm : " + searchColunm);
		System.out.println("update().searchWord : " + searchWord);
		
		
		return "redirect:/board/view?boardNum="+ boardVO.getBoardNum() + "&numForReadCnt=0" +"&page=" + page + "&perPageRowNum=" + perPageRowNum
				+ "&searchColunm=" + searchColunm + "&searchWord=" + URLEncoder.encode(searchWord, "utf-8");
	}
	
	// 글 삭제
	@GetMapping("/delete")
	public String delete(String boardNum) {
		boardService.delete(boardNum);
		return "redirect:/board/boardList";
	}
	
	// 개인이 쓴 게시판 글을 관리 할수 있게 해준다.
	@GetMapping("/personalBoard")
	public String personalBoard(HttpSession session,Model model) {
		// 로그인 한 아이디를 가지고 오기
		String loginId = ((MemberVO)session.getAttribute("loginInfo")).getId();
		System.out.println("personalBoard.id() : ------------------------------------------------------" + loginId);
		
		// 로그인 한 아이디로 게시판에 글쓴거만 가지고오기.
		model.addAttribute("boardListWrittenById", boardService.boardListWrittenById(loginId));
		
		return "board/personalBoard";
	}
	
}










