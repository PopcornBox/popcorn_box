package com.spring.pjt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

import com.spring.pjt.domain.User;

//signin POST 방식 컨트롤러 메서드가 리턴 후 
//로그인 성공이면 가고자 했었던 url로 이동
//로그인 실패이면 다시 signin GET 요청으로 redirect

public class SignedInInterceptor implements HandlerInterceptor {
	private static final Logger log = LoggerFactory.getLogger(SignedInInterceptor.class);
			
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("<<<<< postHandle() 호출");
//		log.info("      handler: {}", handler);
//		log.info("      modelAndView: {}", modelAndView);
//		log.info("      session: {}", request.getSession());
		
		HttpSession session = request.getSession(); // 세션 생성		
		
		if (request.getMethod().equals("GET")) {
			log.info("req uri: {}", request.getRequestURI());
			if (!request.getRequestURI().equals("/pjt/user/kakaologin")) { // 카카오 로그인이 아니면
				return; // GET 방식에서는 interceptor가 할 일이 없음.(로그인 페이지 form을 보여줌)
			} else { // 카카오 로그인이면					
				if (session.getAttribute("signInUserNickname") != null) { 
					log.info("signInUserNickname : {}", session.getAttribute("signInUserNickname"));
					log.info("signInUserPosition : {}", session.getAttribute("signInUserPosition"));
					log.info("accessToken : {}", session.getAttribute("accessToken"));
					log.info("state : {}", session.getAttribute("state"));
					
					// 원래 이동하려고 했던 페이지(state)로 redirect
					String state = (String) session.getAttribute("state");
					if (state != null && !state.equals("")) {
						response.sendRedirect(state);
						session.removeAttribute(state); // 이후 필요 없으므로 세션에서 삭제
						log.info("state 제거 후 session.state : {}", session.getAttribute(state));
					} else {
						response.sendRedirect("/pjt");
					}
					return;
					
				} else { // 회원가입되지 않은 이용자는 간편가입으로 이동
					log.info("email : {}", session.getAttribute("email"));
					response.sendRedirect("/pjt/user/simpleRegister");
					return;
				}
				
			}
		}
		
		log.info("req uri: {}", request.getRequestURI());
		
		if (!request.getRequestURI().equals("/pjt/user/simpleRegister")) { // 간편가입 후 로그인이 아니면
			// 로그인 성공 후 이동할 페이지(input type="hidden"에서 찾음)
			String targetUrl = request.getParameter("url");
			log.info("targetUrl: {}" , targetUrl);
			
			Object user = modelAndView.getModel().get("signInUser");
			if (user != null) { // 테이블에 아이디/비밀번호가 일치하는 사용자가 있는 경우 -> 로그인 성공
				// 세션에 로그인 사용자 닉네임, 등급 저장
				session.setAttribute("signInUserNickname", ((User) user).getUser_nickname());
				session.setAttribute("signInUserPosition", ((User) user).getUser_position());
				log.info((String) session.getAttribute("signInUserNickname"));
			    log.info((String) session.getAttribute("signInUserPosition"));
				
				// 원래 이동하려고 했던 페이지(targetUrl)로 redirect
				if (targetUrl != null && !targetUrl.equals("")) {
					response.sendRedirect(targetUrl);
				} else {
					response.sendRedirect("/pjt");
				}
				
			} else { // 테이블에 아이디/비밀번호가 일치하는 사용자가 없는 경우 -> 로그인 실패 
				// 로그인과 관련된 메시지를 세션에 저장.
				String msg = (String) modelAndView.getModel().get("msg");
				if (msg != "") {
					session.setAttribute("msg", msg);
				}
				// 로그인 페이지(signin GET)로 redirect
				response.sendRedirect("/pjt/user/signin?url=" + UriUtils.encode(targetUrl, "UTF-8"));
			}
			
		} else { // 간편가입 후 자동 로그인의 경우
			if (session.getAttribute("signInUserNickname") != null) { 
				log.info("signInUserNickname : {}", session.getAttribute("signInUserNickname"));
				log.info("signInUserPosition : {}", session.getAttribute("signInUserPosition"));
				log.info("accessToken : {}", session.getAttribute("accessToken"));
				log.info("state : {}", session.getAttribute("state"));
				
				// 원래 이동하려고 했던 페이지(state)로 redirect
				String state = (String) session.getAttribute("state");
				if (state != null && !state.equals("")) {
					response.sendRedirect(state);
					session.removeAttribute(state); // 이후 필요 없으므로 세션에서 삭제
				} else {
					response.sendRedirect("/pjt");
				}
				return;
			}
				
		}
		
	}
}
