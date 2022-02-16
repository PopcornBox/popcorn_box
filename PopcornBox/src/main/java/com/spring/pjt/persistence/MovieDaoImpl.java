package com.spring.pjt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pjt.domain.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {
	private static final Logger log = LoggerFactory.getLogger(MovieDaoImpl.class);
	private static final String MOVIE_NAMESPACE = "com.spring.pjt.mapper.MovieMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Movie> read() {
		log.info("movieDaoimpl.read() 호출");

		return sqlSession.selectList(MOVIE_NAMESPACE + ".selectAll");
	}

	@Override
	public Movie read(int movie_no) {
		log.info("movieDaoimpl.read(movie_no={}) 호출", movie_no);

		return sqlSession.selectOne(MOVIE_NAMESPACE + ".selectMovieNo", movie_no);
	}

	@Override
	public List<Movie> read(int type, String keyword) {
		log.info("movieDaoImpl.read(type={}, keyword={})", type, keyword);

		Map<String, Object> params = new HashMap<>();
		params.put("type", type);
		params.put("keyword", "%" + keyword.toLowerCase() + "%");

		return sqlSession.selectList(MOVIE_NAMESPACE + ".selectByKeyword", params);
	}

}
