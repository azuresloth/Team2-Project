package com.kh.project.admin.vo;

public class SalesManageVO {
	
	private String itemCode;
	private String itemName;
	private int totalPrice;
	private int itemCnt;
	private String cateCode;
	private String cartCode;
	private String buyDate;
	
	
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getItemCnt() {
		return itemCnt;
	}
	public void setItemCnt(int itemCnt) {
		this.itemCnt = itemCnt;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}
	
	
	
}
