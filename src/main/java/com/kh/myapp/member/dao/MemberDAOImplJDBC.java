package com.kh.myapp.member.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.myapp.member.vo.MemberVO;

@Repository
public class MemberDAOImplJDBC implements MemberDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(MemberVO memberVO) {

		StringBuffer str = new StringBuffer();
		str.append("insert into member(id, passwd, name, birth, phone, gender) ");
		str.append("values(?, ?, ?, ?, ?, ?) ");

		this.jdbcTemplate.update(str.toString(), memberVO.getId(),
				memberVO.getPasswd(), memberVO.getName(), memberVO.getBirth(),
				memberVO.getPhone(), memberVO.getGender());
	}

	@Override
	public MemberVO getMember(String id) {

		MemberVO memberVO;
		StringBuffer str = new StringBuffer();
		str.append(
				"select id, passwd, name, birth, phone, gender, cdate, udate from member where id = ?");

		memberVO = (MemberVO) this.jdbcTemplate.queryForObject(str.toString(),
				new Object[]{id}, new BeanPropertyRowMapper<>(MemberVO.class));

		return memberVO;
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {

		ArrayList<MemberVO> alist = new ArrayList<>();
		StringBuffer str = new StringBuffer();
		str.append("select * from member");

		alist = (ArrayList<MemberVO>) this.jdbcTemplate.query(str.toString(),
				new BeanPropertyRowMapper<MemberVO>(MemberVO.class));

		return alist;
	}

	@Override
	public void update(MemberVO memberVO) {
		StringBuffer str = new StringBuffer();
		str.append("update member set ")
				.append("passwd = ?, name = ?, birth = ?, phone = ?, gender = ? ")
				.append("where id = ?");

		this.jdbcTemplate.update(str.toString(), memberVO.getPasswd(),
				memberVO.getName(), memberVO.getBirth(), memberVO.getPhone(),
				memberVO.getGender(), memberVO.getId());

	}

	@Override
	public void delete(String id) {

		this.jdbcTemplate.update("delete from member where id = ?", id);
	}

	@Override
	public String findId(String name, String phone) {
		String id = null;
		StringBuffer str = new StringBuffer();
		str.append("select id from member where name=? and phone=?");

		id = this.jdbcTemplate.queryForObject(str.toString(),
				new Object[]{name, phone}, String.class);
		return id;
	}

	@Override
	public String findPasswd(String id, String name, String phone) {
		String passwd = null;
		StringBuffer str = new StringBuffer();
		str.append("select passwd from member where id=? and name=? and phone=?");

		passwd = this.jdbcTemplate.queryForObject(str.toString(),
				new Object[]{id, name, phone}, String.class);
		return passwd;
	}

}
