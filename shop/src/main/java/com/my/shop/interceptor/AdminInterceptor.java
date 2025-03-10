package com.my.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.my.shop.vo.MemberVO;
//특정 조건에 맞지 않으면 가로챔
//스프링 프레임워크에서 사용하는 인터셉터클래스를 사용할 것
//관리자 권한이 있는 사용자인지 아닌지를 판단
public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		//req:요청, res:응답, obj:핸들러 preHandle이 매서드는 요청이 처리되기 전에 실행됨. 여기서 요청을 가로채고 필요한 조건을 체크
		HttpSession session = req.getSession(); //세션을 가져옴
		MemberVO member = (MemberVO)session.getAttribute("member");
		//세션에서 "member"속성에 저장된 MemberVO객체[사용자의 정보를 가지고 있는 객체]를 가지고 옴
		if(member == null) {
			res.sendRedirect("/Member/signin");
			return false; /* 자바스크립트에서는 기본적인 이벤트 전파를 방지 
			1) 조건에 따른 실패 또는 부정적인 결과 = 메소드가 조건을 만족하지 못 했거나 실패했을 때 호출자에게 알리기 위해서
			2) boolean을 리턴하는 메소드에서 특정 조건이 만족되지 않으면  false를 리턴
			3) 반복문에서 종료 신호 = 더이상 처리가 필요없다는 신호
			4) 유효성 검사 = 입력값이 유효하지 않거나 없을 경우 - 검사 실패를 나타낼 때 
			   실패, 잘못된 상태, 조건 물만족일 때를 나타냄
			*/
		}
		if(member.getVerify() != 9) {
			res.sendRedirect("/"); //location.href
			return false;
		}
		return true;
	}
}
