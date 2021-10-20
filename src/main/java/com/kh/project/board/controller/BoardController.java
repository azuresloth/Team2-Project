package com.kh.project.board.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.BoardVO;
import com.kh.project.board.vo.PageVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//공지사항 게시판
	@RequestMapping("/boardList")
	//@ModelAttribute PageVO pageVO 를 사용하면 매개 변수를 담은 객체를 jsp까지 전달해준다.
	// pageVO는 searchVO를 상속함.
	public String boardList(Model model, @ModelAttribute PageVO pageVO) {
		
		model.addAttribute("boardList", boardService.boardList(pageVO));
		
		System.out.println("boardList().pageVO : " + pageVO);
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
	public String updateForm(Model model, String boardNum) {
		System.out.println("updateForm().boardNum : " + boardNum);
		model.addAttribute("boardVO", boardService.view(boardNum, 0)); 
		return "board/updateForm";
	}
	
	// 글 수정 처리
	@PostMapping("/update")
	public String update(BoardVO boardVO, int page, int perPageRowNum) {
		System.out.println("update().boardVO : " + boardVO);
		System.out.println("update().page : " + page);
		System.out.println("update().perPageRowNum : " + perPageRowNum);
		
		
		boardService.update(boardVO);
		return "redirect:/board/view?boardNum="+ boardVO.getBoardNum() + "&numForReadCnt=0" +"&page=" + page + "&perPageRowNum=" + perPageRowNum;
	}
	
	// 글 삭제
	@GetMapping("/delete")
	public String delete(String boardNum) {
		boardService.delete(boardNum);
		return "redirect:/board/boardList";
	}
	
}










