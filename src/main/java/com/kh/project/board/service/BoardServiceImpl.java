package com.kh.project.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.BoardVO;
import com.kh.project.board.vo.PageVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> boardList(PageVO pageVO) {
		
		//여기에 총 글의 갯수를 DB에서 구해서 pageVO에 
		// 메서드를 호출해서 startPage와 endPage를 구하게 해준다.
		pageVO.setTotalRow(sqlSession.selectOne("boardMapper.getTotalRow", pageVO));
		
		return sqlSession.selectList("boardMapper.boardList", pageVO);
	}

	@Override
	public int write(BoardVO boardVO) {
		return sqlSession.insert("boardMapper.write", boardVO);
	}

	@Override
	public BoardVO view(String boardNum, int numForReadCnt) {
		if(numForReadCnt == 1) { sqlSession.update("boardMapper.plusReadCnt", boardNum); } 
		return sqlSession.selectOne("boardMapper.view", boardNum);
	}

	@Override
	public int update(BoardVO boardVO) {
		return sqlSession.update("boardMapper.update", boardVO);
	}

	@Override
	public int delete(String boardNum) {
		return sqlSession.delete("boardMapper.delete", boardNum);
	}

	@Override
	public List<BoardVO> noticeList() {
		return sqlSession.selectList("boardMapper.noticeList");
	}

	@Override
	public List<BoardVO> boardListWrittenById(String loginId) {
		return sqlSession.selectList("boardMapper.boardListWrittenById", loginId);
	}

	@Override
	public BoardVO viewPersonalboard(String boardNum) {
		return sqlSession.selectOne("boardMapper.viewPersonalboard", boardNum);
	}

	@Override
	public void updatePersonalBoard(BoardVO boardVO) {
		sqlSession.update("boardMapper.updatePersonalBoard", boardVO);
		
	}

	@Override
	public void deletePersonalBoard(String boardNum) {
		sqlSession.delete("boardMapper.deletePersonalBoard", boardNum);
	}


}
//