package com.my.shop.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	private SqlSession sql; //sql명령문 준 것을 담아야해서 가져옴
	
	//매핑해줘야 되는 마이바티스명을 표기
	private static String namespace = "com.my.shop.mappers.shopMapper";
	
	@Override //군으로 분류하기 위해서 해시맵 사용
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<>();
		//어레이 리스트 추가할 때는 해시맵은 put
		map.put("cateCode", cateCode); //map.put(null, map)
		map.put("cateCodeRef", cateCodeRef); //map.put(null, map)

		return sql.selectList(namespace + ".list_1", map);
	}
	
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	//2차 카테고리
	@Override
	public List<CategoryVO> subCateList(int cateCode) throws Exception {
        return sql.selectList(namespace + ".subCateList", cateCode);
	}

	//상품 검색
	@Override
	public List<GoodsViewVO> searchItem(String searchKeyword) throws Exception {
		return sql.selectList(namespace + ".searchItem", "%" + searchKeyword + "%");
	}
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}

	//댓글 쓰기
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registReply", reply);
	}

	//댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", gdsNum);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}

	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}

	//댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
	}
	//sql과 같은 layer dao[인터페이스], daoImpl[확장]

	//카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	//카트 리스트
	@Override
	public List<CartListVO> cartlist(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	//전체 삭제
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}

	//주문 정보
	/* sql 명령을 담아준 레이어
	 * 1) 장바구니에서 주만한 거 리스트로 생성되어 있어야함(세션과 제품과 주문자 이것들 때문에 join사용)
	 * 2) 변심으로 (주문했던거 부분적으로 삭제하거나 다 주문하거나)
	 */
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}

	//주문 상세
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}

	//오더 리스트
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	//오더 뷰
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

}
