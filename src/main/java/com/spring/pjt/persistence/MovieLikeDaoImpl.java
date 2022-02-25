package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MovieLikeDaoImpl implements MovieLikeDao {
	
	private static final Logger log = LoggerFactory.getLogger(MovieLikeDaoImpl.class);
	private static final String LIKE_NAMESPACE = "com.spring.pjt.mapper.LikeMapper";
	@Autowired private SqlSession sqlSession;
	
	@Override
	public List<Object> readAllLIKE(int user_no) {
		log.info("readAllLike(user_no:{}) 호출", user_no);
		
		List<Object> objList = sqlSession.selectList(LIKE_NAMESPACE + ".selectAllLike", user_no);
		
		log.info("objList:{} 호출", objList);
		
		return objList;
	}
	
	@Override
	public Object readLike(int user_no, int movie_no) {
		log.info("readLike(user_no:{}, movie_no:{}) 호출", user_no, movie_no);

		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		
		Object obj = sqlSession.selectOne(LIKE_NAMESPACE + ".selectLike", map);
		
		log.info("obj:{} 호출", obj);
		
		return obj;
	}
	
	@Override
	public int insertLike(int movie_no, int user_no) {
		log.info("insertLike(movie_no:{}, user_no:{}) 호출", movie_no, user_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		
		return sqlSession.insert(LIKE_NAMESPACE + ".insertLike", map);
	}

	@Override
	public int deleteLike(int movie_no, int user_no) {
		log.info("deleteLike(movie_no:{}, user_no:{}) 호출", movie_no, user_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		
		return sqlSession.delete(LIKE_NAMESPACE + ".deleteLike", map);
	}
}
