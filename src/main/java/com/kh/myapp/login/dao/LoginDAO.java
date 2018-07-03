package com.kh.myapp.login.dao;

import java.util.Map;

import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.vo.MemberVO;

public interface LoginDAO {
	// 회원정보가져오기
	MemberVO getMember(LoginVO LoginVO);

	// 인증
	public Map<String, Object> selectUser(String username);
}
