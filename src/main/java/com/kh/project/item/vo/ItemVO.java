package com.kh.project.item.vo;

import java.util.List;

public class ItemVO {
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private String itemIntro;
	private int itemStock;
	private int itemStatus;
	private String cateCode;
	private List<ImageVO> imgList;
	
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
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemIntro() {
		return itemIntro;
	}
	public void setItemIntro(String itemIntro) {
		this.itemIntro = itemIntro;
	}
	public int getItemStock() {
		return itemStock;
	}
	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}
	public int getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(int itemStatus) {
		this.itemStatus = itemStatus;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public List<ImageVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ImageVO> imgList) {
		this.imgList = imgList;
	}
	
}
