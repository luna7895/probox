package com.my.shop.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopDAO {
	
	//상품리스트
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;

	List<GoodsViewVO> list(int cateCode) throws Exception;
	
	//2차 카테고리
	List<CategoryVO> subCateList(@Param("cateCode") int cateCode) throws Exception;
	
	//상품 검색
	List<GoodsViewVO> searchItem(String searchKeyword) throws Exception;
	
	//상품 view page
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//댓글 쓰기
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//카트 담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartlist(String userId) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//모두 삭제
	public void cartAllDelete(String userId) throws Exception;
	
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//상세정보 디테일
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//특정 오더 리스트
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//특정 오더 뷰
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
