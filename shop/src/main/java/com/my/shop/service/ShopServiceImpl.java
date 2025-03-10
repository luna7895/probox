package com.my.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.my.shop.persistence.ShopDAO;
import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;
	
	@Override //받은 데이터를 기준으로 분류
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0; //카테고리 참조 코드
		//1차 분류와 2차 분류를 만약 이라면
		if(level == 1) { //1차 분류
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
		}else { //2차 분류
			return dao.list(cateCode);
		}
	}

	//2차 카테고리
	@Override
	public List<CategoryVO> subCateList(int cateCode) throws Exception {
		return dao.subCateList(cateCode);
	}

	//상품 검색
	@Override
	public List<GoodsViewVO> searchItem(String searchKeyword) throws Exception {
		return dao.searchItem(searchKeyword);
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	//댓글 쓰기
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	//댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	//댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}

	//카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	//카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartlist(userId);
	}

	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	//카트 전체 삭제
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	//주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	//오더 리스트
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	//오더 뷰
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

}
