package com.my.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.shop.service.ShopService;
import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.MemberVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Inject
	ShopService service;
	
	//카테고리별 상품리스트
	@GetMapping("/list")
    public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model)throws Exception{
       logger.info("소비자 페이지 진입");
       List<GoodsViewVO> list = null;
       list = service.list(cateCode, level);
       model.addAttribute("list", list);
    }
	
	//2차 카테고리
	@ResponseBody
	@GetMapping("/list/subCateList")
	public List<CategoryVO> getSubCateList(@RequestParam("cateCode") int cateCode) throws Exception{
		logger.info("2차 카테");
		List<CategoryVO> subCateList = service.subCateList(cateCode);
        return subCateList;
    }

	//상품 검색
	@GetMapping("/search")
	public String getSearchItem(@RequestParam("searchKeyword") String searchKeyword, Model model) throws Exception{
		List<GoodsViewVO> search = service.searchItem(searchKeyword);
		model.addAttribute("search", search);
		return "shop/search";
	}
	
	//상품 조회
	@GetMapping("/view")
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception{
	   logger.info("상품 조회 신입");
	   GoodsViewVO view = service.goodsView(gdsNum);
	   model.addAttribute("view", view);
	}
	

	//댓글 쓰기
	//뷰를 통해 렌더링 되지 않고 클라이언트에게 직접 전달
	@ResponseBody
	@PostMapping("/view/registReply")
	public void registReply(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("regist reply");
		//로그인 세션(웹에서 사용자가 가지는 url)
		MemberVO member = (MemberVO)session.getAttribute("member");
		reply.setUserId(member.getUserId());
		//서비스 로직
		service.registReply(reply);//기사산업기사에 정의하는 관점에서는 클래스와 클래스 사이를 연결하는 가교 역할을 하는 것
		//자바만의 관점으로는 바디가 없는 구현체 두음법칙 단통시인
		
	}
	
	//댓글 리스트
	//로직에서 리턴을 사용하는 3명(list, read,0=오류, 1=성공, -1=네트워크 오류(크리에이트와 딜리트)
	@ResponseBody
	@GetMapping("/view/replyList")
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception{
		logger.info("enter reply list");
		List<ReplyListVO> reply = service.replyList(gdsNum);
		return reply;
	}
	
	//댓글 삭제
	//로그인한 아이디와 소감을 작성한 아이디 비교 둘다 일치하면 삭제 그렇지 않으면 실패
	@ResponseBody
	@PostMapping("/view/deleteReply")
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception{
		//정상작동 여부를 확인하기 위한 변수
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		//댓글을 작성한 사용자의 아이디를 가져와서 대입
		String userId = service.idCheck(reply.getRepNum()); //현재 접속한 id vs 댓글을 쓴 id
		//아이디 비교
		if(member.getUserId().equals(userId)) { //로그인한 아이디가 작성한 아이디와 같다면
			reply.setUserId(member.getUserId()); //reply에 userId 저장
			service.deleteReply(reply); //서비스의 메서드 실행
			result = 1; //성공
		}
		//하나만 oneway, option
		return result; //아이디가 일치하면 석제. 그렇지 않으면 안삭제
	}
	
	//아이디 체크
	
	
	//댓글 수정
	@ResponseBody
	@PostMapping("/view/modifyReply")
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception{
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		//댓글을 작성한 사용자의 아이디를 가져와서 대입
		String userId = service.idCheck(reply.getRepNum()); //현재 접속한 id vs 댓글을 쓴 id
		//아이디 비교
		if(member.getUserId().equals(userId)) { //로그인한 아이디가 작성한 아이디와 같다면
			reply.setUserId(member.getUserId()); //reply에 userId 저장
			service.modifyReply(reply); //서비스의 메서드 실행
			result = 1; //성공
		}
		//하나만 oneway, option
		return result;
	}
	
	//카트담기 RDBMS
	@ResponseBody
	@PostMapping("/view/addCart")
	public void addCart(CartVO cart, HttpSession session) throws Exception{
		logger.info("insert cart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		cart.setUserId(member.getUserId());
		
		service.addCart(cart);
	}
	
	//카트 목록
	@GetMapping("/cartList")
	public void getCartList(HttpSession session, Model model) throws Exception{
		logger.info("enter cartList");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();

		List<CartListVO> cartList = service.cartList(userId);
		model.addAttribute("cartList", cartList);
	}
	
	//카트 삭제
	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value="chbox[]") List<String> chArr, CartVO cart) throws Exception{
		logger.info("cart delete");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0; //결과값
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) { //에이잭스에서 받은 chArr의 갯수만큼 반복
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1; // suc ? = 1 fail = 0 오라클 등 기타 db문제 -1
			//자바스크립트에서 값이 없으면 거짓(false)=0 true(최진실)=1
		}
		return result;
	}
	
	//주문
	@PostMapping("/cartList")
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception{
		logger.info("order");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		//캘린더 호출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); //월 추출
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = ""; //랜덤 숫자를 저장할 문자열 변수
		
		for(int i=1; i<=6; i++) {
			subNum +=(int)(Math.random() * 10); //0~9까지의 숫자를 생성하여 subNum에 저장
		}
		
		String orderId = ymd + "_" + subNum; //_[연월일]_[랜덤 숫자]
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		//주문테이블, 주문 상세 테이블에 데이터를 전송하고 카트 비우기
		service.cartAllDelete(userId);
		
		return "redirect:/shop/orderList";
	}

	//주문 목록
	@GetMapping("/orderList")
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception{
		logger.info("orderlist");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		List<OrderVO> orderList = service.orderList(order);
		model.addAttribute("orderList", orderList);
		
	}
	
	//주문 상세 목록
	@GetMapping("/orderView")
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model) throws Exception{
		logger.info("orderview");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setOrderId(orderId);
		order.setUserId(userId);

		List<OrderListVO> orderView = service.orderView(order);
		model.addAttribute("orderView", orderView);
	}
}
