package com.kh.myapp.login.vo;

import java.sql.Date;
import java.util.Collection;

import javax.persistence.Entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Entity
@Data
public class SecurityLoginVO extends User {

	private String id;
	private String passwd;
	private String name; // 이름
	private String birth; // 생년월일
	private String phone; // 연락처
	private String gender; // 성별
	private Date cdate; // 생성일
	private Date udate; // 수정일

	private static final long serialVersionUID = 1L;

	public SecurityLoginVO(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

}
