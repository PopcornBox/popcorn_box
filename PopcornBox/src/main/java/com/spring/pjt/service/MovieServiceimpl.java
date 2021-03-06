package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.domain.Movie;
import com.spring.pjt.persistence.MovieDao;

@Service
public class MovieServiceimpl implements MovieService{

	private static final Logger log = LoggerFactory.getLogger(MovieServiceimpl.class);
	
	@Autowired private MovieDao movieDao;
	
	@Override
	public List<Movie> select() {
		log.info("select() 호출");

		return movieDao.read();
	}

	@Override
	public Movie select(int movie_no) {
		log.info("select(movie_no={}) 호출", movie_no);
		
		Movie movie = movieDao.read(movie_no);
		return movie;
		
	}
	
	@Override
	public List<Movie> select(int searchType, String searchKeyword) {
		log.info("select(searchType={}, searchType={})", searchType, searchKeyword);
		
		return movieDao.read(searchType, searchKeyword);
	}

}
