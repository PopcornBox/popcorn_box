package com.spring.pjt.persistence;

import java.util.List;

public interface MovieRatingDao {
	
	int insert(int movie_no, int user_no, double movie_score);
	
	double readScore(int movie_no, int user_no);

	int update(int movie_no, int user_no, double movie_score);

	int delete(int movie_no, int user_no);

	List<Object> readAllScoreByMovieNo(int movie_no);
	
	int deleteAverage(int movie_no);

	int saveAverage(double average, int movie_no);
	
	List<Object> readAllMovies();
}
