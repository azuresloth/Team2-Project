package com.kh.project.board.vo;

public class PageVO extends SearchVO{
	
	//현제 페이지를 DATABASE에서 가져올때 필요한정보
	private int page; //현재 페이지
	private int perPageRowNum; // 페이지당 보여주는 글(ROW)의 갯수
	private int startRow; //현제 페이지의 시작 줄번호
	private int endRow; //현제 페이지의 끝 줄번호
	
	//게시판 하단 페이지 네이션에 표시에를 할때 필요한 정보
	private int perGroupPageNum; // 기본값 10을 생성자에서 셋팅
	private int startPage;
	private int endPage;
	private int totalPage;
	
	//DATABASE
	private int totalRow;
	
	// 글번호 붙이기위한 번호
	private int rowNum;
	
	public PageVO() {
		// 처음 리스트로 들어올 때는 데이터가 안 넘어 오므로 초기값을 1페이지에
		// 한페이지당 10개의 글을 보이도록 셋팅한다.
		this.page =1;
		this.perPageRowNum = 10;
		
		//JSP 하단 부분에 몇개의 페이지를 표시할지 정한다.
		this.startPage = 1;
		this.endPage = 1;
		this.perGroupPageNum = 10;
		

	}
	public int getPerPageRowNum() {
		return perPageRowNum;
	}

	public void setPerPageRowNum(int perPageRowNum) {
		this.perPageRowNum = perPageRowNum;
	}

	public int getPerGroupPageNum() {
		return perGroupPageNum;
	}

	public void setPerGroupPageNum(int perGroupPageNum) {
		this.perGroupPageNum = perGroupPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalRow() {
		return totalRow;
	}
	
	public int getRowNum() {
		return rowNum;
	}
	
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		// 시작줄 번호와 끝 줄번호 계산
		// 현제페이지의 이전 페이지까지 데이터를 skip시키고 그 다음 번호를 시작번호로한다.
		startRow = (page-1)*perPageRowNum + 1;
		endRow = startRow + perPageRowNum - 1;
		
		// 리스트 화면 하단 부분에 나타내는 페이지를 처리하기 위한 데이터들을 계산
		// 전체 페이지를 계산할수 있다.
		totalPage = (totalRow - 1)/perPageRowNum +1;
		
		//startPage, endPage
		startPage = (page -1)/perGroupPageNum * perGroupPageNum +1;
		endPage = startPage + perGroupPageNum -1;
		//endPage가 총페이지 수를 넘을수 없다.
		if(endPage > totalPage)	endPage = totalPage;
		
		//게시글 목록 순차번호를 붙히기위한 계산
		rowNum = totalRow - ((page -1 ) * perPageRowNum);
		
	}
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", perPageRowNum=" + perPageRowNum + ", startRow=" + startRow + ", endRow="
				+ endRow + ", perGroupPageNum=" + perGroupPageNum + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalPage=" + totalPage + ", totalRow=" + totalRow + ", rowNum=" + rowNum + ", toString()="
				+ super.toString() + "]";
	}

	
}












