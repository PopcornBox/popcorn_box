package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import com.spring.pjt.domain.User;
import com.spring.pjt.mapper.EventReplyMapper;
import com.spring.pjt.mapper.MovieReplyMapper;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);
	private static final String USER_NAMESPACE = "com.spring.pjt.mapper.UserMapper";
	private static final String BOARD_REPLY_NAMESPACE="com.spring.pjt.mapper.BoardReplyMapper";
	private static final String BOARD_NAMESPACE = "com.spring.pjt.mapper.BoardMapper";
	
	@Autowired private SqlSession sqlSession;
	@Autowired private EventReplyMapper mapper;
	@Autowired private MovieReplyMapper mo_mapper;
	
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
	public User readByUserNickname(String user_nickname) {
		log.info("readByUserNickname(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".userInfoByNickname", user_nickname);
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
	public void userInfoUpdate(User user) {
		log.info("userInfoUpdate() 호출");
		Object obj_user = sqlSession.selectOne(USER_NAMESPACE + ".selectByEmail", user);
		User oldUser = (User) obj_user;
		
		List<Object> boardReplyList = sqlSession.selectList(BOARD_REPLY_NAMESPACE + ".findReplyNo", oldUser);
		for (Object obj : boardReplyList) {
			int index = (Integer) obj;
			Map<String, Object> map = new HashMap<>();
			map.put("board_reply_no", index);
			map.put("user_nickname", user.getUser_nickname());
			
			sqlSession.update(BOARD_REPLY_NAMESPACE + ".updateNickname", map);
		}
		
		
		List<Object> boardList = sqlSession.selectList(BOARD_NAMESPACE + ".findBoardNo", oldUser);
		for (Object obj : boardList) {
			int index = (Integer) obj;
			Map<String, Object> map = new HashMap<>();
			map.put("board_no", index);
			map.put("user_nickname", user.getUser_nickname());
			
			sqlSession.update(BOARD_NAMESPACE + ".updateNickname", map);
		}
		
		
		int[] eventReplyNo = mapper.findEventReplyNo(oldUser);
		for(int i = 0; i < eventReplyNo.length; i++) {
		Map<String, Object> map = new HashMap<>();
		map.put("event_reply_no", eventReplyNo[i]);
		map.put("user_nickname", user.getUser_nickname());
		mapper.updateNickname(map);
		}
		
		int[] movieReplyNo = mo_mapper.findMovieReplyNo(oldUser);
		for(int i = 0; i < movieReplyNo.length; i++) {
			Map<String, Object> newMap = new HashMap<>();
			newMap.put("movie_reply_no", movieReplyNo[i]);
			newMap.put("user_nickname", user.getUser_nickname());
			
			mo_mapper.updateNickname(newMap);		
		}
		
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
	
	// 마이페이지 구현 DAO 
	@Override
	public User callMypageBoardInfo(String user_nickname) {
		log.info("callMypageBoardInfo(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".mypageBoardInfo", user_nickname);
	}
	
	@Override
	public User callMypageBoardReplyInfo(String user_nickname) {
		log.info("callMypageBoardReplyInfo(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".mypageBoardReplyInfo", user_nickname);
	}
	
	@Override
	public User callMypageEventReplyInfo(String user_nickname) {
		log.info("callMypageEventReplyInfo(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".mypageEventReplyInfo", user_nickname);
	}
	
	@Override
	public User callMypageMovieReplyInfo(String user_nickname) {
		log.info("callMypageMovieReplyInfo(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".mypageMovieReplyInfo", user_nickname);
	}
	
	@Override
	public User callMypageMovieLikeInfo(String user_nickname) {
		log.info("callMypageMovieLikeInfo(user_nickname={}) 호출", user_nickname);
		return sqlSession.selectOne(USER_NAMESPACE + ".mypageMovieLikeInfo", user_nickname);
	}
	
}
