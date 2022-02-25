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
public class MovieRatingDaoImpl implements MovieRatingDao {
	
	private static final Logger log = LoggerFactory.getLogger(MovieRatingDaoImpl.class);
	private static final String RATING_NAMESPACE = "com.spring.pjt.mapper.RatingMapper";
	@Autowired private SqlSession sqlSession;
	
	@Override
	public int insert(int movie_no, int user_no, double movie_score) {
		log.info("MovieRatingDaoimpl.insert(movie_no:{}, user_no:{}, movie_score:{}) 호출", movie_no, user_no, movie_score);
	
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		map.put("movie_score", movie_score);
		
		return sqlSession.insert(RATING_NAMESPACE + ".create", map);
	}
	
	@Override
	public double readScore(int movie_no, int user_no) {
		log.info("MovieRatingDaoimpl.readScore(movie_no:{}, user_no:{}) 호출", movie_no, user_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		
		Object obj= sqlSession.selectOne(RATING_NAMESPACE + ".selectGratingRecord", map);
		
		if (obj == null) {
			return 0.0;
		} else {
			return Double.parseDouble(String.valueOf(obj));
		}
		
	}
	
	@Override
	public int update(int movie_no, int user_no, double movie_score) {
		log.info("MovieRatingDaoimpl.update(movie_no:{}, user_no:{}, movie_score:{}) 호출", movie_no, user_no, movie_score);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		map.put("movie_score", movie_score);
		
		return sqlSession.update(RATING_NAMESPACE + ".update", map);
	}

	@Override
	public int delete(int movie_no, int user_no) {
		log.info("MovieRatingDaoimpl.update(movie_no:{}, user_no:{}", movie_no, user_no);
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("user_no", user_no);
		
		return sqlSession.delete(RATING_NAMESPACE + ".delete", map);
	}
	
	@Override
	public List<Object> readAllScoreByMovieNo(int movie_no) {
		log.info("MovieRatingDaoimpl.readAllScoreByMovieNo(movie_no:{})", movie_no);
		
		return sqlSession.selectList(RATING_NAMESPACE + ".selectAllScore", movie_no);
	}
	
	
	@Override
	public int deleteAverage(int movie_no) {
		log.info("MovieRatingDaoimpl.deleteAverage(movie_no:{})", movie_no);
		return sqlSession.delete(RATING_NAMESPACE + ".deleteAverage", movie_no);
	}
	
	
	@Override
	public int saveAverage(double average, int movie_no) {
		log.info("MovieRatingDaoimpl.saveAverage(average:{}, movie_no:{})", average, movie_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("movie_no", movie_no);
		map.put("average", average);
		
		sqlSession.delete(RATING_NAMESPACE + ".deleteAverage", movie_no);
		
		return sqlSession.insert(RATING_NAMESPACE + ".insertAverage", map);
		
	}
	
	@Override
	public List<Object> readAllMovies() {
		log.info("MovieRatingDaoImpl.readAllMovies 호출");
		
		return sqlSession.selectList(RATING_NAMESPACE + ".selectAllMovies");
	}
	
	
	
}
