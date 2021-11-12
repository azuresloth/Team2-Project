package com.kh.project.board.vo;

import com.kh.project.common.vo.BaseSearchVO;

public class SearchVO extends BaseSearchVO{
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
