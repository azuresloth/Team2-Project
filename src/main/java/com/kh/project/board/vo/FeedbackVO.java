package com.kh.project.board.vo;

import java.util.Date;

public class FeedbackVO {
	private String fbCode;
	private String title;
	private String content;
	private String originalFileName;
	private String attachedFileName;
	private Date createDate;
	private String itemCode;
	private String id;
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getFbCode() {
		return fbCode;
	}
	public void setFbCode(String fbCode) {
		this.fbCode = fbCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getAttachedFileName() {
		return attachedFileName;
	}
	public void setAttachedFileName(String attachedFileName) {
		this.attachedFileName = attachedFileName;
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
	@Override
	public String toString() {
		return "FeedbackVO [fbCode=" + fbCode + ", title=" + title + ", content=" + content + ", originalFileName="
				+ originalFileName + ", attachedFileName=" + attachedFileName + ", createDate=" + createDate
				+ ", itemCode=" + itemCode + ", id=" + id + "]";
	}
	
	
}
