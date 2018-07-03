package com.kh.myapp.login.service;

import java.util.Map;

import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.vo.MemberVO;

public interface LoginService {
	// 회원정보가져오기
	MemberVO getMember(LoginVO loginVo);

	// 인증처리
	Map<String, Object> selectUser(String username);
}
