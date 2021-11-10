package com.kh.project.cart.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

import com.kh.project.admin.vo.BuyStatusVO;

@Component
public class BuyInfoVO  extends BuyStatusVO{
	private String buyCode;
	private String itemCode;
	private String id;
	private int totalPrice;
	private String buyDate;
	private int buyCnt;
	private String buyStatus;
	private String paymentPlan;
	private String deliveryName;
	private String deliveryTell;
	private String[] deliveryTells;
	private String deliveryEmail;
	private String[] deliveryEmails;
	private String deliveryMsg;
	private String postCode;
	private String roadAddr;
	private String detailAddr;
	private int insertCnt;
	private String orderCode;
	private int allTotalPrice;
	private String attachedImgName;
	private String itemName;
	
	
	
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public int getAllTotalPrice() {
		return allTotalPrice;
	}
	public void setAllTotalPrice(int allTotalPrice) {
		this.allTotalPrice = allTotalPrice;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public int getInsertCnt() {
		return insertCnt;
	}
	public void setInsertCnt(int insertCnt) {
		this.insertCnt = insertCnt;
	}
	public String[] getDeliveryTells() {
		return deliveryTells;
	}
	public void setDeliveryTells(String[] deliveryTells) {
		String deliveryTell = deliveryTells[0] + "-" + deliveryTells[1] + "-" + deliveryTells[2];
		setDeliveryTell(deliveryTell);
	}
	public String[] getDeliveryEmails() {
		return deliveryEmails;
	}
	public void setDeliveryEmails(String[] deliveryEmails) {
		String deliveryEmail = deliveryEmails[0] + "@" + deliveryEmails[1];
		setDeliveryEmail(deliveryEmail);
	}
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
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getDeliveryTell() {
		return deliveryTell;
	}
	public void setDeliveryTell(String deliveryTell) {
		this.deliveryTell = deliveryTell;
	}
	public String getDeliveryEmail() {
		return deliveryEmail;
	}
	public void setDeliveryEmail(String deliveryEmail) {
		this.deliveryEmail = deliveryEmail;
	}
	public String getDeliveryMsg() {
		return deliveryMsg;
	}
	public void setDeliveryMsg(String deliveryMsg) {
		this.deliveryMsg = deliveryMsg;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	
	
}
