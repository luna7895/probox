package com.my.shop.vo;

public class CategoryVO {

	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private int level;
	
	//getter
	public String getCateName() {return cateName;}
	public String getCateCode() {return cateCode;}
	public String getCateCodeRef() {return cateCodeRef;}
	public int getLevel() {return level;}

	//setter
	public void setCateName(String cateName) {this.cateName = cateName;}
	public void setCateCode(String cateCode) {this.cateCode = cateCode;}
	public void setCateCodeRef(String cateCodeRef) {this.cateCodeRef = cateCodeRef;}
	public void setLevel(int level) {this.level = level;}
	
}
