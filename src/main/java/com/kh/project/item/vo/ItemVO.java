package com.kh.project.item.vo;

import java.util.List;

import com.kh.project.common.vo.PageVO;

public class ItemVO extends PageVO{
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private String itemIntro;
	private int itemStock;
	private int itemStatus;
	private String cateCode;
	private List<ImgVO> imgList;
	private int minPrice;
	private int maxPrice;
	private String orderBy;
	private int saleCnt;
	
	public int getSaleCnt() {
		return saleCnt;
	}
	public void setSaleCnt(int saleCnt) {
		this.saleCnt = saleCnt;
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
	public List<ImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ImgVO> imgList) {
		this.imgList = imgList;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
}
