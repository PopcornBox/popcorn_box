package com.spring.pjt.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.pjt.domain.User;
import com.spring.pjt.service.UserMailSendService;
import com.spring.pjt.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private BCryptPasswordEncoder passwordEncoder; // 비밀번호를 암호화해주는 객체
	@Autowired private UserService userService; 
	@Autowired private UserMailSendService mailsender;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		log.info("register() GET 호출");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, HttpServletRequest request) {
		log.info("register({}) POST 호출", user);
		
		// 회원가입창에 입력된 비밀번호를 읽음.
	    String rawPassword = user.getUser_pwd();
	    log.info("rawPassword: {}", rawPassword);
	    
	    // 그 비밀번호를 암호화.
	    String encryptPassword = passwordEncoder.encode(rawPassword);
	    log.info("encryptPassword: {}", encryptPassword);
	    
	    // 암호화한 비밀번호를 User 객체에 주입.
	    user.setUser_pwd(encryptPassword);
	     
		// 회원가입 메서드
		userService.registerNewUser(user);
		
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(user.getUser_email(), user.getUser_nickname(), request);
		
		String msg = "인증 이메일이 발송되었습니다. 확인 후 로그인을 해주세요!";
	    request.getSession().setAttribute("msg", msg);
		
	    return "redirect:/"; // http://localhost:8182/pjt/ 로 redirect
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserId(String user_id) {
		log.info("checkUserId(user_id={})", user_id);
		
		if (userService.isValidId(user_id)) {
			return "valid";
		} else {
			return "invalid"; 
		}			
	}
	
	@RequestMapping(value = "/checknickname", method = RequestMethod.POST)
	@ResponseBody
	public String checkNickname(String user_nickname) {
		log.info("checkNickname(user_nickname={})", user_nickname);
		
		if (userService.isValidNickname(user_nickname)) {
			return "valid";
		} else {
			return "invalid"; 
		}			
	}
	
	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(String user_email) {
		log.info("checkEmail(user_email={})", user_email);
		
		if (userService.isValidEmail(user_email)) {
			return "valid";
		} else {
			return "invalid"; 
		}			
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void signIn(String url, Model model, HttpServletRequest request) {
		log.info("signIn() GET 호출");
		
		// 로그인 실패시 띄울 메시지  
		HttpSession session = request.getSession();
		
		if (session.getAttribute("msg") != null) {
			String msg = (String) session.getAttribute("msg");
			model.addAttribute("msg", msg);
			session.removeAttribute(msg);
		}
		
	    session.invalidate();
		
		// 로그인 페이지가 요청됐을 때, 로그인 성공 후 이동할 페이지가 질의 문자열에 포함되어 있는 경우
		if (url != null && !url.equals("")) { 
			model.addAttribute("url", url); // 로그인 이후 이동할 페이지를 저장
		}
		
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public void signIn(User user, Model model) {
		log.info("signIn({}) POST 호출", user);
		
		// 로그인창에 입력된 비밀번호를 읽음.
	    String rawPassword = user.getUser_pwd();
	    log.info("rawPassword: {}", rawPassword);
	    
	    User signInUser = null;
	    String msg = "";
	    User userFromDb = userService.checkSignIn(user);
	    
	    if (userFromDb != null) { // 로그인창에 입력된 아이디가 db에 존재하면
	    	if (userFromDb.getUser_key().equals("Y")) { // 사용자 키값이 'Y'이면
	    		String encodedPassword = userFromDb.getUser_pwd(); // db에서 해당 아이디의 암호화된 비밀번호를 읽음.
		        log.info("encodedPassword: {}", encodedPassword);
		        
		        if (passwordEncoder.matches(rawPassword, encodedPassword)) { // 로그인창에 입력된 비밀번호와 db의 암호화된 비밀번호를 비교해서 일치하면
		           signInUser = userFromDb; // signInUser 객체는 null이 아님.
		        } else { // 로그인창에 입력된 비밀번호와 db의 암호화된 비밀번호를 비교해서 일치하지 않으면
		        	msg = "비밀번호가 일치하지 않습니다.";
		        }
	    	} else { // 사용자 키값이 'Y'가 아니면
	    		msg = "인증메일 확인후, 로그인을 시도해주세요!";
	    	}
	   
	    } else { // 로그인창에 입력된 아이디가 db에 존재하지 않으면
	    	msg = "존재하지 않는 아이디입니다.";
	    }
		
		log.info("signInUser: {}", signInUser); //-> 로그인 O: not null, 로그인 X: null
		log.info("로그인 msg: {}", msg); // -> 로그인 O: 빈 메시지.
		
		
		// 로그인 여부를 판단할 수 있는 정보를 Model 객체에 속성으로 저장
		model.addAttribute("signInUser", signInUser);
		model.addAttribute("msg", msg);
	}
	
//	// TODO
//	@RequestMapping(value="/signin-kakao", method=RequestMethod.GET)
//	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
//		log.info("#########" + code);
//		
//		String access_Token = kakaoService.getAccessToken(code);
//		log.info("###access_Token#### : " + access_Token);
//		return "/signin-kakao";
//	}	
	
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
		// 세션에 저장된 로그인 정보(로그인 사용자 아이디)를 제거 -> 메인 페이지로 이동
		session.removeAttribute("signInUserId");
		session.invalidate();
		
		return "redirect:/";
	}
	
	// email 인증 컨트롤러
	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_nickname") String user_nickname, @RequestParam("user_key") String key) {
		mailsender.alter_userKey_service(user_nickname, key);
		return "user/regisSuccess";
	}
	
	@RequestMapping(value = "/find_userid", method = RequestMethod.GET)
	public String findUserId() {
		log.info("findUserId() GET 호출");
		
		return "user/findUserId";
	}
	
	@RequestMapping(value = "/find_userid", method = RequestMethod.POST)
	public String findUserId(String user_email, Model model, HttpServletRequest request) {
		log.info("findUserId(email: {}) POST 호출", user_email);
		
		User user = userService.readUserByEmail(user_email);
		String msg = "";
		
		if (user == null) {
			msg = "입력하신 정보가 회원 정보와 일치하지 않습니다.";
			model.addAttribute("msg", msg);
			return "user/findUserId";
		} else {
			String user_id = user.getUser_id();
			// TODO: 실제 메일로 아이디 발송.
			
			msg = "메일을 발송했습니다.";
			request.getSession().setAttribute("msg", msg);
			return "redirect:/";
		}
		
	}
	
}
