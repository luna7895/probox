package com.my.shop.service;

import java.util.List;

import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

//DAO를 호출하는 서비스를 생성
public interface AdminService {

	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	//유저리스트
	public List<MemberVO> userlist() throws Exception;
	
	//주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	//배송 상태
	public void delivery(OrderVO order) throws Exception;
	
	//상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
	
	//모든 댓글
	public List<ReplyListVO> allReply() throws Exception;
	
	//댓글 삭제
	public void deleteReply(int repNum) throws Exception;
}
