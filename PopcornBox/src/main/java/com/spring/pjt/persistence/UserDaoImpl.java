package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import com.spring.pjt.domain.User;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);
	private static final String USER_NAMESPACE = "com.spring.pjt.mapper.UserMapper";
	
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int create(User user) {
		log.info("create({}) 호출", user);
		return sqlSession.insert(USER_NAMESPACE + ".insert", user);
	}

	@Override
	public User checkUserId(String user_id) {
		log.info("checkUserId(userid={}) 호출", user_id);		
		return sqlSession.selectOne(USER_NAMESPACE + ".selectByUserId", user_id);
	}

	@Override
	public User checkNickname(String user_nickname) {
		log.info("checkNickname(user_nickname={}) 호출", user_nickname);		
		return sqlSession.selectOne(USER_NAMESPACE + ".selectByNickname", user_nickname);
	}

	@Override
	public User checkEmail(String user_email) {
		log.info("checkEmail(user_email={}) 호출", user_email);
		return sqlSession.selectOne(USER_NAMESPACE + ".selectByEmail", user_email);
	}

	@Override
	public User read(User user) {
		log.info("read({}) 호출", user);		
		return sqlSession.selectOne(USER_NAMESPACE + ".selectById", user);
	}
	
	@Override
	public int getKey(String user_nickname, String user_key) {
		log.info("getKey(user_nickname:{}, user_key:{}) 호출", user_nickname, user_key);
		Map<String, Object> map = new HashMap<>();
		map.put("user_nickname", user_nickname);
		map.put("user_key", user_key);
		return sqlSession.update(USER_NAMESPACE + ".getKey", map);
	}
	
	@Override
	public int alter_userKey(String user_nickname, String key) {
		log.info("alter_userKey(user_nickname:{}, key:{}) 호출", user_nickname, key);
		Map<String, Object> map = new HashMap<>();
		map.put("user_nickname", user_nickname);
		map.put("key", key);
		return sqlSession.update(USER_NAMESPACE + ".alter_userKey", map);
	}
	
	@Override
	public int alter_userKey2(User user) {
		log.info("alter_userKey2(user:{}) 호출", user);
		return sqlSession.update(USER_NAMESPACE + ".alter_userKey2", user);
	}
	
	@Override
	public User userInfo(String SignInUserNickname) {
		return sqlSession.selectOne(USER_NAMESPACE + ".userInfo", SignInUserNickname);
	}
	
	@Override
	public void userInfoUpdate(User user) {
		log.info("userInfoUpdate() 호출");
		sqlSession.update(USER_NAMESPACE + ".userInfoUpdate", user);
	}
	
	@Override
	public int lock_userKey(User user) {
		log.info("lock_userKey(user: {}) 호출", user);
		return sqlSession.update(USER_NAMESPACE + ".lock_userKey", user);
	}
	
	@Override
	public int resetPwd(User user) {
		log.info("resetPwd(user: {}) 호출", user);
		return sqlSession.update(USER_NAMESPACE + ".resetPwd", user);
	}

	@Override
	public int delete(User user) {
		log.info("delete({}) 호출", user);
		return sqlSession.delete(USER_NAMESPACE + ".delete", user);
	}

}
