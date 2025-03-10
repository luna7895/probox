package com.my.shop.service;

import javax.servlet.http.HttpSession;

import com.my.shop.vo.MemberVO;

public interface MemberService {

	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//login
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//logout
	public void signout(HttpSession session) throws Exception;
}
