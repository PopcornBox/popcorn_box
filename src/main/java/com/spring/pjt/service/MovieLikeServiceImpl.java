package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.persistence.MovieLikeDao;

@Service
public class MovieLikeServiceImpl implements MovieLikeService {
	
	private static final Logger log = LoggerFactory.getLogger(MovieLikeServiceImpl.class);
	@Autowired private MovieLikeDao movieLikeDao;
	
	
	@Override
	public List<Object> readLike(int user_no) {
		log.info("readLike(user_no:{}) 호출", user_no);
		
		return movieLikeDao.readAllLIKE(user_no);
	}
	
	@Override
	public Object readLike2(int user_no, int movie_no) {
		log.info("readLike2(user_no:{}, movie_no:{}) 호출", user_no, movie_no);
		
		return movieLikeDao.readLike(user_no, movie_no);
	}
	
	@Override
	public int insertLike(int movie_no, int user_no) {
		log.info("insertLike(movie_no:{}, user_no:{}) 호출", movie_no, user_no);
		
		return movieLikeDao.insertLike(movie_no, user_no);
	}

	@Override
	public int deleteLike(int movie_no, int user_no) {
		log.info("deleteLike(movie_no:{}, user_no:{}) 호출", movie_no, user_no);
		
		return movieLikeDao.deleteLike(movie_no, user_no);
	}
	
	@Override
	public List<Object> readUsers(int movie_no) {
		log.info("readUsers(movie_no:{}) 호출", movie_no);
		
		return movieLikeDao.readAllUsers(movie_no);
	}
}
