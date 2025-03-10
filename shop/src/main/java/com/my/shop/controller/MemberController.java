package com.my.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.shop.service.MemberService;
import com.my.shop.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	MemberService service; //실제 비즈니스 로직이 흐르는 서비스를 불러옴
	
	//보안을 위해 관리자도 모르게 패스워드 인코더를 써줌
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// 개발자 입장에서 페이지를 진입할 때 터미널에서 작성 해 놓은 메시지가 보임
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping("/signup") // member/signup
	public void getSignup() throws Exception{
		logger.info("회원가입 진입");
	}
	@PostMapping("/signup")
	public String postSignup(MemberVO vo)throws Exception{
		logger.info("회원가입 기능");
		
		//암호 암호화
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		String inputPass2 = vo.getUserPassRe();
		String pass2 = passEncoder.encode(inputPass2);
		vo.setUserPassRe(pass2);
		
		
		service.signup(vo);
		return "redirect:/";
	}
	
	@GetMapping("/signin") // member/signup
	public void getSignin() throws Exception{
		logger.info("로그인 진입");
	}
	@PostMapping("/signin")
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post signin");
		
		MemberVO login = service.signin(vo); //로그인 처리를 위한 서비스 호출
		//signin(vo)는 사용자 입력밧에 맞는 회원 정보를 DB에서 가져오는 역할을 함
		HttpSession session = req.getSession();
		//HttpSession 객체를 통해 현재 HTTP세션(사용자마다 고요한 상태정보)을 가져옴
		//로그인 된 사용자 정보를 세션에 저장하기 위해 사용됨
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		//DB 비밀번호와 입력된 비밀번호를 비교
		if(login != null && passMatch) {//아이디가 존재하고(!= null) 비밀번호가 맞으면(passMatch = true)
			//맴버 세션에 로그인 정보를 부여
			session.setAttribute("member", login);
		}else {//아이디가 존재하지 않고 비밀번호가 틀리다면
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false); //rttr은 리디렉션 시에 1회성 데이터를 전달
			//msg라는 속성에 false를 전달
			return "redirect:/member/signin"; //로그인 화면으로
		}
		return "redirect:/"; //로그인 성공 시
	/*
	 * postSignin메소드가 호출이 되면 로그인 정보(MemberVO vo), Http요청(HttpServletRequest req) 리디렉션 후 추가속성(RedirectAttributes rttr)를
	 * 파라미터로 받는다. throws Exception은 예외처리를 메소드 외부로 위임한다는 뜻
	 */
	}
	//사용자가 아이디와 패스워드를 입력했을 때 하나라도 틀리면 로그인을 방지하고 둘 다 맞아야지 로그인
	
	//로그아웃
	@GetMapping("/signout")
	public String signout(HttpSession session) throws Exception{
		logger.info("logout");
		service.signout(session);
		return "redirect:/";
	}
	
	
}
