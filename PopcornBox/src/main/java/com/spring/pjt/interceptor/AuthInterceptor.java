package com.spring.pjt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

//로그인 상태인지 아닌지(세션에 닉네임이 저장되어 있는지)를 체크해서, 
//로그인 상태이면 원래 가고자 했던 페이지로 진행
//로그인 안 한 상태이면 로그인 페이지로 redirect

public class AuthInterceptor implements HandlerInterceptor {

	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	
	// 요청 URL과 요청 방식에 매핑된 컨트롤러 메서드가 호출되기 전에
	// 요청(request)과 응답(response)를 가로채서 실행되는 메서드.
	// 요청 처리 전에 해야 할 일을 작성함.
	// 리턴 값의 의미: (1) true -> 다음 handler chain이 실행됨 (2) false: 요청 처리를 진행하지 않음
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info(">>>>> preHandle() 호출");
		
		// 로그인 상태 여부 체크: (1) 로그인 O -> 진행 (2) 로그인 X -> signin 페이지
		HttpSession session = request.getSession();
		String signInUserNickname = (String) session.getAttribute("signInUserNickname");
		if (signInUserNickname != null) { // 로그인 정보가 있으면
			log.info("로그인 닉네임: {}", signInUserNickname);
			return true; // 요청을 계속 진행
		} else { // 로그인 정보가 없으면
			log.info("로그인 안 됨.");
			
			// 요청 URL 정보를 찾아서, signin 요청에 요청 파라미터를 추가
			String reqUrl = request.getRequestURL().toString();
			log.debug("request URL: {}", reqUrl);
			
			// 질의 문자열이 있는지 확인
			String query = request.getQueryString();
			log.debug("Query String: {}", query);
			
			String reqUri = request.getRequestURI();
			log.debug("request URI: {}", reqUri);
			
			String target = "";
			// 특수기호(:, /, ?)들을 UTF-8 코드값으로 변환
			if (query == null) { // 질의 문자열(query string)이 없는 경우
				target = UriUtils.encode(reqUrl, "UTF-8");
			} else { // 질의 문자열(query string)이 있는 경우
				target = UriUtils.encode(reqUrl + "?" + query, "UTF-8");
			}
			log.debug("URI 디코딩 후: {}", target);
			
			response.sendRedirect("/pjt/user/signin?url=" + target);
			
			return false; // 기존 요청을 진행하지 않음
		}
		
	}
	
	// 컨트롤러 메서드가 리턴한 후 view(JSP 파일)에 모델 객체가 전달되기 전에 호출되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("<<<<< postHandle() 호출");	
	}
	
	// View(JSP 파일)가 호출돼서 화면(UI)이 완성된 이후 호출되는 메서드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("<<<<< afterCompletion() 호출");
	}
	
}
