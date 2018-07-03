package com.kh.myapp.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.member.service.MemberService;
import com.kh.myapp.member.vo.IdChkGrp;
import com.kh.myapp.member.vo.IdPwdChk;
import com.kh.myapp.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory
			.getLogger(MemberController.class);

	@Autowired(required = true)
	@Qualifier("memberServiceImplXML")
	MemberService memberService;

	@RequestMapping("/memberJoin")
	public void memberJoin(Model model) {
		model.addAttribute("memberVO", new MemberVO());
	}

	@RequestMapping(value = "/memberJoinOK", method = RequestMethod.POST)
	public String memberJoinOK(@Valid MemberVO memberVO, BindingResult result) {
		if (result.hasErrors()) {
			logger.info("회원가입시 오류 발생~!!");
			return "/member/memberJoin";
		} else {
			memberService.memberInsert(memberVO);
		}
		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "/memberModify/{id:.+}") // get방식 대신 스프링에서 지원하는 방식사용
	public String memberModify(@PathVariable String id, Model model) {
		System.out.println("아이디" + id);
		logger.info("아이디" + id);
		model.addAttribute("memberVO", memberService.getByMemberID(id));
		return "/member/memberModify";
	}

	@RequestMapping(value = "/memberModifyOK")
	public String memberModifyOK(@Valid MemberVO memberVO, BindingResult result) {
		if (result.hasErrors()) {
			return "/member/memberModify";
		} else {
			memberService.memberUpdate(memberVO);
			return "redirect:/member/memberList";
		}
	}

	@RequestMapping(value = "/memberDelete/{id:.+}")
	public String memberDelete(@PathVariable String id, Model model) {
		if (memberService.getByMemberID(id) != null) {
			memberService.memberDelete(id);
		} else {

		} ;
		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "/memberList")
	public String memberList(Model model) {
		List<MemberVO> alist = memberService.getMemberAll();
		model.addAttribute("memberVOS", alist);
		return "/member/memberList";
	}

	@RequestMapping(value = "/findId")
	public String findId(Model model) {
		model.addAttribute("idpwdchk", new IdPwdChk());
		return "/member/findId";
	}

	@RequestMapping(value = "/findIdOK", method = RequestMethod.POST)
	public String findIdOK(
			@ModelAttribute("idpwdchk") @Validated(IdChkGrp.class) IdPwdChk idpwdchk,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			logger.info("아이디 찾기조회 오류");
			return "/member/findId";
		} else {
			model.addAttribute("idpwdchk",
					memberService.findId(idpwdchk.getName(), idpwdchk.getPhone()));
			logger
					.info("아이디 찾기조회 성공" + idpwdchk.getName() + ":" + idpwdchk.getPhone());
		}
		return "/member/findId";
	}

}
