package com.my.shop.vo;

import java.util.Date;

public class GoodsVO {

	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private String gdsThumbImg;
	private Date gdsDate;
	
	//getter
	public int getGdsNum() {return gdsNum;}
	public String getGdsName() {return gdsName;}
	public String getCateCode() {return cateCode;}
	public int getGdsPrice() {return gdsPrice;}
	public int getGdsStock() {return gdsStock;}
	public String getGdsDes() {return gdsDes;}
	public String getGdsImg() {return gdsImg;}
	public String getGdsThumbImg() {return gdsThumbImg;}
	public Date getGdsDate() {return gdsDate;}

	//setter
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setGdsName(String gdsName) {this.gdsName = gdsName;}
	public void setCateCode(String cateCode) {this.cateCode = cateCode;}
	public void setGdsPrice(int gdsPrice) {this.gdsPrice = gdsPrice;}
	public void setGdsStock(int gdsStock) {this.gdsStock = gdsStock;}
	public void setGdsDes(String gdsDes) {this.gdsDes = gdsDes;}
	public void setGdsImg(String gdsImg) {this.gdsImg = gdsImg;}
	public void setGdsThumbImg(String gdsThumbImg) {this.gdsThumbImg = gdsThumbImg;}
	public void setGdsDate(Date gdsDate) {this.gdsDate = gdsDate;}
	
}
