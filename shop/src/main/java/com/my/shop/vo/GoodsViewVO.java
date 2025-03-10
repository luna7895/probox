package com.my.shop.vo;

import java.util.Date;

public class GoodsViewVO {
	
	private int gdsNum, gdsPrice, gdsStock;
	private String gdsName, cateCode, gdsDes, gdsImg, gdsThumbImg, cateCodeRef, cateName;
	private Date gdsDate;
	
	//getter
	public int getGdsNum() {return gdsNum;}
	public int getGdsPrice() {return gdsPrice;}
	public int getGdsStock() {return gdsStock;}
	public String getGdsName() {return gdsName;}
	public String getCateCode() {return cateCode;}
	public String getgdsDes() {return gdsDes;}
	public String getGdsImg() {return gdsImg;}
	public String getGdsThumbImg() {return gdsThumbImg;}
	public String getCateCodeRef() {return cateCodeRef;}
	public String getCateName() {return cateName;}
	public Date getGdsDate() {return gdsDate;}

	//setter
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setGdsPrice(int gdsPrice) {this.gdsPrice = gdsPrice;}
	public void setGdsStock(int gdsStock) {this.gdsStock = gdsStock;}
	public void setGdsName(String gdsName) {this.gdsName = gdsName;}
	public void setCateCode(String cateCode) {this.cateCode = cateCode;}
	public void setgdsDes(String gdsDes) {this.gdsDes = gdsDes;}
	public void setGdsImg(String gdsImg) {this.gdsImg = gdsImg;}
	public void setGdsThumbImg(String gdsThumbImg) {this.gdsThumbImg = gdsThumbImg;}
	public void setCateCodeRef(String cateCodeRef) {this.cateCodeRef = cateCodeRef;}
	public void setCateName(String cateName) {this.cateName = cateName;}
	public void setGdsDate(Date gdsDate) {this.gdsDate = gdsDate;}
}
