package com.kh.myapp.member.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class IdPwdChk {
	@NotNull(groups = PwdChkGrp.class)
	@Pattern(regexp = "^[\\w=\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message = "이메일 형식이 아닙니다")
	private String id;

	@NotNull(groups = {IdChkGrp.class, PwdChkGrp.class})
	@Size(min = 3, max = 20, message = "이름은 3~20자리")
	private String name;

	@NotNull(groups = {IdChkGrp.class, PwdChkGrp.class})
	private String phone;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "IdPwdChk [id=" + id + ", name=" + name + ", phone=" + phone + "]";
	}

}
