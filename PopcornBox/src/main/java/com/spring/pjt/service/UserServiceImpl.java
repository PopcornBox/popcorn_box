package com.spring.pjt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.User;
import com.spring.pjt.persistence.UserDao;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired private UserDao userDao;
	
	@Override
	public int registerNewUser(User user) {
		log.info("registerNewUser({}) 호출", user);		
		return userDao.create(user);
	}

	@Override
	public boolean isValidId(String user_id) {
		log.info("isValidId(user_id={}) 호출", user_id);
		
		User user = userDao.checkUserId(user_id);
		if (user == null) { // DB 테이블에 해당 user_id가 없는 경우 -> 가입 가능한 아이디
			return true;
		} else { // DB 테이블에 해당 user_id가 있는 경우 -> 가입 불가능한 아이디
			return false;
		} 	
	}

	@Override
	public boolean isValidNickname(String user_nickname) {
		log.info("isValidNickname(user_nickname={}) 호출", user_nickname);
		
		User user = userDao.checkNickname(user_nickname);
		if (user == null) { // DB 테이블에 해당 user_nickname이 없는 경우 -> 가입 가능한 닉네임
			return true;
		} else { // DB 테이블에 해당 user_nickname이 있는 경우 -> 가입 불가능한 닉네임
			return false;
		} 	
	}

	@Override
	public boolean isValidEmail(String user_email) {
		log.info("isValidEmail(user_email={}) 호출", user_email);
		
		User user = userDao.checkEmail(user_email);
		if (user == null) { // DB 테이블에 해당 user_email이 없는 경우 -> 가입 가능한 이메일
			return true;
		} else { // DB 테이블에 해당 user_email이 있는 경우 -> 가입 불가능한 이메일
			return false;
		} 	
	}

	@Override
	public User checkSignIn(User user) {
		log.info("checkSignIn({}) 호출", user);		
		return userDao.checkUserId(user.getUser_id());
	}

	@Override
	public User readUserByEmail(String user_email) {
		log.info("readUserByEmail(user_email: {}) 호출", user_email);
		return userDao.checkEmail(user_email);
	}
	
	@Override
	public User readUserByNickname(String user_nickname) {
		log.info("readUserByNickname(user_nickname: {}) 호출", user_nickname);
		return userDao.readByUserNickname(user_nickname);
	}
	
	@Override
	public int resetPwd(User user) {
		log.info("resetPwd(user: {}) 호출", user);
		return userDao.resetPwd(user);
	}
	
	@Override
	public int validateKey(User user) {
		log.info("validateKey(user: {}) 호출", user);
		return userDao.alter_userKey2(user);
	}	
	
	@Override
	public void userInfoUpdate(User user) {
		log.info("userInfoUpdate(user: {}) 호출", user);
		userDao.userInfoUpdate(user);
	}

	@Override
	public int deleteAccount(User user) {
		log.info("deleteAccount({}) 호출", user);
		return userDao.delete(user);
	}
	
	// 마이 페이지 구현 서비스들
	public User callMypageBoardInfo(String user_nickname) {
		log.info("callMypageBoardInfo(userNickname :{}, user_nickname) 호출", user_nickname);
		return userDao.callMypageBoardInfo(user_nickname);
	}
	
	public User callMypageBoardReplyInfo(String user_nickname) {
		log.info("callMypageBoardReplyInfo(userNickname :{}, user_nickname) 호출", user_nickname);
		return userDao.callMypageBoardReplyInfo(user_nickname);
	}
	
	public User callMypageEventReplyInfo(String user_nickname) {
		log.info("callMypageEventReplyInfo(userNickname :{}, user_nickname) 호출", user_nickname);
		return userDao.callMypageEventReplyInfo(user_nickname);
	}
	
	public User callMypageMovieReplyInfo(String user_nickname) {
		log.info("callMypageMovieReplyInfo(userNickname :{}, user_nickname) 호출", user_nickname);
		return userDao.callMypageMovieReplyInfo(user_nickname);
	}
	
	public User callMypageMovieLikeInfo(String user_nickname) {
		log.info("callMypageMovieLikeInfo(userNickname :{}, user_nickname) 호출", user_nickname);
		return userDao.callMypageMovieLikeInfo(user_nickname);
	}
	
}
