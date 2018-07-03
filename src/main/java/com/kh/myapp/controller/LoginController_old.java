/*package com.kh.myapp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.myapp.login.service.LoginService;
import com.kh.myapp.login.vo.LoginVO;
import com.kh.myapp.member.vo.MemberVO;

//@Controller
@RequestMapping("/login")
@SessionAttributes("user")
public class LoginController_old {
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController_old.class);
	
	@Autowired
	@Qualifier("loginServiceImplJDBC")
	LoginService loginService;
	
	@RequestMapping("/loginIn")
	public String logIn(Model model) {
		model.addAttribute("user", new MemberVO());
		return "/login/login";
	}
	
	@RequestMapping("/memLoginOK")
	public String memLoginOK(@Valid @ModelAttribute("user") LoginVO user, BindingResult result, Model model) {
		
		// ������ ������ �α��� �������� �ٽ� ���� ����
		if(result.hasErrors()) {
			return "login/login";
		}
		
		// ȸ������ �������� !
		LoginVO loginVO = loginService.getMember(user);
		if(loginVO != null) {
			// ȸ�������� ���ǿ� ������� model ���
			model.addAttribute("login", loginVO);
			return "redirect:/";
		} else {
			return "login/login";
		}		
	}
	
	@RequestMapping("/logOut")
	public String logOut(@ModelAttribute("login") LoginVO login, SessionStatus sessionStatus) {
		
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
}
*/