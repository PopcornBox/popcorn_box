package com.spring.pjt.persistence;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MovieLikeDaoImpl implements MovieLikeDao {
	
	private static final Logger log = LoggerFactory.getLogger(MovieLikeDaoImpl.class);
	private static final String LIKE_NAMESPACE = "com.spring.pjt.mapper.LikeMapper";
	private static final String MOVIE_NAMESPACE = "com.spring.pjt.mapper.MovieMapper";
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
	
	@Override
	public List<Object> readAllUsers(int movie_no) {
		log.info("readAllUsers(movie_no:{}) 호출", movie_no);
		
		List<Object> objList = sqlSession.selectList(LIKE_NAMESPACE + ".selectAllUsers", movie_no);
		
		log.info("objList:{} 호출", objList);
		
		return objList;
	}
	
	@Override
	public List<Integer> selectTop() {
		log.info("selectTop5 호출");
		
		List<Integer> movie_no_list = new ArrayList<>();
		
		List<Object> objList = sqlSession.selectList(MOVIE_NAMESPACE + ".selectAll");
		for (Object obj : objList) {
			Movie movie = (Movie) obj;
			int movie_no = movie.getMovie_no();
			movie_no_list.add(movie_no);
		}
		
		Map<Integer, Integer> map = new HashMap<>();
		
		for (int movie_number : movie_no_list) {
			List<Object> userList = readAllUsers(movie_number);
			int numberOfLikes = userList.size();
			map.put(movie_number, numberOfLikes);
		}
		
		List<Integer> top_movie_list = new ArrayList<>();	
		
		ValueComparator vc = new ValueComparator(map);
		TreeMap<Integer, Integer> sorted_map = new TreeMap<>(vc);
		sorted_map.putAll(map);
		
		for (int i = 1; i < 6; i++) {
			Entry<Integer, Integer> e = sorted_map.pollFirstEntry();
			int top_movie_no = e.getKey();
			top_movie_list.add(top_movie_no);
		}
		return top_movie_list;
	}
	
	class ValueComparator implements Comparator<Integer> {
		
		Map<Integer, Integer> base;
		
		public ValueComparator(Map<Integer, Integer> base) {
			this.base = base;
		}
		
		@Override
		public int compare(Integer a, Integer b) {
			if (base.get(a) >= base.get(b)) {
				return - 1;
			} else {
				return 1;
			}
			
		}
		
	}
}
