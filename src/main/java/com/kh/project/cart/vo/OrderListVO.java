package com.kh.project.cart.vo;

import java.util.List;

public class OrderListVO {
	private List<BuyInfoVO>[] orderList;
	private List<BuyInfoVO> orderCodeList;

	
	public List<BuyInfoVO> getOrderCodeList() {
		return orderCodeList;
	}

	public void setOrderCodeList(List<BuyInfoVO> orderCodeList) {
		this.orderCodeList = orderCodeList;
	}

	public List<BuyInfoVO>[] getOrderList() {
		return orderList;
	}

	public void setOrderList(List<BuyInfoVO>[] orderList) {
		this.orderList = orderList;
	}
	
	
}
