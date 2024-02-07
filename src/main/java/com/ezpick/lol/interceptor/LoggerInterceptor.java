package com.ezpick.lol.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ezpick.lol.domain.RoleType;
import com.ezpick.lol.domain.User;

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
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			if (user.getUserRole() == RoleType.USER) {
				if (request.getRequestURI().contains("/admin")) {
					// 일반 사용자가 관리자 경로로 들어오려고 할 경우 접근 거부
					response.sendRedirect("/error/accessDenied");
					return false;
				}
			}
		} else {
			log.warn("로그인이 필요합니다.");
			
			if (request.getRequestURI().contains("/admin")) {
				// 일반 사용자가 관리자 경로로 들어오려고 할 경우 접근 거부
				response.sendRedirect("/error/accessDenied");
				return false;
			}
			
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
