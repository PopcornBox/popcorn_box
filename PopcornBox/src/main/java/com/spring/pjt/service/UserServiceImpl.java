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

	
}
