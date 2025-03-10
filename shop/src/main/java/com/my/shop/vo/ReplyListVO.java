package com.my.shop.vo;

import java.util.Date;

public class ReplyListVO {

	private int gdsNum, repNum;
	private String userId, repCon, userName;
	private Date repDate;
	
	//getter
	public int getGdsNum() {return gdsNum;}
	public int getRepNum() {return repNum;}
	public String getUserId() {return userId;}
	public String getRepCon() {return repCon;}
	public String getUserName() {return userName;}
	public Date getRepDate() {return repDate;}

	//setter
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setRepNum(int repNum) {this.repNum = repNum;}
	public void setUserId(String userId) {this.userId = userId;}
	public void setRepCon(String repCon) {this.repCon = repCon;}
	public void setUserName(String userName) {	this.userName = userName;}
	public void setRepDate(Date repDate) {this.repDate = repDate;}
}
