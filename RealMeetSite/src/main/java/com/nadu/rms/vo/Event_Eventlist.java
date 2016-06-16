package com.nadu.rms.vo;

public class Event_Eventlist {
	private String esidx;
	private String eventname;
	private String holder;
	private String description;
	private String imgsrc;
	private String abs; //간단한 설명
	private String category;
	private String elidx;
	private String addr;
	private String eldate;
	private String maxgnum;
	private int good;
	private String latlng;
	
	public String getLatlng() {
		return latlng;
	}
	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getMaxgnum() {
		return maxgnum;
	}
	public void setMaxgnum(String maxgnum) {
		this.maxgnum = maxgnum;
	}
	public String getEsidx() {
		return esidx;
	}
	public void setEsidx(String esidx) {
		this.esidx = esidx;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getAbs() {
		return abs;
	}
	public void setAbs(String abs) {
		this.abs = abs;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getElidx() {
		return elidx;
	}
	public void setElidx(String elidx) {
		this.elidx = elidx;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEldate() {
		return eldate;
	}
	public void setEldate(String eldate) {
		this.eldate = eldate;
	}
}
