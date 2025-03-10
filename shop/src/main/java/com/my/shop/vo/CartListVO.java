package com.my.shop.vo;

import java.util.Date;

public class CartListVO {

	private int cartNum, gdsNum, cartStock, num, gdsPrice;
	private String userId, gdsName, gdsThumbImg;
	private Date addDate;
	
	//getter
	public int getCartNum() {return cartNum;}
	public int getGdsNum() {return gdsNum;}
	public int getCartStock() {return cartStock;}
	public String getUserId() {return userId;}
	public Date getAddDate() {return addDate;}
	public int getNum() {return num;}
	public int getGdsPrice() {return gdsPrice;}
	public String getGdsName() {return gdsName;}
	public String getGdsThumbImg() {return gdsThumbImg;}

	//setter
	public void setCartNum(int cartNum) {this.cartNum = cartNum;}
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setCartStock(int cartStock) {this.cartStock = cartStock;}
	public void setUserId(String userId) {this.userId = userId;}
	public void setAddDate(Date addDate) {this.addDate = addDate;}
	public void setNum(int num) {this.num = num;}
	public void setGdsPrice(int gdsPrice) {this.gdsPrice = gdsPrice;}
	public void setGdsName(String gdsName) {this.gdsName = gdsName;}
	public void setGdsThumbImg(String gdsThumbImg) {this.gdsThumbImg = gdsThumbImg;}

}
