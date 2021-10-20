package com.kh.project.board.vo;

import java.util.Date;

public class BoardVO {
	private String boardNum; 
	private String writer;		// jsp에서 받는다.
	private Date createDate;	
	private String content;		// jsp에서 받는다.
	private int readCnt;	
	private String title;		// jsp에서 받는다.
	
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", writer=" + writer + ", createDate=" + createDate + ", content="
				+ content + ", readCnt=" + readCnt + ", title=" + title + "]";
	}
	
	
	
	
}
