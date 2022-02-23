package com.spring.pjt.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pjt.persistence.MovieRatingDao;

@Service
public class MovieRatingServiceImpl implements MovieRatingService {
	
	private static final Logger log = LoggerFactory.getLogger(MovieRatingServiceImpl.class);
	@Autowired private MovieRatingDao movieRatingDao;
	
	@Override
	public int insert(int movie_no, int user_no, double movie_score) {
		log.info("insert(movie_no:{}, user_no:{}, movie_score:{})", movie_no, user_no, movie_score);
		
		return movieRatingDao.insert(movie_no, user_no, movie_score);
	}
	
	@Override
	public double readScore(int movie_no, int user_no) {
		log.info("readScore(movie_no:{}, user_no:{})", movie_no, user_no);
		return movieRatingDao.readScore(movie_no, user_no);
	}
	
	@Override
	public int update(int movie_no, int user_no, double movie_score) {
		log.info("update(movie_no:{}, user_no:{}, movie_score:{})", movie_no, user_no, movie_score);
		
		return movieRatingDao.update(movie_no, user_no, movie_score);
	}

	@Override
	public int delete(int movie_no, int user_no) {
		log.info("delete(movie_no:{}, user_no:{})", movie_no, user_no);
		return movieRatingDao.delete(movie_no, user_no);
	}
	
	@Override
	public double averageScore(int movie_no) {
		log.info("averageScore(movie_no:{})", movie_no);
		
		// 해당 영화에 대한 모든 점수들을 읽어옴.
		List<Object> objList = movieRatingDao.readAllScoreByMovieNo(movie_no);
		log.info("objList:{}", objList);
		
		if (objList.size() == 0) {
			movieRatingDao.deleteAverage(movie_no);
			return 0.0;
		} else {
			double sum = 0.0;

			// 평균 계산헤서 DB에 저장하고 컨트럴러에 반환.
			for (Object obj : objList) {
				
						double score = Double.parseDouble(String.valueOf(obj));
						sum += score;
			}
			
			double average = sum / objList.size();
			log.info("average:{}", average);
			
			int result = movieRatingDao.saveAverage(average, movie_no);
			
			if (result == 1) {
				return average;
			} else {
				return 0.0;
			}
		}
	}
	
	
	@Override
	public List<Object> readAllMoives() {
			log.info("readAllMovies() 호출");
			return movieRatingDao.readAllMovies();
		}
		
	
	
}
