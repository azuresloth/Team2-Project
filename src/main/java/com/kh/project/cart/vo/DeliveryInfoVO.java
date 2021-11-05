package com.kh.project.cart.vo;

public class DeliveryInfoVO {
	private String deliveryName;
	private String postCode;
	private String roadAddr;
	private String detailAddr;
	private String deliveryTell;
	private String[] deliveryTells;
	private String deliveryEmail;
	private String[] deliveryEmails;
	private String deliveryMSG;
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
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
	public String getDeliveryTell() {
		return deliveryTell;
	}
	public void setDeliveryTell(String deliveryTell) {
		this.deliveryTell = deliveryTell;
	}
	public String[] getDeliveryTells() {
		return deliveryTells;
	}
	public void setDeliveryTells(String[] deliveryTells) {
		String deliveryTell = deliveryTells[0] + "-" + deliveryTells[1] + "-" + deliveryTells[2];
		setDeliveryTell(deliveryTell);
	}
	public String getDeliveryEmail() {
		return deliveryEmail;
	}
	public void setDeliveryEmail(String deliveryEmail) {
		this.deliveryEmail = deliveryEmail;
	}
	public String[] getDeliveryEmails() {
		return deliveryEmails;
	}
	public void setDeliveryEmails(String[] deliveryEmails) {
		String deliveryEmail = deliveryEmails[0] + "@" + deliveryEmails[1];
		setDeliveryEmail(deliveryEmail);
	}
	public String getDeliveryMSG() {
		return deliveryMSG;
	}
	public void setDeliveryMSG(String deliveryMSG) {
		this.deliveryMSG = deliveryMSG;
	}
	
	
}
