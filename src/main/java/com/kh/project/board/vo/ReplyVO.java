package com.kh.project.board.vo;

import java.util.Date;
import java.util.List;

public class ReplyVO {

	private String replyCode;
	private String writer;
	private String content;
	private Date createDate;
	private String boardNum;
	private List<BoardVO> boardList;
	
	
	public List<BoardVO> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyCode=" + replyCode + ", writer=" + writer + ", content=" + content + ", createDate="
				+ createDate + ", boardNum=" + boardNum + ", boardList=" + boardList + "]";
	}
}
