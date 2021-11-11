package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.BoardVO;
import com.kh.project.board.vo.PageVO;

public interface BoardService {
	
	//글목록
	List<BoardVO> boardList(PageVO pageVO);
	
	// 글등록
	int write(BoardVO boardVO);
	
	// 글 보기
	BoardVO view(String boardNum, int numForReadCnt);
	
	//글 수정 처리
	int update(BoardVO boardVO);
	
	// 글삭제
	int delete(String boardNum);
	
	// 공지사항 리스트 전달
	List<BoardVO> noticeList();
	
	// 아이디로 작성한 글 목록 리스트 전달
	List<BoardVO> boardListWrittenById(String loginId);
	
	// 아이디로 작성한 글 보기
	BoardVO viewPersonalboard(String boardNum);
	
	// 아이디로 작성한 글 수정 처리
	void updatePersonalBoard(BoardVO boardVO);
	
	// 아이디로 쓴글 삭제 처리
	void deletePersonalBoard(String boardNum);
	
}
