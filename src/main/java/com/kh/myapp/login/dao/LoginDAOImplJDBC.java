package com.kh.myapp.login.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.vo.MemberVO;

@Repository
public class LoginDAOImplJDBC implements LoginDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// JdbcTemplater 객체가 root-context.xml에 빈으로 등록되어 주석처리됨

	/*
	 * @Autowired public void setDataSource(DataSource dataSource) {
	 * this.jdbcTemplate = new JdbcTemplate(dataSource); }
	 */

	@Override
	public MemberVO getMember(LoginVO loginVO) {

		MemberVO memVO;
		StringBuffer str = new StringBuffer();
		str.append(
				"select id, passwd, name, birth, phone, gender, cdate, udate from member ")
				.append("where id = ? and passwd = ?");

		memVO = (MemberVO) this.jdbcTemplate.queryForObject(str.toString(),
				new Object[]{loginVO.getId(), loginVO.getPasswd()},
				new BeanPropertyRowMapper<>(MemberVO.class));

		return memVO;
	}

	@Override
	public Map<String, Object> selectUser(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
