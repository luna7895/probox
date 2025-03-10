package com.my.shop.vo;

import java.util.Date;

public class CartVO {

	private int cartNum, gdsNum, cartStock;
	private String userId;
	private Date addDate;
	
	//getter
	public int getCartNum() {return cartNum;}
	public int getGdsNum() {return gdsNum;}
	public int getCartStock() {return cartStock;}
	public String getUserId() {return userId;}
	public Date getAddDate() {return addDate;}

	//setter
	public void setCartNum(int cartNum) {this.cartNum = cartNum;}
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setCartStock(int cartStock) {this.cartStock = cartStock;}
	public void setUserId(String userId) {this.userId = userId;}
	public void setAddDate(Date addDate) {this.addDate = addDate;}

}
