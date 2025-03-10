package com.my.shop.vo;
/*
create table tbl_order_details(
orderDetailsNum number not null primary key,
orderId varchar2(100) not null,
gdsNum number not null,
cartStock number not null,
constraint tbl_order_details_orderId foreign key(orderId) references tbl_order(orderId)
);
 */
public class OrderDetailVO {
	
	private int orderDetailsNum, gdsNum, cartStock;
	private String orderId;
	
	//getter
	public int getOrderDetailsNum() {return orderDetailsNum;}
	public int getGdsNum() {return gdsNum;}
	public int getCartStock() {return cartStock;}
	public String getOrderId() {return orderId;}

	//setter
	public void setOrderDetailsNum(int orderDetailsNum) {this.orderDetailsNum = orderDetailsNum;}
	public void setGdsNum(int gdsNum) {this.gdsNum = gdsNum;}
	public void setCartStock(int cartStock) {this.cartStock = cartStock;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	
	
}
