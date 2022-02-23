package com.spring.pjt.service;

import java.util.List;

public interface MovieRatingService {
	
	int insert(int movie_no, int user_no, double movie_score);
	double readScore(int movie_no, int user_no);
	int update(int movie_no, int user_no, double movie_score);
	int delete(int movie_no, int user_no);
	double averageScore(int movie_no);
	List<Object> readAllMoives();
	

}
