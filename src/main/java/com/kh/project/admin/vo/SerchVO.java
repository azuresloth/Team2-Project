package com.kh.project.admin.vo;

import com.kh.project.board.vo.PageVO;

public class SerchVO extends PageVO{
	private String startDate;
	private String endDate;
	private String serchStatus;
	
	public String getSerchStatus() {
		return serchStatus;
	}
	public void setSerchStatus(String serchStatus) {
		this.serchStatus = serchStatus;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
