package com.spring.pjt;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.pjt.domain.Movie;
import com.spring.pjt.persistence.MovieDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" } 
)
@WebAppConfiguration
public class MovieDaoTest {

	private static final Logger log = LoggerFactory.getLogger(MovieDaoTest.class);
	
	@Autowired private  MovieDao movieDao;
	
	@Test
	public void doTest() {
//		log.info("movieDao: {}", movieDao);
//		List<Movie> list = movieDao.read();
		
		
		Movie movie = movieDao.read(1);
		log.info(movie.toString());
		
	List<Movie> list = movieDao.read(4, "TEST");
		log.info("키워드 검색 결과: {}개 행", list.size());
		
	}
}
