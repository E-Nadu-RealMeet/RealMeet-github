package com.nadu.rms.vo;

public class Users {
	private String id;
	private String pwd;
	private String nickname;
	private String phone;
	private int rating;
	private String interest;
	private String type;
	private String imgsrc;
	private String email;
	private int cert;
	private String flogdate;
	private String fregdate;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCert() {
		return cert;
	}
	public void setCert(int cert) {
		this.cert = cert;
	}
	public String getFlogdate() {
		return flogdate;
	}
	public void setFlogdate(String flogdate) {
		this.flogdate = flogdate;
	}
	public String getFregdate() {
		return fregdate;
	}
	public void setFregdate(String fregdate) {
		this.fregdate = fregdate;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	
}
