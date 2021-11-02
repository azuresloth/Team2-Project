package com.kh.project.member.vo;

public class MemberVO {
	private String id;
	private String pw;
	private	String name;
	private String tell;
	private String postCode;
	private String roadAddr;
	private String detailAddr;
	private String gender;
	private String email;
	private String birthday;
	private String isAdmin;
	private String joinDate;
	private String[] tells;
	private String[] mailes;
	
	
	
	
	public String[] getMailes() {
		return mailes;
	}
	public void setMailes(String[] mailes) {
		String email = mailes[0]+"@"+ mailes[1];
		setEmail(email);
	}
	
	public String[] getTells() {
		return tells;
	}
	public void setTells(String[] tells) {
		String tell = tells[0]+ "-" + tells[1] + "-" + tells[2];
		setTell(tell);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	
}
