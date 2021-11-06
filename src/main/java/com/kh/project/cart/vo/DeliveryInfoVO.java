package com.kh.project.cart.vo;

import org.springframework.stereotype.Component;

@Component
public class DeliveryInfoVO {
	private String deliveryName;
	private String postCode;
	private String roadAddr;
	private String detailAddr;
	private String deliveryTell;
	private String[] deliveryTells;
	private String tell1;
	private String tell2;
	private String tell3;
	private String deliveryEmail;
	private String[] deliveryEmails;
	private String email1;
	private String email2;
	private String deliveryMSG;
	
	
	public String getTell1() {
		return tell1;
	}
	public void setTell1(String tell1) {
		this.tell1 = tell1;
	}
	public String getTell2() {
		return tell2;
	}
	public void setTell2(String tell2) {
		this.tell2 = tell2;
	}
	public String getTell3() {
		return tell3;
	}
	public void setTell3(String tell3) {
		this.tell3 = tell3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
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
