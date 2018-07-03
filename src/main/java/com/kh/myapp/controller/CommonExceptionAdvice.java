package com.kh.myapp.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@Component
//@ControllerAdvice // 현재 글래스가 컨트롤러에서 발생하는 Exception을 전문적으로 처리하는 클래스임을 알려줌
public class CommonExceptionAdvice {

//	private static final Logger logger = LoggerFactory
//			.getLogger(CommonExceptionAdvice.class);

	@ExceptionHandler(Exception.class)
	private ModelAndView err(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/err_exception");
		mav.addObject("excption", e);
		return mav;
	}
}
