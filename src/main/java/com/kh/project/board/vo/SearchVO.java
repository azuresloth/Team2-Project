package com.kh.project.board.vo;

public class SearchVO {
	private String searchColunm;
	private String searchWord;
	
	public String getSearchColunm() {
		return searchColunm;
	}
	public void setSearchColunm(String searchColunm) {
		this.searchColunm = searchColunm;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return "SearchVO [searchColunm=" + searchColunm + ", searchWord=" + searchWord + "]";
	}
	
	
	
}
