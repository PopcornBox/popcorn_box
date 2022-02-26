package com.spring.pjt.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.pjt.domain.User;
import com.spring.pjt.domain.UserLog;
import com.spring.pjt.service.KakaoLoginService;
import com.spring.pjt.service.UserMailSendService;
import com.spring.pjt.service.UserService;

import oracle.net.ano.Service;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private BCryptPasswordEncoder passwordEncoder; // 비밀번호를 암호화해주는 객체
	@Autowired private UserService userService; 
	@Autowired private UserMailSendService mailsender;
	@Autowired private KakaoLoginService kakaoLoginService;
	
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
//			String encodedUrl = UriUtils.encode(url, "UTF-8");
//			model.addAttribute("url", encodedUrl); // 로그인 이후 이동할 페이지를 저장
//			log.info("url: {}", encodedUrl);
			model.addAttribute("url", url); // 로그인 이후 이동할 페이지를 저장.

		} else { // AuthInterceptor를 거치지 않는 로그인의 경우 직접 url을 찾아서 저장
			String referer = request.getHeader("Referer");
			model.addAttribute("url", referer);
			log.info("url: {}", referer);
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
	    	} else if (userFromDb.getUser_key().equals("L")){ // 사용자 키값이 'L'이면
	    		msg = "비밀번호 재설정 메일이 발송되어 있습니다. 재설정까지 계정은 잠금처리 됩니다.";
	    	} else { // 사용자 키값이 'Y'도 'L'도 아니면
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
	

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public void kakaoLogin(@RequestParam("code") String code, @RequestParam("state") String state, 
			RedirectAttributes ra, HttpSession session, HttpServletResponse response) throws IOException {
		log.info("kakaologin() GET 호출 code: {}", code);
		log.info("state: {}", state);
		
		JsonNode accessToken;
		JsonNode refreshToken;
				
		// JsonNode 트리 형태로 토큰 받아옴
        JsonNode jsonToken = kakaoLoginService.getKakaoAccessToken(code, state);
        // 여러 json 객체 중 access_token, refresh_token을 가져옴
        accessToken = jsonToken.get("access_token");
        refreshToken = jsonToken.get("refresh_token");
 
        log.info("access_token : {}", accessToken);
        log.info("refresh_token : {}", refreshToken);
        
        // access_token을 통해 사용자 정보 요청
        JsonNode userInfo = kakaoLoginService.getKakaoUserInfo(accessToken);
        log.info("JsonNode userInfo: {}", userInfo);
        
        // Get id
        String id = userInfo.path("id").asText();
        String nickname = null;
        String email = null;
 
        // 사용자 정보를 카카오에서 가져옴. Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        nickname = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
 
        log.info("id : {}", id);
        log.info("nickname : {}", nickname);
        log.info("email : {}", email);
        
        User signInUser = null;        
        User user = userService.readUserByEmail(email);
        if (user != null) { // DB에 있는(회원가입한) 이메일
        	signInUser = user;
        	log.info("signInUser: {}", signInUser);
        	session.setAttribute("signInUserNickname", signInUser.getUser_nickname());
        	session.setAttribute("signInUserPosition", signInUser.getUser_position());
        	session.setAttribute("accessToken", accessToken);
        	session.setAttribute("state", state);
        } else { // DB에 없는(회원가입 안 한) 이메일        
        	session.setAttribute("email", email);
        	session.setAttribute("accessToken", accessToken);
        	session.setAttribute("state", state);
        }
	}
		
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signOut(HttpSession session) {				
		// 세션에 저장된 모든 데이터를 삭제 -> 메인 페이지로 이동
		session.invalidate();	
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/kakaologout", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogout(HttpSession session) {
		log.info("session.accessToken : {}", session.getAttribute("accessToken"));
			
		//노드에 로그아웃한 결괏값을 담아줌. 매개변수는 세션에 잇는 accessToken을 가져와 문자열로 변환
		JsonNode node = kakaoLoginService.kakaoLogout(session.getAttribute("accessToken").toString());
		// 결괏값 출력
		log.info("로그아웃 후 반환되는 아이디 : {}", node.get("id"));			
		// 세션에 저장된 모든 데이터를 삭제 -> 메인 페이지로 이동
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
		} else if (user.getUser_key().equals("Y") || user.getUser_key().equals("L")){
			String user_id = user.getUser_id();
			mailsender.mailSendWithUseId(user, request);
			msg = "아이디 찾기를 위한 메일이 발송되었습니다.";
			request.getSession().setAttribute("msg", msg);
			return "redirect:/";
		} else {
			msg = "가입시 전송된 인증메일을 확인 후, 다시 시도해주세요!";
			request.getSession().setAttribute("msg", msg);
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value = "/find_userpwd", method = RequestMethod.GET)
	public String findUserPwd() {
		log.info("findUserPwd() GET 호출");
		
		return "user/findUserPwd";
	}
	
	@RequestMapping(value = "/find_userpwd", method = RequestMethod.POST)
	public String findUserPwd(User user, Model model, HttpServletRequest request) {
		log.info("findUserPwd(user: {}) POST 호출", user);
		
		User userFromDbByEmail = userService.readUserByEmail(user.getUser_email());
		String msg = "";
		
		if (userFromDbByEmail == null || !userFromDbByEmail.getUser_id().equals(user.getUser_id())) {
			msg = "입력하신 정보와 일치하는 회원 정보가 존재하지 않습니다.";
			model.addAttribute("msg", msg);
			return "user/findUserPwd";
		} else {
			if (userFromDbByEmail.getUser_key().equals("Y") || userFromDbByEmail.getUser_key().equals("L")) {
				mailsender.mailSendWithUserPwd(userFromDbByEmail, request);
				msg = "비밀번호 재설정을 위한 메일이 발송되었습니다.";
				request.getSession().setAttribute("msg", msg);
				return "redirect:/";	
			} else {		
				msg = "가입시 발송된 인증메일을 확인후, 다시 시도해주세요!.";
				request.getSession().setAttribute("msg", msg);
				return "redirect:/";
			}
		}
		
	}
	
	@RequestMapping(value = "/key_validate", method = RequestMethod.GET)
	public String key_validateConfirm(@RequestParam("user_nickname") String user_nickname, @RequestParam("user_key") String user_key) {
		return "user/resetPwd";
	}
	
	@RequestMapping(value = "/key_validate", method = RequestMethod.POST)
	public String key_validateConfirm(User user, HttpServletRequest request) {
		
		String rawPassword = user.getUser_pwd();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		user.setUser_pwd(encryptPassword);
		
		userService.resetPwd(user);
		userService.validateKey(user);
		
		String msg = "비밀번호가 재설정 되었습니다. 재설정된 비밀번호로 로그인해주세요!";
		request.getSession().setAttribute("msg", msg);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String signInUserNickname = (String)session.getAttribute("signInUserNickname");
		String message = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		
		log.info("mypage(userNickname : {}) GET 호출", signInUserNickname);
		
		User mypageBoardResult = userService.callMypageBoardInfo(signInUserNickname);
		User mypageBoardReplyResult = userService.callMypageBoardReplyInfo(signInUserNickname);
		User mypageEventReplyResult = userService.callMypageEventReplyInfo(signInUserNickname);
		User mypageMovieReplyResult = userService.callMypageMovieReplyInfo(signInUserNickname);
//		User mypageMovieLikeResult = userService.callMypageMovieLikeInfo(signInUserNickname);
		
		// 구현부
		model.addAttribute("mypageBoardResult",mypageBoardResult);
		model.addAttribute("mypageBoardReplyResult",mypageBoardReplyResult);
		model.addAttribute("mypageEventReplyResult",mypageEventReplyResult);
		model.addAttribute("mypageMovieReplyResult",mypageMovieReplyResult);
//		model.addAttribute("mypageMovieLikeResult",mypageMovieLikeResult);
		
		
		model.addAttribute("msg", message);
	}
	
	
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public void userInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String signInUserNickname = (String) session.getAttribute("signInUserNickname");
		log.info("userInfo(user_nickname : {}) GET 호출", signInUserNickname);
		User user = userService.readUserByNickname(signInUserNickname);
		
		
		model.addAttribute("user",user);
	}
	
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public String userInfoUpdate(User user, HttpServletRequest request, Model model) {
		log.info("userInfoUpdate 호출");
		userService.userInfoUpdate(user);
		String msg = request.getParameter("msg");
		System.out.println("msg: " + msg);
		HttpSession session = request.getSession();
		session.setAttribute("signInUserNickname", user.getUser_nickname());
		
		if (msg != null) {
			session.setAttribute("msg", msg);
		}
		
		return "redirect:/user/mypage";
	}
	
	@RequestMapping(value = "/leave", method = RequestMethod.GET)
	public void leave(HttpSession session, Model model) {
		log.info("leave() GET 호출");	
		String signInUserNickname = (String) session.getAttribute("signInUserNickname");		
		User user = userService.readUserByNickname(signInUserNickname);
		
		model.addAttribute("user",user);
	}
	
	@RequestMapping(value = "/leave", method = RequestMethod.POST)
	public String leave(HttpSession session, Model model, User user) {		
		String signInUserNickname = (String) session.getAttribute("signInUserNickname");
		log.info("leave(signInUserNickname: {}) POST 호출", signInUserNickname);
		User signInUser = userService.readUserByNickname(signInUserNickname);
		
		String msg = "";
		String rawPassword = user.getUser_pwd(); 
		String encodedPassword = signInUser.getUser_pwd();
		log.info("입력된 비밀번호: {}", rawPassword);
		log.info("DB에 저장된 비밀번호: {}", encodedPassword);		
		
		if (passwordEncoder.matches(rawPassword, encodedPassword)) {
			int result = userService.deleteAccount(signInUser);
			if (result == 1) {
				session.invalidate();
				msg = "회원탈퇴가 완료되었습니다.";
				model.addAttribute("msg", msg);	
			}				
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			model.addAttribute("msg", msg);
			return "redirect:/user/leave";
		}
								
		return "redirect:/";
	}
	
	@RequestMapping(value = "/simpleRegister", method = RequestMethod.GET)
	public void simpleRegister() {
		log.info("simpleRegister() GET 호출");
	}
	
	@RequestMapping(value = "/simpleRegister", method = RequestMethod.POST)
	public void simpleRegister(User user, HttpServletRequest request, HttpSession session) {
		log.info("simpleRegister({}) POST 호출", user);
		
		// 회원가입창에 입력된 비밀번호를 읽음.
	    String rawPassword = user.getUser_pwd();
	    log.info("rawPassword: {}", rawPassword);
	    
	    // 그 비밀번호를 암호화.
	    String encryptPassword = passwordEncoder.encode(rawPassword);
	    log.info("encryptPassword: {}", encryptPassword);
	    
	    // 암호화한 비밀번호를 User 객체에 주입.
	    user.setUser_pwd(encryptPassword);
	     
		// 회원가입 메서드
		int result = userService.registerNewUser(user);
		if (result == 1) {
			User signInUser = userService.readUserByEmail(session.getAttribute("email").toString());
			session.setAttribute("signInUserNickname", signInUser.getUser_nickname());
	    	session.setAttribute("signInUserPosition", signInUser.getUser_position());
		}			
	}
	
}
