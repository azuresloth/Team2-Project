package com.kh.project.cart.vo;

import org.springframework.stereotype.Component;

@Component
public class BuyInfoVO {
	private String buyCode;
	private String itemCode;
	private String id;
	private int totalPrice;
	private String buyDate;
	private int buyCnt;
	private String buyStatus;
	private String paymentPlan;
	
	
	public String getBuyCode() {
		return buyCode;
	}
	public void setBuyCode(String buyCode) {
		this.buyCode = buyCode;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public int getBuyCnt() {
		return buyCnt;
	}
	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}
	public String getBuyStatus() {
		return buyStatus;
	}
	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}
	public String getPaymentPlan() {
		return paymentPlan;
	}
	public void setPaymentPlan(String paymentPlan) {
		this.paymentPlan = paymentPlan;
	}
	
	
}
