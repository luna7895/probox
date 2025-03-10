package com.my.shop.persistence;

import java.util.List;

import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

//매퍼의 쿼리문을 호출하는 DAO
public interface AdminDAO {

	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품리스트
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품view
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	//유저리스트
	public List<MemberVO> userlist() throws Exception;
	
	//주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	public void delivery(OrderVO order) throws Exception;
	
	public void changeStock(GoodsVO goods) throws Exception;
	
	public List<ReplyListVO> allReply() throws Exception;
	
	public void deleteReply(int repNum) throws Exception;
}
