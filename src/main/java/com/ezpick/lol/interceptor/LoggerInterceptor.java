package com.ezpick.lol.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerInterceptor implements HandlerInterceptor {

	// preHandle - 컨트롤러 실행 전 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("======================= preHandle =======================");
		
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		if (user == null) {
			log.warn("로그인이 필요합니다.");
			
			response.sendRedirect("/auth/login");
			return false;
		}
		
		return true;
	}

	// postHandle - 컨트롤러 실행 후 결과를 뷰로 보내기 전에 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("======================= postHandle =======================");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
